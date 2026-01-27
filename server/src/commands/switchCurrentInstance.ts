import { AuthenticationService } from "../services/authentication";
import { listAuthTokens, updateCurrentInstance } from "../utils/sqlite";

interface CommandResponse {
  success: boolean;
  message?: string;
}

export async function handleSwitchCurrentInstance(
  authService: AuthenticationService,
  current_instance: string,
): Promise<CommandResponse> {
  try {
    const instances = await listAuthTokens();
    if (instances.length === 0) {
      return {
        success: false,
        message: "No instances found",
      };
    } else {
      const instance = instances.find(
        (instance) => instance.instance_name === current_instance,
      );
      if (!instance) {
        return {
          success: false,
          message: "Instance not found",
        };
      } else {
        await updateCurrentInstance(instance.instance_name);
        try {
          // Reset internal state to ensure we load the new instance
          authService.auth_record = null;
          const sdk = await authService.getSDK();
          const me = await sdk.ok(sdk.me());
          const message = [
            `Switched to ${instance.instance_name}.`,
            `Hello ${me.display_name}!`,
          ];
          if (instance.use_production) {
            message.push(
              `This login is in production. Pushing LookML to Looker, may not work as expected.`,
            );
          } else {
            message.push(`This login is in development mode.`);
          }
          return {
            success: true,
            message: message.join(" "),
          };
        } catch (error: any) {
          console.error("Error validating new instance connection:", error);
          return {
            success: false,
            message: `Instance switched, but failed to connect: ${
              error.message || error
            }`,
          };
        }
      }
    }
  } catch (error) {
    console.error("Error fetching instances:", error);
    return {
      success: false,
      message: "Failed to fetch instances",
    };
  }
}
