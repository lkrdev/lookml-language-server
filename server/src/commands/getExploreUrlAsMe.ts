import { AuthenticationService } from "../services/authentication";
import { structured_logger } from "../../utils/logger";

interface CommandResponse {
  success: boolean;
  url?: string;
  message?: string;
}

export async function handleGetExploreUrlAsMe(
  authService: AuthenticationService,
  args: {
    base_url: string;
    model_name: string;
    explore_name: string;
  }
): Promise<CommandResponse> {
  if (
    !(
      args.base_url?.length &&
      args.model_name?.length &&
      args.explore_name?.length
    )
  ) {
    throw new Error("Invalid arguments for getExploreUrlAsMe command");
  }

  try {
    const sdk = await authService.getSDK();
    let url;
    try {
      url = await sdk.ok(
        sdk.create_embed_url_as_me({
          target_url: `${args.base_url}/explore/${args.model_name}/${args.explore_name}`,
        })
      );
    } catch (sdkError) {
      structured_logger.error('Error creating embed URL as me:', sdkError);
      throw sdkError; // Re-throw to be caught by the outer catch
    }
    return { success: true, url: url.url || "" };
  } catch (error) {
    // The console.error here will catch errors from authService.getSDK() or the re-thrown sdkError
    console.error("Error in handleGetExploreUrlAsMe:", error); 
    // It might be better to use structured_logger here too, but sticking to the specific request.
    // structured_logger.error('Error in handleGetExploreUrlAsMe:', error);
    return { success: false, message: "Error creating embed URL" }; // Generic message
  }
}
