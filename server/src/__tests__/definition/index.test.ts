import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { WorkspaceModel } from "../../models/workspace";
import { DefinitionProvider } from "../../providers/definition";
import { DiagnosticsProvider } from "../../providers/diagnostics";
import { createMockConnection } from "../utils";

describe("Workspace Model and Diagnostics: definition", () => {
    let workspaceModel: WorkspaceModel;
    let diagnosticsProvider: DiagnosticsProvider;
    let mockConnection: any;

    beforeEach(() => {
        // Create a mock connection with all required methods
        mockConnection = createMockConnection();

        workspaceModel = new WorkspaceModel({ connection: mockConnection });
        diagnosticsProvider = new DiagnosticsProvider(workspaceModel);
    });

    test("definitions", async () => {
        // Read the example file
        const definitionProvider = new DefinitionProvider(workspaceModel);
        const modelPath = path.join(__dirname, "lkml", "definition.model.lkml");
        const content = fs.readFileSync(modelPath, "utf8");

        mockConnection.sendRequest.mockResolvedValue([
            path.join(__dirname, "lkml", "definition.view.lkml"),
        ]);

        // Create a TextDocument from the file content
        const document = TextDocument.create(
            `file://${modelPath}`,
            "lookml",
            1,
            content,
        );

        // Parse the file into the workspace model
        await workspaceModel.parseFiles({
            source: path.join(__dirname, "lkml", "*.lkml"),
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
            uri: path.join(__dirname, "lkml", "definition.view.lkml"),
            range: {
                start: { line: 0, character: 6 },
                end: { line: 0, character: 11 },
            },
        });
    });
});
