import * as fs from "fs";
import * as path from "path";
import { URI } from "vscode-uri";
import { WorkspaceModel } from "../models/workspace";
import { VALID_EXTENSIONS_GLOB } from "../schemas/constants";
import { AuthenticationService } from "../services/authentication";

interface CommandResponse {
    success: boolean;
    message?: string;
}

export async function handleSyncAllFilesLocalToLooker(
    authService: AuthenticationService,
    project_name: string,
    workspaceModel: WorkspaceModel,
): Promise<CommandResponse> {
    try {
        const sdk = await authService.getSDK();
        const baseDir = process.cwd();

        // Get matching files from client
        const matchedFiles = await workspaceModel.getMatchingFiles(
            baseDir,
            VALID_EXTENSIONS_GLOB,
        );

        for (const filePath of matchedFiles) {
            const fsPath = URI.parse(filePath).fsPath;
            const content = await fs.promises.readFile(fsPath, "utf-8");
            const relPath = path.relative(baseDir, fsPath);

            try {
                await sdk.updateFile(project_name, { path: relPath, content });
            } catch (error) {
                console.error(`Update failed for ${relPath}.`);
                try {
                    const dirname = path.dirname(relPath);
                    if (dirname !== ".") {
                        const parts = dirname.split("/");
                        let currentPath = "";
                        for (const part of parts) {
                            currentPath = currentPath ? `${currentPath}/${part}` : part;
                            try {
                                await sdk.createProjectDirectory(project_name, currentPath);
                            } catch (dirError) {
                                // Ignore error if directory already exists or creation fails
                                console.log(`Directory check/create failed for ${currentPath}`);
                            }
                        }
                    }
                    await sdk.createFile(project_name, {
                        path: relPath,
                        content,
                    });
                } catch (createError) {
                    console.error(`Failed to create ${relPath}:`, createError);
                }
            }
        }

        return { success: true, message: "Synced all files" };
    } catch (error) {
        console.error("Failed to sync files:", error);
        return { success: false, message: `Failed to sync files: ${error}` };
    }
}

export async function handleSyncAllFilesLookerToLocal(
    authService: AuthenticationService,
    project_name: string | undefined,
    workspaceModel: WorkspaceModel,
): Promise<CommandResponse> {
    try {
        const sdk = await authService.getSDK();
        
        if (!project_name) {
            const response = await workspaceModel.connection.sendRequest("lookml/showInputBox", {
                prompt: "Enter Looker project name to sync to local workspace"
            });
            
            if (!response) {
                return { success: true, message: "Sync cancelled by user" };
            }
            project_name = response as string;
        }
        
        const baseDir = process.cwd();
        
        // Get all files from source project
        const files = await sdk.allProjectFiles(project_name);
        
        for (const file of files) {
            if (!file.path || !file.type) continue;
            
            // Skip directories in listing, we only want files
            if (file.type === "directory") continue;
            
            const filePath = file.path;
            
            try {
                // Get content from source
                const content = await sdk.getFileContent(project_name, filePath);
                
                const fsPath = path.join(baseDir, filePath);
                const dirname = path.dirname(fsPath);
                
                // Ensure local directory exists
                await fs.promises.mkdir(dirname, { recursive: true });
                
                // Write content to local file
                await fs.promises.writeFile(fsPath, content, "utf-8");
                
            } catch (error) {
                console.error(`Failed to process file ${filePath}:`, error);
            }
        }
        
        return { success: true, message: "Synced all files from Looker to Local" };
    } catch (error) {
        console.error("Failed to sync files Looker to Local:", error);
        return { success: false, message: `Failed to sync files Looker to Local: ${error}` };
    }
}
