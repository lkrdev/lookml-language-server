import { AuthenticationService } from "../services/authentication";

interface CommandResponse {
  success: boolean;
  message?: string;
}

export async function handleValidateProject(
  authService: AuthenticationService,
  args: {
    project_name: string;
  },
): Promise<CommandResponse> {
  if (!args.project_name?.length) {
    throw new Error("Invalid arguments for validateProject command");
  }
  return authService.validateProject(args.project_name);
}
