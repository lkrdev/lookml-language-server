import { AuthenticationService } from "../services/authentication";

interface CommandResponse {
  success: boolean;
  message: string;
}

export async function handleSwitchToDev(
  authService: AuthenticationService,
  args: {
    project_name: string;
    branch_name: string;
  }
): Promise<CommandResponse> {
  if (!args.branch_name?.length) {
    throw new Error("Branch name not found");
  }
  try {
    const sdk = await authService.getSDK();
    await sdk.update_session({
      workspace_id: "dev",
    });
  } catch (error) {
    console.error("Error switching to dev branch:", error);
    return { success: false, message: "Error switching to dev branch" };
  }

  return { success: true, message: "Successfully switched to dev branch" };
}
