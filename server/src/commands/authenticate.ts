import { AuthenticationService } from '../services/authentication';
import { getCurrentBranch } from './getCurrentBranch';

interface CommandResponse {
  success: boolean;
  message: string;
}

export async function handleAuthenticate(
  args: [string, string],
  authService: AuthenticationService | null
): Promise<CommandResponse> {
  const [base_url, client_id] = args;
  
  // Validate base URL format
  try {
    new URL(base_url);
  } catch (e) {
    return { 
      success: false, 
      message: 'Invalid base_url format. Must be a valid URL (e.g., https://company.looker.com)' 
    };
  }

  try {
    const config = {
      base_url,
      client_id,
    };

    if (!authService) {
      authService = new AuthenticationService();
    }
    
    const state = await authService.testConnection(config);

    
    if (state === "authenticated") {
      const branch_name = await getCurrentBranch();
      return { 
        success: true, 
        message: `Successfully authenticated with Looker via OAuth ( ${branch_name} )`,
      };
    }

    if (state === "requested") {
      return { 
        success: true, 
        message: 'Authentication requested' 
      };
    }

    return { 
      success: false, 
      message: 'Failed to authenticate with Looker. Please check your credentials and try again.' 
    };
  } catch (error) {
    console.error('Authentication error:', error);
    
    // Provide more specific error messages based on common failure scenarios
    let errorMessage = 'Authentication failed: ';
    
    if (error instanceof Error) {
      if (error.message.includes('ECONNREFUSED')) {
        errorMessage += 'Could not connect to Looker instance. Please check the base_url and ensure you have network access.';
      } else if (error.message.includes('code_verifier')) {
        errorMessage += 'OAuth flow was interrupted. Please try again.';
      } else if (error.message.includes('EADDRINUSE')) {
        errorMessage += 'Port 8000 is already in use. Please ensure no other authentication flows are in progress.';
      } else {
        errorMessage += error.message;
      }
    } else {
      errorMessage += String(error);
    }

    return { 
      success: false, 
      message: errorMessage
    };
  }
} 