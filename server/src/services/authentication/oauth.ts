import { IWriteApiSession } from "@looker/sdk";
import {
    AuthSession,
    AuthToken,
    IAccessToken,
    ICryptoHash,
    IError,
    IPlatformServices,
    IRequestProps,
    sdkError,
} from "@looker/sdk-rtl";
import {
    AuthRecord,
    saveAuthToken,
    setNewRefreshToken,
} from "../../utils/sqlite";

class InMemorySessionStorage {
  private storage: Map<string, string> = new Map();

  getItem(key: string): string | null {
    return this.storage.get(key) || null;
  }

  setItem(key: string, value: string): void {
    this.storage.set(key, value);
  }

  removeItem(key: string): void {
    this.storage.delete(key);
  }
}

// Replace the global sessionStorage with our implementation
const sessionStorage = new InMemorySessionStorage();

interface IAuthCodeGrantTypeParams {
  grant_type: "authorization_code";
  code: string;
  code_verifier: string;
  client_id: string;
  redirect_uri: string;
}

interface IRefreshTokenGrantTypeParams {
  grant_type: "refresh_token";
  refresh_token: string;
  client_id: string;
  redirect_uri: string;
}

export class NodeOAuthSession extends AuthSession {
  activeToken = new AuthToken();
  crypto: ICryptoHash;
  reentry = false;
  private static readonly codeVerifierKey = "looker_oauth_code_verifier";
  private static readonly apiVersion = "4.0";
  public static readonly returnUrlKey = "looker_oauth_return_url";

  constructor(services: IPlatformServices) {
    super(services.settings, services.transport);

    this.crypto = services.crypto;

    const keys: string[] = [
      "client_id",
      "redirect_uri",
      "base_url",
      "looker_url",
    ];
    const config = { ...this.settings, ...this.settings.readConfig() };

    keys.forEach((key) => {
      const value = config[key];
      if (!value) {
        throw sdkError({
          message: `Missing required configuration setting: '${key}'`,
        });
      }
    });
  }

  /**
   * merge the dynamically defined configuration values with the initial settings
   */
  readConfig() {
    return { ...this.settings, ...this.settings.readConfig() };
  }

  /**
   * Apply current auth token credentials to an HTTP request
   * @param props request properties to update
   * @returns updated request properties with auth information added
   */
  async authenticate(props: IRequestProps): Promise<IRequestProps> {
    const token = await this.getToken();
    if (token.access_token) {
      props.headers.Authorization = `Bearer ${token.access_token}`;
    }
    return props;
  }

  /**
   * Gets session storage for OAuth code verification
   * @returns saved code verifier
   */
  get code_verifier() {
    return sessionStorage.getItem(NodeOAuthSession.codeVerifierKey);
  }

  /**
   * Sets session storage for OAuth code verification
   */
  set code_verifier(value: string | null) {
    if (value === null) {
      // only clear code_verifier if it's `null`
      sessionStorage.removeItem(NodeOAuthSession.codeVerifierKey);
    } else {
      sessionStorage.setItem(NodeOAuthSession.codeVerifierKey, value);
    }
  }

  /**
   * URL to return to after login process completes
   * @returns the URL that started the OAuth login process
   */
  get returnUrl() {
    return sessionStorage.getItem(NodeOAuthSession.returnUrlKey);
  }

  /**
   * Sets the return URL for successful OAuth login
   */
  set returnUrl(value: string | null) {
    if (!value) {
      sessionStorage.removeItem(NodeOAuthSession.returnUrlKey);
    } else {
      sessionStorage.setItem(NodeOAuthSession.returnUrlKey, value);
    }
  }

  async login(code: string): Promise<any> {
    if (!this.isAuthenticated()) {
      if (!this.code_verifier) {
        return Promise.reject(
          new Error("OAuth failed: expected code_verifier to be stored")
        );
      }
      await this.redeemAuthCode(code);
      return await this.getToken();
    }
    return this.activeToken;
  }

  private async requestToken(
    body: IAuthCodeGrantTypeParams | IRefreshTokenGrantTypeParams
  ) {
    const config = this.readConfig();
    const url = new URL(config.base_url);
    // replace the entire path of the base_url because this
    // auth endpoint is independent of API version
    url.pathname = "/api/token";
    const token = await this.ok(
      this.transport.request<IAccessToken, IError>(
        "POST",
        url.toString(),
        undefined,
        body
      )
    );

    if (!token.access_token || !token.token_type || !token.expires_in) {
      throw new Error("Invalid token");
    }

    const now = Date.now();
    const now_plus_30_days = new Date(now + 30 * 24 * 60 * 60 * 1000);
    const record: AuthRecord = {
      instance_name: config.instance_name,
      access_token: token.access_token,
      refresh_token: token.refresh_token || "",
      refresh_expires_at: now_plus_30_days.toISOString(),
      token_type: token.token_type,
      expires_at: token.expires_in
        ? new Date(now + token.expires_in * 1000).toISOString()
        : "",
      current_instance: true,
      base_url: config.base_url || config.looker_url || "",
      use_production: config.use_production,
    };

    await saveAuthToken(record);
    if (body.grant_type === "authorization_code") {
      await setNewRefreshToken(config.instance_name, token.refresh_token || "");
    }

    this.activeToken.setToken(token);
    if (!(config.use_production === 1)) {
      await this.switchToDevMode(token);
    }
    return this.activeToken;
  }

  switchToDevMode(token: IAccessToken) {
    const config = this.readConfig();
    const url = new URL(config.base_url);
    url.pathname = `/api/${NodeOAuthSession.apiVersion}/session`;
    return this.ok(
      this.transport.request<IWriteApiSession, IError>(
        "PATCH",
        url.toString(),
        undefined,
        {
          workspace_id: "dev",
        },
        (init: IRequestProps) => {
          init.headers.Authorization = `Bearer ${token.access_token}`;
          return init;
        }
      )
    );
  }
  /*
     Generate an OAuth2 authCode request URL
     */
  async createAuthCodeRequestUrl(
    scope: string,
    state: string
  ): Promise<string> {
    const verifier = this.crypto.secureRandom(33);
    this.code_verifier = verifier;
    const code_challenge = await this.crypto.sha256Hash(verifier);
    const config = this.readConfig();
    const params: Record<string, string> = {
      client_id: config.client_id,
      code_challenge,
      code_challenge_method: "S256",
      redirect_uri: config.redirect_uri,
      response_type: "code",
      scope,
      state,
    };
    const url = new URL(config.looker_url);
    url.pathname = "/auth";
    url.search = new URLSearchParams(params).toString();
    return url.toString();
  }

  redeemAuthCodeBody(authCode: string, codeVerifier?: string) {
    const verifier = codeVerifier || this.code_verifier || "";
    const config = this.readConfig();
    return {
      client_id: config.client_id,
      code: authCode,
      code_verifier: verifier,
      grant_type: "authorization_code",
      redirect_uri: config.redirect_uri,
    } as IAuthCodeGrantTypeParams;
  }

  async redeemAuthCode(authCode: string, codeVerifier?: string) {
    return this.requestToken(this.redeemAuthCodeBody(authCode, codeVerifier));
  }

  async getToken() {
    if (!this.isAuthenticated()) {
      if (this.activeToken.refresh_token) {
        const config = this.readConfig();
        await this.requestToken({
          client_id: config.client_id,
          grant_type: "refresh_token",
          redirect_uri: config.redirect_uri,
          refresh_token: this.activeToken.refresh_token,
        });
      }
    }
    return this.activeToken;
  }

  isAuthenticated(): boolean {
    return this.activeToken.isActive();
  }

  async logout() {
    if (this.activeToken.access_token) {
      await this.ok(
        this.transport.request<IAccessToken, IError>(
          "DELETE",
          `/api/logout`,
          undefined,
          undefined,
          (init: IRequestProps) => {
            init.headers.Authorization = `Bearer ${this.activeToken.access_token}`;
            return init;
          }
        )
      );

      // logout destroys the access_token AND the refresh_token
      this.activeToken = new AuthToken();
      return true;
    }
    return false;
  }
}
