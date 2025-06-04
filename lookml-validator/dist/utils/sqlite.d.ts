export interface AuthRecord {
    instance_name: string;
    access_token: string;
    refresh_token: string;
    refresh_expires_at: string;
    token_type: string;
    expires_at: string;
    current_instance: boolean;
    base_url: string;
    use_production: 1 | 0;
}
export declare function setNewRefreshToken(instance_name: string, refresh_token: string): Promise<void>;
export declare function saveAuthToken(record: AuthRecord): Promise<AuthRecord | undefined>;
export declare function updateCurrentInstance(instance_name: string): Promise<void>;
export declare function getCurrentAuthToken(): Promise<AuthRecord | undefined>;
export declare function listAuthTokens(): Promise<Pick<AuthRecord, "instance_name" | "base_url" | "current_instance">[]>;
