import { Looker40SDK } from '@looker/sdk';
import { LookerNodeSDK, NodeSettings } from '@looker/sdk-node';
import * as fs from 'fs';
import * as os from 'os';
import * as path from 'path';

interface LookerCredentials {
    base_url: string;
    client_id: string;
    client_secret: string;
}

interface NewLookerSDK extends Looker40SDK {
  // TODO - everytime we get a new token we should switch to the dev session   
}

export class AuthenticationService {
    private static readonly CREDENTIALS_FILE = path.join(os.homedir(), '.lookml-language-server', 'credentials.json');
    private sdk: Looker40SDK | null = null;

    constructor(base_url: string, client_id: string, client_secret: string) {
        // Ensure the credentials directory exists
        const credentialsDir = path.dirname(AuthenticationService.CREDENTIALS_FILE);
        if (!fs.existsSync(credentialsDir)) {
            fs.mkdirSync(credentialsDir, { recursive: true });
        }
        this.sdk = null;
    }
    
    public async updateCredentials(base_url: string, client_id: string, client_secret: string) {
        // Set environment variables for Looker SDK
        // HACK: Set environment variables for Looker SDK
        // TODO: Fix this with a custom ApiSettings from @looker/sdk-rtl
        process.env.LOOKERSDK_BASE_URL = base_url;
        process.env.LOOKERSDK_CLIENT_ID = client_id;
        process.env.LOOKERSDK_CLIENT_SECRET = client_secret;
        const node_setting = new  NodeSettings("LOOKERSDK");
        try {
            this.sdk = LookerNodeSDK.init40(node_setting);
            const switch_to_dev = await this.sdk.ok(this.sdk.update_session({workspace_id: "dev"}));
            // const workspace = await this.sdk.ok(this.sdk.workspace("dev"));
            const session = await this.sdk.ok(this.sdk.session());
            if (session.workspace_id !== "dev") {
                throw new Error('Failed to switch to dev mode');
            }
        } catch (error) {
            process.env.LOOKERSDK_BASE_URL = "";
            process.env.LOOKERSDK_CLIENT_ID = "";
            process.env.LOOKERSDK_CLIENT_SECRET = "";
            this.sdk = null;
        }
    }

    public async testConnection({base_url, client_id, client_secret}: LookerCredentials): Promise<boolean> {
        try {
            await this.updateCredentials(base_url, client_id, client_secret);
            const sdk = this.getSDK();
            if (!sdk) {
                throw new Error('SDK not initialized');
            }
            // switch to dev mode
            const switch_to_dev = await sdk.ok(sdk.workspace("dev"));
            const check_dev = await sdk.ok(sdk.session());
            if (check_dev.workspace_id !== "dev") {
                throw new Error('Failed to switch to dev mode');
            }
            await sdk.ok(sdk.me());
            return true;
        } catch (error) {
            console.error('Failed to connect to Looker:', error);
            return false;
        }
    }

    public async resetToRemote(project_name: string): Promise<void> {
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

    public getSDK(): Looker40SDK  {
        if (!this.sdk) {
            throw new Error('SDK not initialized');
        }
        return this.sdk!;
    }
}