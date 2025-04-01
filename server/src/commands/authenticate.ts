import { AuthenticationService } from '../services/authentication';
import { getCurrentBranch } from './getCurrentBranch';

interface CommandResponse {
  success: boolean;
  message: string;
}

export async function handleAuthenticate(
  args: any[],
  authService: AuthenticationService | null
): Promise<CommandResponse> {
  if (!args || args.length !== 3) {
    throw new Error('Invalid arguments for authenticate command');
  }

  const [base_url, client_id, client_secret] = args as string[];
  
  try {
    if (!authService) {
      authService = new AuthenticationService(base_url, client_id, client_secret);
    } else {
      await authService.updateCredentials(base_url, client_id, client_secret);
    }

    const credentials = { base_url, client_id, client_secret };
    const success = await authService.testConnection(credentials);
    
    if (success) {
      await authService.updateCredentials(credentials.base_url, credentials.client_id, credentials.client_secret);
      const branch_name = await getCurrentBranch();
      console.log('branch_name', branch_name);
      return { success: true, message: 'Successfully authenticated with Looker' };
    } else {
      return { success: false, message: 'Failed to authenticate with Looker' };
    }
  } catch (error) {
    console.error('Authentication error:', error);
    return { success: false, message: `Authentication failed: ${error instanceof Error ? error.message : String(error)}` };
  }
} 