import {
  createConnection,
  TextDocuments,
  ProposedFeatures,
  InitializeParams,
  TextDocumentSyncKind,
  InitializeResult,
  DocumentSymbolParams,
  SymbolInformation,
  Position,
  DefinitionParams,
  Definition,
} from "vscode-languageserver/node";

import { TextDocument } from "vscode-languageserver-textdocument";
import * as path from "path";
import * as fs from "fs";

// Import providers
import { CompletionProvider } from "./providers/completion";
import { DiagnosticsProvider } from "./providers/diagnostics";
import { FormattingProvider } from "./providers/formatting";
import { HoverProvider } from "./providers/hover";

// Import models
import { WorkspaceModel } from "./models/workspace";

// Create a connection for the server
const connection = createConnection(ProposedFeatures.all);

// Set up logging
connection.console.info(`LookML Language Server starting up`);

// Create direct file logging for debugging
try {
  const logDir = path.join(__dirname, "..");
  const logFile = path.join(logDir, "lookml-server.log");
  fs.writeFileSync(logFile, `Server started at ${new Date().toISOString()}\n`);

  function logToFile(message: string) {
    try {
      const timestamp = new Date().toISOString();
      fs.appendFileSync(logFile, `[${timestamp}] ${message}\n`);
    } catch (e) {
      // Silent fail
    }
  }

  logToFile("LookML Language Server initialized");
} catch (e) {
  // Silent fail - we don't want to prevent server startup if logging fails
}

// Create a text document manager
const documents: TextDocuments<TextDocument> = new TextDocuments(TextDocument);

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
  connection.console.info("LookML Language Server initializing");

  const result: InitializeResult = {
    capabilities: {
      textDocumentSync: TextDocumentSyncKind.Incremental,
      // Completion capabilities
      completionProvider: {
        resolveProvider: true,
        triggerCharacters: [".", ":"],
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
    },
  };

  return result;
});

// Handle document content changes
documents.onDidChangeContent((change) => {
  // Update the workspace model

  workspaceModel.updateDocument(change.document);

  setTimeout(() => {
    // Run diagnostics
    const diagnostics = diagnosticsProvider.validateDocument(change.document);
    connection.sendDiagnostics({ uri: change.document.uri, diagnostics });
  }, 500);
});

// Handle document closing
documents.onDidClose((event) => {
  // Clean up the model
  connection.console.info("Remove Document");
  workspaceModel.removeDocument(event.document.uri);

  // Clear diagnostics
  connection.sendDiagnostics({ uri: event.document.uri, diagnostics: [] });
});

// Provide autocompletion
connection.onCompletion((params) => {
  const document = documents.get(params.textDocument.uri);
  if (!document) return [];

  return completionProvider.getCompletionItems(document, params);
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

// Provide go-to-definition
connection.onDefinition((params: DefinitionParams): Definition | null => {
  const document = documents.get(params.textDocument.uri);
  if (!document) return null;

  const position = params.position;
  const word = getWordAtPosition(document, position);
  if (!word) return null;

  // Find the view with this name
  const view = workspaceModel.getView(word);
  if (!view) return null;

  // Get the model name from this document
  const modelName = workspaceModel.getModelNameFromUri(document.uri);
  if (!modelName) return null;

  // Check if this view is included by the current model
  console.log(`Model name: ${modelName}`);
  const includedViews = workspaceModel.getIncludedViewsForModel(modelName);
  console.log(`Included Views:`, includedViews);
  if (!includedViews || !includedViews.has(word)) {
    // View exists but isn't included by this model - don't allow navigation
    return null;
  }

  // View is included, allow navigation
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