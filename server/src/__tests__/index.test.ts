import { TextDocument } from "vscode-languageserver-textdocument";
import { WorkspaceModel } from "../models/workspace";
import { DefinitionProvider } from "../providers/definition";
import { DiagnosticsProvider } from "../providers/diagnostics";

import * as fs from "fs";
import * as path from "path";
import { Connection } from "vscode-languageserver/node";

describe("Workspace Model and Diagnostics", () => {
  let workspaceModel: WorkspaceModel;
  let diagnosticsProvider: DiagnosticsProvider;
  let mockConnection: any;

  beforeEach(() => {
    // Create a mock connection with all required methods
    mockConnection = {
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

  test("should load example file and run diagnostics", async () => {
    // Read the example file
    const examplePath = path.join(
      __dirname,
      "examples",
      "view_name.model.lkml"
    );
    const content = fs.readFileSync(examplePath, "utf8");

    // Create a TextDocument from the file content
    const document = TextDocument.create(
      `file://${examplePath}`,
      "lookml",
      1,
      content
    );

    // Parse the file into the workspace model
    await workspaceModel.parseFiles({
      source: "src/__tests__/examples/**/*.{view,model,explore}.lkml",
      reset: true,
    });

    // Run diagnostics
    const diagnostics = diagnosticsProvider.validateDocument(document);

    // Verify that diagnostics were generated
    expect(diagnostics).toBeDefined();
    expect(Array.isArray(diagnostics)).toBe(true);

    // The example file should have some diagnostics since it contains both valid and invalid references
    expect(diagnostics.length).toBeGreaterThan(0);

    // Verify specific diagnostics for the example file
    const errorMessages = diagnostics.map((d) => d.message);

    // Should have errors for invalid references
    expect(
      errorMessages.some((msg) => msg.includes("not found in workspace"))
    ).toBe(true);
  });

  test("definitions", async () => {
    // Read the example file
    const definitionProvider = new DefinitionProvider(workspaceModel);
    const modelPath = path.join(
      __dirname,
      "examples/definition",
      "definition.model.lkml"
    );
    const content = fs.readFileSync(modelPath, "utf8");

    mockConnection.sendRequest.mockResolvedValue([
      path.join(__dirname, "examples/definition", "definition.view.lkml"),
    ]);

    // Create a TextDocument from the file content
    const document = TextDocument.create(
      `file://${modelPath}`,
      "lookml",
      1,
      content
    );

    // Parse the file into the workspace model
    await workspaceModel.parseFiles({
      source:
        "src/__tests__/examples/definition/**/*.{view,model,explore}.lkml",
      reset: true,
    });

    // Run diagnostics
    const diagnostics = diagnosticsProvider.validateDocument(document);
    // Verify that diagnostics were generated
    expect(diagnostics).toBeDefined();
    expect(Array.isArray(diagnostics)).toBe(true);

    // The example file should have some diagnostics since it contains both valid and invalid references
    expect(diagnostics.length).toBe(0);

    const definition = definitionProvider.getDefinition(document, {
      line: 7,
      character: 10,
    });

    expect(definition).toEqual({
      uri: `${process.cwd()}/src/__tests__/examples/definition/definition.view.lkml`,
      range: {
        start: { line: 0, character: 6 },
        end: { line: 0, character: 11 },
      },
    });
  });
});
