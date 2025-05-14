import { AuthenticationService } from "../services/authentication";

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
    const url = await sdk.ok(
      sdk.create_embed_url_as_me({
        target_url: `${args.base_url}/explore/${args.model_name}/${args.explore_name}`,
      })
    );
    return { success: true, url: url.url || "" };
  } catch (error) {
    console.error("Error getting dev branch:", error);
    return { success: false, message: "Error getting dev branch" };
  }
}
