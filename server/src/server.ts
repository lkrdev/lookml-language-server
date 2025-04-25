import {
  createConnection,
  Definition,
  DefinitionParams,
  DocumentSymbolParams,
  ExecuteCommandParams,
  InitializeParams,
  InitializeResult,
  Position,
  ProposedFeatures,
  SymbolInformation,
  TextDocuments,
  TextDocumentSyncKind,
} from "vscode-languageserver/node";

import { TextDocument } from "vscode-languageserver-textdocument";
import { parseFiles } from "lookml-parser";
// Import providers
import { CompletionProvider } from "./providers/completion";
import { DiagnosticsProvider } from "./providers/diagnostics";
import { FormattingProvider } from "./providers/formatting";

import { HoverProvider } from "./providers/hover";

// Import services
import { AuthenticationService } from "./services/authentication";

// Import models
import {
  getCurrentBranch,
  handleGetDevBranch,
  handleGetExploreUrlAsMe,
  handleSwitchToBranchAndPull,
  handleSwitchToDev,
} from "./commands";
import { WorkspaceModel } from "./models/workspace";
import { Logger } from "./utils/logger";

// Create a connection for the server
const connection = createConnection(ProposedFeatures.all);

// Initialize logger
Logger.initialize(connection);
const logger = Logger.getInstance();

// Initialize services
let authService: AuthenticationService | null = null;

// Set up logging
logger.info(`LookML Language Server starting up`);

// Create a text document manager
const documents: TextDocuments<TextDocument> = new TextDocuments(TextDocument);

// Track document update promises
const documentUpdatePromises = new Map<string, Promise<void>>();

// Create the workspace model
const workspaceModel = new WorkspaceModel({
  connection,
});

// Create providers
const completionProvider = new CompletionProvider(workspaceModel);
const diagnosticsProvider = new DiagnosticsProvider(workspaceModel);
const formattingProvider = new FormattingProvider();
const hoverProvider = new HoverProvider(workspaceModel);

connection.onInitialize((params: InitializeParams) => {
  logger.info("LookML Language Server initializing");

  const result: InitializeResult = {
    capabilities: {
      textDocumentSync: {
        openClose: true,
        change: TextDocumentSyncKind.Incremental,
        save: {
          includeText: false
        }
      },
      // Completion capabilities
      completionProvider: {
        resolveProvider: true,
        triggerCharacters: [".", ":", "{"],
      },
      // Definition capabilities
      definitionProvider: true,
      // Hover capabilities
      hoverProvider: true,
      // Document symbols (outline) capabilities
      documentSymbolProvider: true,
      // Formatting capabilities
      documentFormattingProvider: true,
      documentRangeFormattingProvider: true,
      documentOnTypeFormattingProvider: {
        firstTriggerCharacter: "}",
        moreTriggerCharacter: ["{", "\n"],
      },
      // Execute command capability
      executeCommandProvider: {
        commands: [
          "looker.authenticate",
          "looker.remoteReset",
          "looker.switchToBranchAndPull",
          "looker.getCurrentBranch",
          "looker.getDevBranch",
          "looker.switchToDev",
          "looker.createExploreUrlAsMe",
        ],
      },
    },
  };

  return result;
});

// Initialize workspace when server is ready
connection.onInitialized(async () => {
  logger.info("LookML Language Server initialized");
  await workspaceModel.loadModel();


  // @ts-ignore
  /*const result =  await parseFiles({
    // @ts-ignore
		source:  "*.{view,model,explore}.lkml",
    // @ts-ignore  
		fileOutput: "by-name", // or "array" or "by-name". "by-name" is recommended. z
    // @ts-ignore
		transformations: {},	
		globOptions: {},
		readFileOptions: {encoding:"utf-8"},
		readFileConcurrency: 4,
		console: console
	});*/
});

// Handle document saves
documents.onDidSave(async (change) => {
  logger.info("Document saved:", change.document.uri);
  
  // Wait for any pending document updates to complete
  const updatePromise = documentUpdatePromises.get(change.document.uri);
  if (updatePromise) {
    await updatePromise;
  }

  // Update the model and validate
  await workspaceModel.loadModel();
  const diagnostics = diagnosticsProvider.validateDocument(change.document);
  connection.sendDiagnostics({ uri: change.document.uri, diagnostics });
});

// Add command handlers
connection.onExecuteCommand(async (params: ExecuteCommandParams) => {
  const { command, arguments: args } = params;
  switch (command) {
    case "looker.authenticate":
      if (!args || args.length !== 3) {
        throw new Error("Invalid arguments for authenticate command");
      }

      const [base_url, client_id, client_secret] = args as string[];

      try {
        if (!authService) {
          authService = new AuthenticationService(
            base_url,
            client_id,
            client_secret
          );
        } else {
          await authService.updateCredentials(
            base_url,
            client_id,
            client_secret
          );
        }

        const credentials = { base_url, client_id, client_secret };
        const success = await authService.testConnection(credentials);

        if (success) {
          await authService.updateCredentials(
            credentials.base_url,
            credentials.client_id,
            credentials.client_secret
          );
          return {
            success: true,
            message: "Successfully authenticated with Looker",
          };
        } else {
          return {
            success: false,
            message: "Failed to authenticate with Looker",
          };
        }
      } catch (error) {
        logger.error("Authentication error:", error);
        return {
          success: false,
          message: `Authentication failed: ${
            error instanceof Error ? error.message : String(error)
          }`,
        };
      }

    case "looker.remoteReset":
      if (!args || args.length !== 1) {
        throw new Error("Invalid arguments for remoteReset command");
      }
      const project_name = args[0] as string;
      await authService?.resetToRemote(project_name);
      return { success: true, message: "Successfully reset to remote" };

    case "looker.getDevBranch":
      if (!args || args.length !== 1) {
        throw new Error("Invalid arguments for getDevBranch command");
      }
      const { branch_name } = await handleGetDevBranch(authService!, {
        project_name: args[0] as string,
      });
      return { success: true, branch_name: branch_name };

    case "looker.switchToDev":
      if (!args || args.length !== 2) {
        throw new Error("Project name not found");
      }
      const switch_args = {
        project_name: args[0] as string,
        branch_name: args[1] as string,
      };
      const branch_response = await handleGetDevBranch(
        authService!,
        switch_args
      );
      if (branch_response.branch_name !== switch_args.branch_name) {
        throw new Error(
          `Branch name does not match. Looker ${switch_args.project_name} is on ${branch_response.branch_name} but ${switch_args.branch_name} was expected`
        );
      } else {
        return handleSwitchToDev(authService!, switch_args);
      }

    case "looker.getCurrentBranch":
      return getCurrentBranch();

    case "looker.switchToBranchAndPull":
      if (!args || args.length !== 1) {
        throw new Error("Invalid arguments for switchToBranchAndPull command");
      }
      return handleSwitchToBranchAndPull(args[0] as string);

    case "looker.createExploreUrlAsMe":
      if (!args || args.length !== 3) {
        throw new Error("Invalid arguments for createExploreUrlAsMe command");
      }
      return handleGetExploreUrlAsMe(authService!, {
        base_url: args[0] as string,
        model_name: args[1] as string,
        explore_name: args[2] as string,
      });

    default:
      throw new Error(`Unknown command: ${command}`);
  }
});

// Handle document content changes
documents.onDidChangeContent(async (change) => {
  logger.info("onDidChangeContent");

  const updatePromise = workspaceModel.updateDocument(change.document);
  documentUpdatePromises.set(change.document.uri, updatePromise);
  await updatePromise;

  setTimeout(() => {
    const diagnostics = diagnosticsProvider.validateDocument(change.document);
    connection.sendDiagnostics({ uri: change.document.uri, diagnostics });
  }, 500);
});

// Handle document closing
documents.onDidClose((event) => {
  // don't remove this as it prevents linking to the file
  //workspaceModel.removeDocument(event.document.uri);

  // Clear diagnostics
  connection.sendDiagnostics({ uri: event.document.uri, diagnostics: [] });
});

// Provide autocompletion
connection.onCompletion(async (params) => {
  const document = documents.get(params.textDocument.uri);
  if (!document) return [];

  // Wait for any pending document updates to complete
  const updatePromise = documentUpdatePromises.get(document.uri);
  if (updatePromise) {
    await updatePromise;
  }

  const result = await completionProvider.getCompletionItems(document, params);
  return result;
});

// Provide additional information for completion items
connection.onCompletionResolve((item) => {
  return completionProvider.resolveCompletionItem(item);
});

// Provide hover information
connection.onHover((params) => {
  const document = documents.get(params.textDocument.uri);
  if (!document) return null;

  return hoverProvider.getHoverInfo(document, params.position);
});

// Provide go-to-definition with support for ${view.field} references
connection.onDefinition((params: DefinitionParams): Definition | null => {
  const document = documents.get(params.textDocument.uri);
  if (!document) return null;

  const position = params.position;
  const word = getWordAtPosition(document, position);
  if (!word) return null;

  const lines = document.getText().split("\n");
  if (position.line >= lines.length) return null;
  const line = lines[position.line];

  const refRegex = /\$\{([a-zA-Z0-9_]+)\.([a-zA-Z0-9_]+)\}/g;
  let refMatch: RegExpExecArray | null;

  while ((refMatch = refRegex.exec(line)) !== null) {
    const [_, viewName, fieldName] = refMatch;
    const matchStart = refMatch.index;
    const viewStart = matchStart + 2; // after ${
    const viewEnd = viewStart + viewName.length;
    const fieldStart = viewEnd + 1; // after .
    const fieldEnd = fieldStart + fieldName.length;
    const cursor = position.character;

    const modelName = workspaceModel.getModelNameFromUri(document.uri);
    if (!modelName) continue;

    const includedViews = workspaceModel.getIncludedViewsForModel(modelName);
    if (!includedViews || !includedViews.has(viewName)) continue;

    if (cursor >= viewStart && cursor <= viewEnd) {
      const view = workspaceModel.getView(viewName);
      if (view) {
        return {
          uri: view.location.uri,
          range: view.location.range,
        };
      }
    }

    if (cursor >= fieldStart && cursor <= fieldEnd) {
      const view = workspaceModel.getView(viewName);
      if (!view) continue;
      const field = view.fields.get(fieldName);
      if (field) {
        return {
          uri: field.location.uri,
          range: field.location.range,
        };
      }
    }
  }

  // Fallback: treat word as a view name
  const view = workspaceModel.getView(word);
  if (!view) return null;

  const modelName = workspaceModel.getModelNameFromUri(document.uri);
  if (!modelName) return null;

  const includedViews = workspaceModel.getIncludedViewsForModel(modelName);
  if (!includedViews || !includedViews.has(word)) return null;

  return {
    uri: view.location.uri,
    range: view.location.range,
  };
});

// Provide document symbols for outline view
connection.onDocumentSymbol(
  (params: DocumentSymbolParams): SymbolInformation[] => {
    const document = documents.get(params.textDocument.uri);
    if (!document) return [];

    // Extract symbols from the workspace model
    const symbols: SymbolInformation[] = [];
    const uri = params.textDocument.uri;

    // TODO: Implement document symbol provider
    // This will be simplified once we implement document tracking

    return symbols;
  }
);

// Document formatting
connection.onDocumentFormatting((params) => {
  const document = documents.get(params.textDocument.uri);
  if (!document) return [];

  return formattingProvider.enhancedFormatting(document, params.options);
});

// Range formatting
connection.onDocumentRangeFormatting((params) => {
  const document = documents.get(params.textDocument.uri);
  if (!document) return [];

  return formattingProvider.formatRange(document, params.range, params.options);
});

// On-type formatting
connection.onDocumentOnTypeFormatting((params) => {
  const document = documents.get(params.textDocument.uri);
  if (!document) return [];

  return formattingProvider.formatOnType(
    document,
    params.position,
    params.ch,
    params.options
  );
});

// Helper function to get word at position
function getWordAtPosition(
  document: TextDocument,
  position: Position
): string | null {
  const text = document.getText();
  const lines = text.split("\n");

  if (position.line >= lines.length) {
    return null;
  }

  const line = lines[position.line];
  const character = position.character;

  // Find word boundaries
  let start = character;
  let end = character;

  // Find start position
  while (start > 0) {
    const char = line.charAt(start - 1);
    if (!/[a-zA-Z0-9_]/.test(char)) {
      break;
    }
    start--;
  }

  // Find end position
  while (end < line.length) {
    const char = line.charAt(end);
    if (!/[a-zA-Z0-9_]/.test(char)) {
      break;
    }
    end++;
  }

  // No word found
  if (start === end) {
    return null;
  }

  return line.substring(start, end);
}

// Make the text document manager listen on the connection
documents.listen(connection);

// Listen on the connection
connection.listen();