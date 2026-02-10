import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { WorkspaceModel } from "../../../models/workspace";
import { DiagnosticsProvider } from "../../../providers/diagnostics";
import { createMockConnection } from "../../utils";

describe("Include Validation: model_with_include", () => {
    let workspaceModel: WorkspaceModel;
    let diagnosticsProvider: DiagnosticsProvider;
    let mockConnection: any;

    beforeEach(() => {
        // Create a mock connection with all required methods
        mockConnection = createMockConnection();
        mockConnection.sendRequest.mockResolvedValue([]);

        workspaceModel = new WorkspaceModel({ connection: mockConnection });
        diagnosticsProvider = new DiagnosticsProvider(workspaceModel);
    });

    test("model_with_include.model.lkml should resolve the view, but not the missing field", async () => {
        const modelPath = path.join(
            __dirname,
            "lkml",
            "model_with_include.model.lkml",
        );
        const viewPath = path.join(__dirname, "lkml", "order_items.view.lkml"); // Keep viewPath for context, though not used for mocking now
        const content = fs.readFileSync(modelPath, "utf8");

        mockConnection.sendRequest.mockResolvedValue([`file://${viewPath}`]);

        const document = TextDocument.create(
            `file://${modelPath}`,
            "lookml",
            1,
            content,
        );

        await workspaceModel.parseFiles({
            source: path.join(__dirname, "lkml", "*.lkml"),
            reset: true,
        });

        const diagnostics = diagnosticsProvider.validateDocument(document);

        expect(diagnostics).toBeDefined();
        expect(Array.isArray(diagnostics)).toBe(true);
        expect(diagnostics.length).toBeGreaterThan(0);

        const errorMessages = diagnostics.map((d) => d.message);
        expect(
            errorMessages.some((msg) =>
                msg.includes(
                    'View "order_items" exists but is not included in this model',
                ),
            ),
        ).toBe(false);
        expect(
            errorMessages.some((msg) =>
                msg.includes(
                    'Could not find a field named "order_items.does_not_exist"',
                ),
            ),
        ).toBe(true);
    });
});
