import { exec } from 'child_process';
import { promisify } from 'util';

const execAsync = promisify(exec);

interface CommandResponse {
  success: boolean;
  branch_name?: string;
  message?: string;
}

export async function getCurrentBranch(): Promise<CommandResponse> {
  try {
    // Get the current working directory
    const cwd = process.cwd();
    
    // Execute git rev-parse --abbrev-ref HEAD to get the current branch
    const { stdout } = await execAsync('git rev-parse --abbrev-ref HEAD', { cwd });
    const branch = stdout.trim();
    
    if (!branch) {
      return { success: false, message: 'No active branch found' };
    }

    return { success: true, branch_name: branch };
  } catch (error) {
    console.error('Error getting Git branch:', error);
    return { success: false, message: 'Error getting Git branch' };
  }
}

