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
import { URI } from "vscode-uri";

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
  await workspaceModel.initialize();
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
  const updatePromise = workspaceModel.updateDocument(change.document);
  documentUpdatePromises.set(change.document.uri, updatePromise);
  await updatePromise;

  setTimeout(() => {
    const diagnostics = diagnosticsProvider.validateDocument(change.document);
    connection.sendDiagnostics({ uri: change.document.uri, diagnostics });
  }, 500);
});

documents.onDidSave(async (change) => {
  logger.info("Document saved:", change.document.uri);

  // Wait for any pending document updates to complete
  const updatePromise = documentUpdatePromises.get(change.document.uri);
  if (updatePromise) {
    await updatePromise;
  }

  // Update the model and validate
  await workspaceModel.initialize();
  const diagnostics = diagnosticsProvider.validateDocument(change.document);
  connection.sendDiagnostics({ uri: change.document.uri, diagnostics });
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

  const result = completionProvider.getCompletionItems(document, params);
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
connection.onDefinition((params: DefinitionParams): Definition | undefined => {
  const document = documents.get(params.textDocument.uri);
  if (!document) return;

  const isModelFile = workspaceModel.isModelFile(document);
  const position = params.position;
  const lineNumber = position.line;
  let word = getWordAtPosition(document, position);

  const documentText = document.getText();
  const line = documentText.split("\n")[lineNumber];
  
  // Get the exact word at cursor position
  if (!word) return;

  // Check if we're in a SQL expression
  const sqlFieldRegex = new RegExp(`\\$\\{([a-zA-Z_][a-zA-Z0-9_]*)\\.${word}\\}`);
  const sqlMatch = line.match(sqlFieldRegex);
  
  if (sqlMatch) {
    const [, viewName] = sqlMatch;
    const viewDetails = workspaceModel.getView(viewName);
    if (!viewDetails) return;

    // Check if the field exists in the view
    const fieldPosition = viewDetails.positions.dimension?.[word]?.$name?.$p ||
                         viewDetails.positions.measure?.[word]?.$name?.$p ||
                         viewDetails.positions.dimension_group?.[word]?.$name?.$p;

    if (fieldPosition) {
      const startPosition: Position = {
        line: fieldPosition[0] - 1,
        character: fieldPosition[1]
      };

      const endPosition: Position = {
        line: fieldPosition[2] - 1,
        character: fieldPosition[3]
      };

      return {
        uri: viewDetails.uri,
        range: {
          start: startPosition,
          end: endPosition
        }
      };
    }
  }

  // Check if we're in a drill_fields array
  const drillFieldsRegex = new RegExp(`drill_fields:\\s*\\[([^\\]]*)\\]`);
  const drillFieldsMatch = line.match(drillFieldsRegex);
  
  if (drillFieldsMatch) {
    const drillFields = drillFieldsMatch[1].split(',').map(f => f.trim());    
    // Find the full field reference in the line that contains our word
    const fieldRefRegex = new RegExp(`\\b([a-zA-Z_][a-zA-Z0-9_]*\\.)?${word}\\b`);
    const fieldRefMatch = line.match(fieldRefRegex);
    const fullFieldRef = fieldRefMatch ? fieldRefMatch[0] : word;
    
    if (drillFields.includes(fullFieldRef)) {
      let viewName = workspaceModel.getViewNameFromFile(document);
      if (fullFieldRef.includes(".")) {
        const fieldSplit = fullFieldRef.split(".");
        viewName = fieldSplit[0];
        word = fieldSplit[1];
      }

      // Try to find the field in the current view first
      if (viewName) {
        const currentViewDetails = workspaceModel.getView(viewName);
        if (currentViewDetails) {
          const fieldPosition = currentViewDetails.positions.dimension?.[word]?.$name?.$p ||
                               currentViewDetails.positions.measure?.[word]?.$name?.$p ||
                               currentViewDetails.positions.dimension_group?.[word]?.$name?.$p;

          if (fieldPosition) {
            const startPosition: Position = {
              line: fieldPosition[0] - 1,
              character: fieldPosition[1]
            };

            const endPosition: Position = {
              line: fieldPosition[2] - 1,
              character: fieldPosition[3]
            };

            return {
              uri: currentViewDetails.uri,
              range: {
                start: startPosition,
                end: endPosition
              }
            };
          }
        }
      }

      // If the field reference contains a dot, look in the referenced view
      if (fullFieldRef.includes('.')) {
        const [viewName, fieldName] = fullFieldRef.split('.');
        const viewDetails = workspaceModel.getView(viewName);
        console.log("viewDetails", viewDetails);
        if (viewDetails) {
          const fieldPosition = viewDetails.positions.dimension?.[fieldName]?.$name?.$p ||
                               viewDetails.positions.measure?.[fieldName]?.$name?.$p ||
                               viewDetails.positions.dimension_group?.[fieldName]?.$name?.$p;

          if (fieldPosition) {
            const startPosition: Position = {
              line: fieldPosition[0] - 1,
              character: fieldPosition[1]
            };

            const endPosition: Position = {
              line: fieldPosition[2] - 1,
              character: fieldPosition[3]
            };

            return {
              uri: viewDetails.uri,
              range: {
                start: startPosition,
                end: endPosition
              }
            };
          }
        }
      }
    }
  }

  // If not in a SQL expression or drill_fields, try to find a view reference
  const viewDetails = workspaceModel.getView(word);
  const viewName = viewDetails?.file?.$file_name;

  if (viewName) {
    const viewNamePosition = viewDetails?.positions?.$name?.$p;
    if (!viewNamePosition) return;
    
    const viewUri = viewDetails?.uri;

    if (isModelFile) {
      // make sure the view is included in the model
      const modelName = workspaceModel.getModelNameFromUri(document.uri);
      if (!modelName) return;

      const includedViewsForModel = workspaceModel.getIncludedViewsForModel(modelName);
      if (!includedViewsForModel?.has(viewName)) return;
    }

    const startPosition: Position = {
      line: viewNamePosition[0] - 1,
      character: viewNamePosition[1] - 1
    };

    const endPosition: Position = {
      line: viewNamePosition[2] - 1,
      character: viewNamePosition[3] - 1
    };

    return {
      uri: viewUri,
      range: {
        start: startPosition,
        end: endPosition
      }
    };
  }
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