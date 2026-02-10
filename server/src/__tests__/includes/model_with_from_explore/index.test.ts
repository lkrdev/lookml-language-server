import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { WorkspaceModel } from "../../../models/workspace";
import { DiagnosticsProvider } from "../../../providers/diagnostics";
import { createMockConnection } from "../../utils";

describe("Include Validation: model_with_from_explore", () => {
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

    test("should not error for model with from explore and includes", async () => {
        const modelPath = path.join(
            __dirname,
            "lkml",
            "model_with_from_explore.model.lkml",
        );
        const viewPath = path.join(__dirname, "lkml", "order_items.view.lkml");
        const content = fs.readFileSync(modelPath, "utf8");

        mockConnection.sendRequest.mockResolvedValue([viewPath]);

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

        expect(diagnostics.length).toBe(0);
    });
});
