import { Looker40SDK } from '@looker/sdk';
import { ApiSettings } from '@looker/sdk-rtl';
import { NodeCryptoHash, NodeTransport } from '@looker/sdk-node';
import { NodeOAuthSession } from './oauth';
import open from 'open';
import * as http from 'http';
import * as url from 'url';
import { getValidAuthToken } from '../../utils/sqlite';

interface LookerOAuthConfig {
    base_url: string;
    client_id: string;
}

export type AuthenticationState = "requested" | "authenticated" | "failed";

export class AuthenticationService {
    private static readonly DEFAULT_PORT = 8000;
    private static readonly DEFAULT_CALLBACK_PATH = '/callback';
    private sdk: Looker40SDK | null = null;
    private oauthSession: NodeOAuthSession | null = null;
    private server: http.Server | null = null;

    private setupHttpServer() {
        this.server = http.createServer(async (req, res) => {
            const parsedUrl = url.parse(req.url!, true);
            
            if (parsedUrl.pathname === AuthenticationService.DEFAULT_CALLBACK_PATH) {
                try {
                    if (!this.oauthSession) {
                        throw new Error('OAuth session not initialized');
                    }

                    const code = parsedUrl.query.code as string;
                    console.log("CODE", code);
                    if (!code) {
                        throw new Error('No authorization code received');
                    }

                    await this.oauthSession.login(code);
                    this.sdk = new Looker40SDK(this.oauthSession);

                    res.writeHead(200, { 'Content-Type': 'text/html' });
                    res.end('Authentication successful! You can close this window.');
                    this.stopServer();
                } catch (error) {
                    console.error('OAuth callback error:', error);
                    res.writeHead(500, { 'Content-Type': 'text/html' });
                    res.end('Authentication failed. Please try again.');
                    this.stopServer();
                }
            } else {
                res.writeHead(404, { 'Content-Type': 'text/html' });
                res.end('Not found');
            }
        });
    }

    private startServer(): Promise<void> {
        return new Promise((resolve, reject) => {
            this.server = http.createServer();
            this.setupHttpServer();
            
            this.server.listen(AuthenticationService.DEFAULT_PORT, () => {
                console.log(`OAuth callback server listening on port ${AuthenticationService.DEFAULT_PORT}`);
                resolve();
            }).on('error', (err: Error) => {
                console.error('Failed to start OAuth callback server:', err);
                reject(err);
            });
        });
    }

    private stopServer() {
        if (this.server) {
            this.server.close();
            this.server = null;
        }
    }

    public async initializeOAuth(config: LookerOAuthConfig): Promise<AuthenticationState> {
        const redirect_uri = `http://localhost:${AuthenticationService.DEFAULT_PORT}${AuthenticationService.DEFAULT_CALLBACK_PATH}`;

        // Check for a valid token in the database first
        const existing = await getValidAuthToken(config.client_id, config.base_url);
        if (existing) {
            // If a valid token exists, initialize the SDK and session with it
            const settings = new ApiSettings({ base_url: config.base_url });
            settings.readConfig = () => ({
                looker_url: config.base_url,
                client_id: config.client_id,
                redirect_uri
            });

            this.oauthSession = new NodeOAuthSession({
                settings,
                transport: new NodeTransport(settings),
                crypto: new NodeCryptoHash(),
            });
            // Manually set the token
            this.oauthSession.activeToken.access_token = existing.access_token;
            this.oauthSession.activeToken.refresh_token = existing.refresh_token;
            this.oauthSession.activeToken.token_type = existing.token_type;
            if (existing.expires_at) {
                this.oauthSession.activeToken.expiresAt = new Date(existing.expires_at);
            }
            this.sdk = new Looker40SDK(this.oauthSession);
            return "authenticated";
        }
        try {
            const settings = new ApiSettings({
                base_url: config.base_url,
            });

            settings.readConfig = () => ({
                looker_url: config.base_url,
                client_id: config.client_id,
                redirect_uri
            });

            // Initialize OAuth session
            this.oauthSession = new NodeOAuthSession({
                settings,
                transport: new NodeTransport(settings),
                crypto: new NodeCryptoHash(),
            });

            // Start the callback server
            await this.startServer();

            // Generate auth URL and open browser
            const authUrl = await this.oauthSession.createAuthCodeRequestUrl(
                'cors_api',
                'looker_api'
            );

            await open(authUrl);

            return "requested";
        } catch (error) {
            console.error('OAuth initialization failed:', error);
            this.sdk = null;
            this.oauthSession = null;
            this.stopServer();
            throw error;
        }
    }

    public async testConnection(config: LookerOAuthConfig): Promise< AuthenticationState> {
        try {
            const response =await this.initializeOAuth(config);
            if (response === "requested") {
                return "requested";
            }
            const sdk = this.getSDK();
            if (!sdk) {
                return "failed";
            }

            // Verify connection by fetching user info
            await sdk.ok(sdk.me());
            return "authenticated";
        } catch (error) {
            console.error('Failed to connect to Looker:', error);
            return "failed";
        }
    }

    public async resetToRemote(project_name: string): Promise<void> {
        console.log("resetToRemote project_name", project_name);
        const sdk = this.getSDK();
        if (!sdk) {
            throw new Error('SDK not initialized');
        }
        try {
            await sdk.ok(sdk.reset_project_to_remote(project_name));
        } catch (error) {
            console.error(`Failed to reset to remote (${project_name}):`, error);
        }
    }

    public getSDK(): Looker40SDK {
        if (!this.sdk) {
            throw new Error('SDK not initialized');
        }
        return this.sdk;
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