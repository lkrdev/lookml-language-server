import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { WorkspaceModel } from "../../../models/workspace";
import { DiagnosticsProvider } from "../../../providers/diagnostics";
import { createMockConnection } from "../../utils";

describe("Include Validation: model_with_invalid_field_in_sql_always_where", () => {
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

    test("should error for invalid field in sql_always_where", async () => {
        const modelPath = path.join(
            __dirname,
            "lkml",
            "model_with_invalid_field_in_sql_always_where.model.lkml",
        );
        const content = fs.readFileSync(modelPath, "utf8");

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
                    'Field "does_not_exist" not found in view "order_items"',
                ),
            ),
        ).toBe(true);
    });
});
