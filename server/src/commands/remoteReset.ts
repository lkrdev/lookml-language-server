import { AuthenticationService } from '../services/authentication';

interface CommandResponse {
  success: boolean;
  message: string;
}

export async function handleRemoteReset(
  authService: AuthenticationService,
  args: {
    project_name: string,
  },
): Promise<CommandResponse> {
  if (!args.project_name?.length) {
    throw new Error('Invalid arguments for remoteReset command');
  }
  try {
    await authService.resetToRemote(args.project_name);
    return { success: true, message: 'Successfully reset to remote' };
  } catch (error) {
    console.error('Error resetting to remote:', error);
    return { success: false, message: 'Error resetting to remote' };
  }
} 