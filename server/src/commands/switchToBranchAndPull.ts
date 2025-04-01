import { exec } from 'child_process';
import { promisify } from 'util';

const execAsync = promisify(exec);

interface CommandResponse {
  success: boolean;
  branch_name?: string;
  message?: string;
}

export async function handleSwitchToBranchAndPull(branchName: string): Promise<CommandResponse> {
  try {
    const cwd = process.cwd();
    
    // Switch to the specified branch
    await execAsync(`git checkout ${branchName}`, { cwd });
    
    // Pull latest changes
    await execAsync('git pull', { cwd });

    return { 
      success: true, 
      branch_name: branchName,
      message: `Successfully switched to branch ${branchName} and pulled latest changes`
    };

  } catch (error) {
    console.error('Error switching branch and pulling:', error);
    return { 
      success: false, 
      message: `Error switching to branch ${branchName} and pulling: ${error}` 
    };
  }
}
