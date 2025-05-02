
interface CommandResponse {
  success: boolean;
  branch_name?: string;
  message?: string;
}

export async function handleGetDevBranch(
  authService: any,
  args: {
    project_name: string,
  }
): Promise<CommandResponse> {
  if (!args.project_name?.length) {
    throw new Error('Invalid arguments for getDevBranch command');
  }
  try {
    const sdk = await authService.getSDK();
    const branch = await sdk.ok(sdk.git_branch(args.project_name));
    return { success: true, branch_name: branch?.name || '' };
  } catch (error) {
    console.error('Error getting dev branch:', error);
    return { success: false, message: 'Error getting dev branch' };
  }
} 