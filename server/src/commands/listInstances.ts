import { listAuthTokens } from "../utils/sqlite";

interface CommandResponse {
  success: boolean;
  message?: string;
  data?: {
    instance_name: string;
    base_url: string;
    current_instance: boolean;
  }[];
}

export async function handleListInstances(): Promise<CommandResponse> {
  try {
    const instances = await listAuthTokens();
    return {
      success: true,
      data: instances.map((instance) => ({
        instance_name: instance.instance_name,
        base_url: instance.base_url,
        current_instance: instance.current_instance,
      })),
    };
  } catch (error) {
    return {
      success: false,
      message: "Failed to list instances",
    };
  }
}
