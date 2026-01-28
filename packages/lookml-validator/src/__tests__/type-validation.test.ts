import {
    DiagnosticsProvider,
    TextDocument,
    WorkspaceModel,
} from "@lkr-dev/lookml-language-server";
import * as fs from "fs";
import * as path from "path";

describe("LookML Validator - Type Validation", () => {
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
        } as any;

        workspaceModel = new WorkspaceModel({ connection: mockConnection });
        diagnosticsProvider = new DiagnosticsProvider(workspaceModel);
    });

    test('should detect invalid dimension type "numba"', async () => {
        // Read the invalid type fixture
        const fixturePath = path.join(
            __dirname,
            "fixtures",
            "invalid_type.view.lkml",
        );
        const content = fs.readFileSync(fixturePath, "utf8");

        // Create a TextDocument from the file content
        const document = TextDocument.create(
            `file://${fixturePath}`,
            "lookml",
            1,
            content,
        );

        // Parse the file into the workspace model
        await workspaceModel.parseFiles({
            source: fixturePath,
            reset: true,
        });

        // Run diagnostics
        const diagnostics = diagnosticsProvider.validateDocument(document);

        // Verify that diagnostics were generated
        expect(diagnostics).toBeDefined();
        expect(Array.isArray(diagnostics)).toBe(true);

        // Should have at least one diagnostic
        expect(diagnostics.length).toBeGreaterThan(0);

        // Verify that there's a diagnostic about the invalid type
        const errorMessages = diagnostics.map((d) => d.message);
        const hasTypeError = errorMessages.some(
            (msg) =>
                msg.toLowerCase().includes("type") ||
                msg.toLowerCase().includes("numba") ||
                msg.toLowerCase().includes("invalid"),
        );

        expect(hasTypeError).toBe(true);
    });

    test('should not report errors for valid dimension type "number"', async () => {
        // Read the valid type fixture
        const fixturePath = path.join(
            __dirname,
            "fixtures",
            "valid_type.view.lkml",
        );
        const content = fs.readFileSync(fixturePath, "utf8");

        // Create a TextDocument from the file content
        const document = TextDocument.create(
            `file://${fixturePath}`,
            "lookml",
            1,
            content,
        );

        // Parse the file into the workspace model
        await workspaceModel.parseFiles({
            source: fixturePath,
            reset: true,
        });

        // Run diagnostics
        const diagnostics = diagnosticsProvider.validateDocument(document);

        // Verify that diagnostics were generated
        expect(diagnostics).toBeDefined();
        expect(Array.isArray(diagnostics)).toBe(true);

        // Should have no diagnostics for valid type
        const typeErrors = diagnostics.filter(
            (d) =>
                d.message.toLowerCase().includes("type") &&
                d.message.toLowerCase().includes("number"),
        );

        expect(typeErrors.length).toBe(0);
    });
});
