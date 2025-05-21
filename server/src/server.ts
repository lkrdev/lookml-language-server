import {
    createConnection,
    Definition,
    DefinitionParams,
    DocumentSymbolParams,
    ExecuteCommandParams,
    InitializeParams,
    InitializeResult,
    ProposedFeatures,
    SymbolInformation,
    TextDocuments,
    TextDocumentSyncKind,
} from "vscode-languageserver/node";

import { TextDocument } from "vscode-languageserver-textdocument";

// Import providers
import { CompletionProvider } from "./providers/completion";
import { DiagnosticsProvider } from "./providers/diagnostics";
import { FormattingProvider } from "./providers/formatting";

import { HoverProvider } from "./providers/hover";

// Import services

// Import models
import {
    getCurrentBranch,
    handleGetDevBranch,
    handleGetExploreUrlAsMe,
    handleListInstances,
    handleSwitchCurrentInstance,
    handleSwitchToBranchAndPull,
    handleSwitchToDev,
} from "./commands";
import { WorkspaceModel } from "./models/workspace";
import { DefinitionProvider } from "./providers/definition";
import { AuthenticationService } from "./services/authentication";
import { Logger } from "./utils/logger";
import { AuthRecord } from "./utils/sqlite";

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

const definitionProvider = new DefinitionProvider(workspaceModel);

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
          includeText: false,
        },
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
          "looker.remoteReset",
          "looker.switchToBranchAndPull",
          "looker.getCurrentBranch",
          "looker.getDevBranch",
          "looker.switchToDev",
          "looker.createExploreUrlAsMe",
          "looker.listInstances",
          "looker.switchInstance",
          "looker.addInstance",
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
  // reset the auth service in case tokens are expired
  authService = new AuthenticationService();
  switch (command) {
    case "looker.remoteReset":
      if (!args || args.length !== 1) {
        throw new Error("Invalid arguments for remoteReset command");
      }
      const project_name = args[0] as string;
      try {
        const reset_result = await authService.resetToRemote(project_name);
        return { success: reset_result.success, message: reset_result.message };
      } catch (error) {
        return {
          success: false,
          message: `Failed to reset to remote: ${error}`,
        };
      }

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

    case "looker.addInstance":
      if (!args || args.length !== 3) {
        throw new Error("Invalid arguments for adding an instance");
      }
      let instance_name = args[0] as string;
      let base_url = args[1] as string;
      let use_production = args[2] as AuthRecord["use_production"];
      try {
        await authService!.newInstance(instance_name, base_url, use_production);
        return {
          success: true,
          message: "Instance added",
          data: { instance_name: instance_name, base_url: base_url },
        };
      } catch (error) {
        return {
          success: false,
          message: `Failed to add instance: ${error}`,
          data: { instance_name: instance_name, base_url: base_url },
        };
      }
    case "looker.listInstances":
      return await handleListInstances();
    case "looker.switchInstance":
      if (!args || args.length !== 1) {
        throw new Error("Invalid arguments for switchInstance command");
      }
      return await handleSwitchCurrentInstance(args[0] as string);
    default:
      throw new Error(`Unknown command: ${command}`);
  }
});

// Handle document content changes
documents.onDidChangeContent(async (change) => {
  logger.info("Document changed:", change.document.uri);
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

  return definitionProvider.getDefinition(document, params.position);
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

// Helper function to get word at positi

// Make the text document manager listen on the connection
documents.listen(connection);

// Listen on the connection
connection.listen();
