import { Looker40SDK } from "@looker/sdk";
import { NodeCryptoHash, NodeTransport } from "@looker/sdk-node";
import { ApiSettings } from "@looker/sdk-rtl";
import * as http from "http";
import * as url from "url";
import {
  AuthRecord,
  getCurrentAuthToken,
  setNewRefreshToken,
} from "../../utils/sqlite";
import { NodeOAuthSession } from "./oauth";
import { Logger } from "../../utils/logger";

export class RefreshTokenExpiredError extends Error {
  constructor(message = "Refresh token expired") {
    super(message);
    this.name = "RefreshTokenExpiredError";
  }
}

export class AuthenticationService {
  private static readonly OAUTH_TIMEOUT_MS = 5 * 60 * 1000; // 5 minutes
  private static readonly DEFAULT_PORT = 8000;
  private static readonly DEFAULT_CALLBACK_PATH = "/callback";
  private static readonly DEFAULT_CLIENT_ID = "lkr-cli";
  private static readonly DEFAULT_REDIRECT_URI = `http://localhost:${AuthenticationService.DEFAULT_PORT}${AuthenticationService.DEFAULT_CALLBACK_PATH}`;
  private sdk: Looker40SDK | null = null;
  private oauthSession: NodeOAuthSession | null = null;
  private server: http.Server | null = null;
  public client_id: string = AuthenticationService.DEFAULT_CLIENT_ID;
  public auth_record: AuthRecord | null = null;

  private async getCurrentAuthRecord(): Promise<AuthRecord> {
    if (!this.auth_record) {
      const current = await getCurrentAuthToken();
      if (!current) {
        throw new Error("No auth record found");
      }
      this.auth_record = current;
    }
    return this.auth_record;
  }

  private setupHttpServer() {
    this.server = http.createServer(async (req, res) => {
      const parsedUrl = url.parse(req.url!, true);

      if (parsedUrl.pathname === AuthenticationService.DEFAULT_CALLBACK_PATH) {
        try {
          if (!this.oauthSession) {
            throw new Error("OAuth session not initialized");
          }

          const code = parsedUrl.query.code as string;
          if (!code) {
            throw new Error("No authorization code received");
          }

          await this.oauthSession.login(code);
          this.sdk = new Looker40SDK(this.oauthSession);

          res.writeHead(200, { "Content-Type": "text/html" });
          res.end("Authentication successful! You can close this window.");
          console.log("OAuth successful, stopping server.");
          this.stopServer();
        } catch (error) {
          console.error("OAuth callback error:", error);
          res.writeHead(500, { "Content-Type": "text/html" });
          res.end("Authentication failed. Please try again.");
          console.log("OAuth failed, stopping server.");
          this.stopServer();
        }
      } else {
        res.writeHead(404, { "Content-Type": "text/html" });
        res.end("Not found");
      }
    });
  }

  private async startServer(): Promise<void> {
    return new Promise((resolve, reject) => {
      this.server = http.createServer();
      this.setupHttpServer();

      this.server
        .listen(AuthenticationService.DEFAULT_PORT, () => {
          console.log(
            "OAuth callback server started on port " +
              AuthenticationService.DEFAULT_PORT
          );
          resolve();
        })
        .on("error", (err: Error) => {
          console.error("Failed to start OAuth callback server:", err);
          reject(err);
        });
    });
  }

  private stopServer() {
    if (this.server) {
      console.log("Stopping OAuth callback server.");
      this.server.close();
      this.server = null;
    } else {
      console.log("OAuth callback server was not running or already stopped.");
    }
  }

  public async waitForOauthFlow(
    base_url: string,
    instance_name: string,
    use_production: AuthRecord["use_production"]
  ) {
    let timeoutId: NodeJS.Timeout | null = null;
    try {
      const settings = new ApiSettings({ base_url });
      settings.readConfig = () => ({
        instance_name,
        // @ts-expect-error use_production is a number 0 or 1
        use_production,
        looker_url: base_url,
        client_id: this.client_id,
        redirect_uri: AuthenticationService.DEFAULT_REDIRECT_URI,
      });
      this.oauthSession = new NodeOAuthSession({
        settings,
        transport: new NodeTransport(settings),
        crypto: new NodeCryptoHash(),
      });
      await this.startServer();

      const authUrl = await this.oauthSession.createAuthCodeRequestUrl(
        "cors_api",
        "looker_api"
      );

      const logger = Logger.getInstance();
      logger.info(
        `Please open this URL in your browser to authenticate: ${authUrl}`
      );
      logger.sendNotification("looker/oauth", { url: authUrl });
      await new Promise<void>((resolve, reject) => {
        if (this.server) {
          this.server.on("close", () => {
            if (timeoutId) clearTimeout(timeoutId);
            resolve();
          });

          timeoutId = setTimeout(() => {
            console.error("OAuth flow timed out.");
            this.stopServer();
            reject(new Error("OAuth flow timed out"));
          }, AuthenticationService.OAUTH_TIMEOUT_MS);
        } else {
          // Should not happen if startServer() succeeded
          reject(new Error("Server not initialized for OAuth flow"));
        }
      });
      if (!this.sdk) {
        // This case might be hit if the timeout occurred and sdk was not set
        // or if the server closed before the SDK could be initialized by the callback.
        if (!this.oauthSession?.activeToken) { // Check if token is missing due to timeout
          throw new Error("SDK not initialized and no active token found, possibly due to timeout or premature server close.");
        }
        // If there's an active token, it implies the callback was successful before server close/timeout
        // but this.sdk wasn't set for some reason. This path is less likely with current logic.
        throw new Error("SDK not initialized despite apparent successful OAuth flow.");
      } else {
        return await this.oauthSession.activeToken;
      }
    } catch (error) {
      console.error("OAuth initialization failed:", error);
      // Ensure server is stopped regardless of where the error originated.
      this.stopServer();
      this.sdk = null;
      this.oauthSession = null;
      // No need to call this.stopServer() again as it's already called.
      throw error;
    }
  }

  public async getNewRefreshToken(): Promise<void> {
    this.stopServer(); // Ensure any existing server is stopped
    const auth_record = await this.getCurrentAuthRecord();
    const new_token = await this.waitForOauthFlow(
      auth_record.base_url,
      auth_record.instance_name,
      auth_record.use_production
    );
    if (new_token.refresh_token) {
      await setNewRefreshToken(
        auth_record.instance_name,
        new_token.refresh_token
      );
    } else {
      throw new Error("No refresh token found");
    }
  }

  public async newInstance(
    instance_name: string,
    base_url: string,
    use_production: AuthRecord["use_production"]
  ): Promise<void> {
    this.stopServer(); // Ensure any existing server is stopped
    this.oauthSession = null;
    this.sdk = null;
    this.auth_record = null;

    try {
      await this.waitForOauthFlow(base_url, instance_name, use_production);
    } catch {
      throw new Error("No new token found");
    }
  }

  public async initializeOAuth(): Promise<void> {
    // Check for a valid token in the database first
    const existing = await this.getCurrentAuthRecord();

    if (existing) {
      // check if needs to be refreshed
      const now_plus_24_hours = new Date(Date.now() + 24 * 60 * 60 * 1000);
      if (
        !existing.refresh_expires_at ||
        new Date(existing.refresh_expires_at) < now_plus_24_hours
      ) {
        this.stopServer(); // Ensure any existing server is stopped before refresh
        try {
          await this.waitForOauthFlow(
            existing.base_url,
            existing.instance_name,
            existing.use_production
          );
        } catch {
          throw new Error("No new token found");
        }
      }
      // If a valid token exists, initialize the SDK and session with it
      const settings = new ApiSettings({ base_url: existing.base_url });
      settings.readConfig = () => ({
        instance_name: existing.instance_name,
        // @ts-expect-error use_production is a number 0 or 1
        use_production: existing.use_production,
        looker_url: existing.base_url,
        client_id: this.client_id,
        redirect_uri: AuthenticationService.DEFAULT_REDIRECT_URI,
      });

      this.oauthSession = new NodeOAuthSession({
        settings,
        transport: new NodeTransport(settings),
        crypto: new NodeCryptoHash(),
      });

      const token = {
        access_token: existing.access_token,
        refresh_token: existing.refresh_token,
        token_type: existing.token_type,
        expires_in: Math.max(
          existing.expires_at
            ? (new Date(existing.expires_at).getTime() - new Date().getTime()) /
                1000
            : 0,
          0
        ),
      };

      this.oauthSession.activeToken.setToken(token);
      await this.oauthSession.getToken();
      this.sdk = new Looker40SDK(this.oauthSession);
    } else {
      throw new Error("No valid auth record found");
    }
  }

  public async testConnection(): Promise<void> {
    try {
      const sdk = await this.getSDK();
      if (!sdk) {
        throw new Error("SDK not initialized");
      }

      // Verify connection by fetching user info
      await sdk.ok(sdk.me());
    } catch (error) {
      console.error("Failed to connect to Looker:", error);
      throw error;
    }
  }

  public async debug() {
    const sdk = await this.getSDK();
    if (!sdk) {
      throw new Error("SDK not initialized");
    }
    const me = await sdk.ok(sdk.me());
    const session = await sdk.ok(sdk.session());
    return { me, session };
  }

  public async resetToRemote(
    project_name: string
  ): Promise<{ success: boolean; message: string }> {
    const sdk = await this.getSDK();
    if (!sdk) {
      throw new Error("SDK not initialized");
    }
    try {
      await this.debug();
      const result = await sdk.reset_project_to_remote(project_name);
      if (result.ok) {
        return { success: true, message: "Successfully reset to remote" };
      } else {
        return {
          success: false,
          message: result.error.message || "Unknown error",
        };
      }
    } catch (error) {
      console.error(`Failed to reset to remote (${project_name}):`, error);
      return { success: false, message: `Failed to reset to remote: ${error}` };
    }
  }

  public async getSDK(db_auth_token?: AuthRecord): Promise<Looker40SDK> {
    // There are two ways to authenticate:
    // 1. Implicitly grabbing the token from the local sqllitedb or
    // 2. passing in a db_auth_token directly
    if (db_auth_token) {
      this.oauthSession = new NodeOAuthSession({
        settings: new ApiSettings({ base_url: db_auth_token.base_url }),
        transport: new NodeTransport(
          new ApiSettings({ base_url: db_auth_token.base_url })
        ),
        crypto: new NodeCryptoHash(),
      });
      this.sdk = new Looker40SDK(this.oauthSession);
      return this.sdk;
    } else {
      if (this.sdk) {
        return this.sdk;
      } else {
        if (!this.oauthSession) {
          await this.initializeOAuth();
        }
        if (!this.oauthSession) {
          throw new Error("OAuth session not initialized");
        } else {
          this.sdk = new Looker40SDK(this.oauthSession);
        }
        if (!this.sdk) {
          throw new Error("SDK not initialized");
        }
        return this.sdk;
      }
    }
  }

  public async logout(): Promise<void> {
    if (this.oauthSession) {
      await this.oauthSession.logout();
      this.sdk = null;
      this.oauthSession = null;
    }
  }

  public isAuthenticated(): boolean {
    return this.oauthSession?.isAuthenticated() || false;
  }
}
