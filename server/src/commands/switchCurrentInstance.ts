import { listAuthTokens, updateCurrentInstance } from "../utils/sqlite";

interface CommandResponse {
  success: boolean;
  message?: string;
}

export async function handleSwitchCurrentInstance(
  current_instance: string
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
        (instance) => instance.instance_name === current_instance
      );
      if (!instance) {
        return {
          success: false,
          message: "Instance not found",
        };
      } else {
        await updateCurrentInstance(instance.instance_name);
        return {
          success: true,
          message: "Instance switched",
        };
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
