import { AuthenticationService } from "../services/authentication";

export async function handleGetAllProjects(
  authService: AuthenticationService,
): Promise<{ success: boolean; projects?: string[]; message?: string }> {
  try {
    const sdk = await authService.getSDK();
    const projects = await sdk.ok(sdk.all_projects("id"));
    return {
      success: true,
      projects: projects
        .map((p: any) => p.id!)
        .filter((id: any) => !!id)
        .sort(),
    };
  } catch (error) {
    console.error("Failed to get projects:", error);
    return {
      success: false,
      message: `Failed to get projects: ${error}`,
    };
  }
}
