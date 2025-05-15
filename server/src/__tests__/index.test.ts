import { TextDocument } from 'vscode-languageserver-textdocument';
import { WorkspaceModel } from '../models/workspace';
import { DiagnosticsProvider } from '../providers/diagnostics';
import { Connection } from 'vscode-languageserver/node';
import * as path from 'path';
import * as fs from 'fs';

describe('Workspace Model and Diagnostics', () => {
  let workspaceModel: WorkspaceModel;
  let diagnosticsProvider: DiagnosticsProvider;

  beforeEach(() => {
    // Create a mock connection with all required methods
    const mockConnection = {
      sendDiagnostics: jest.fn(),
      listen: jest.fn(),
      onRequest: jest.fn(),
      sendRequest: jest.fn(),
      onNotification: jest.fn(),
      sendNotification: jest.fn(),
      onProgress: jest.fn(),
      sendProgress: jest.fn(),
      onUnhandledProgress: jest.fn(),
      onUnhandledRequest: jest.fn(),
      onUnhandledNotification: jest.fn(),
      dispose: jest.fn(),
    } as unknown as Connection;

    workspaceModel = new WorkspaceModel({ connection: mockConnection });
    diagnosticsProvider = new DiagnosticsProvider(workspaceModel);
  });

  test('should load example file and run diagnostics', async () => {
    // Read the example file
    const examplePath = path.join(__dirname, 'examples', 'view_name.model.lkml');
    const content = fs.readFileSync(examplePath, 'utf8');

    // Create a TextDocument from the file content
    const document = TextDocument.create(
      `file://${examplePath}`,
      'lookml',
      1,
      content
    );

    // Parse the file into the workspace model
    await workspaceModel.parseFiles({
      source: examplePath,
      reset: true,
    });

    console.log("content", content);
    console.log("workspaceModel views", workspaceModel.getViews());
    console.log("workspaceModel explores", workspaceModel.getExplores());
    console.log("workspaceModel models", workspaceModel.getModels());

    // Run diagnostics
    const diagnostics = diagnosticsProvider.validateDocument(document);

    console.log("diagnostics", JSON.stringify(diagnostics, null, 2));
    // Verify that diagnostics were generated
    expect(diagnostics).toBeDefined();
    expect(Array.isArray(diagnostics)).toBe(true);

    // The example file should have some diagnostics since it contains both valid and invalid references
    expect(diagnostics.length).toBeGreaterThan(0);

    // Verify specific diagnostics for the example file
    const errorMessages = diagnostics.map(d => d.message);
    
    // Should have errors for invalid references
    expect(errorMessages.some(msg => msg.includes('not found in workspace'))).toBe(true);
    
    // Should have errors for invalid view references
    expect(errorMessages.some(msg => msg.includes('must have a base view'))).toBe(true);
  });
});
