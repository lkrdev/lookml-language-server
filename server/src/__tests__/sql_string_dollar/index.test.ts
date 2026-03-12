import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { Diagnostic } from "vscode-languageserver/node";
import { WorkspaceModel } from "../../models/workspace";
import { DiagnosticCode, DiagnosticsProvider } from "../../providers/diagnostics";
import { createMockConnection, getDiagnosticsForView } from "../utils";

describe("Dollar sign in SQL string literals", () => {
    let workspaceModel: WorkspaceModel;
    let diagnosticsProvider: DiagnosticsProvider;
    let mockConnection: any;
    let sharedDiagnostics: Diagnostic[];

    beforeAll(async () => {
        mockConnection = createMockConnection();
        workspaceModel = new WorkspaceModel({ connection: mockConnection });
        diagnosticsProvider = new DiagnosticsProvider(workspaceModel);

        const examplePath = path.join(
            __dirname,
            "lkml",
            "sql_string_dollar.model.lkml",
        );

        const content = fs.readFileSync(examplePath, "utf8");
        const document = TextDocument.create(
            `file://${examplePath}`,
            "lookml",
            1,
            content,
        );

        await workspaceModel.parseFiles({
            source: examplePath,
            reset: true,
        });

        sharedDiagnostics = diagnosticsProvider.validateDocument(document);
    });

    test("should NOT flag $ inside BigQuery regex string literals as malformed references", () => {
        const errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "dollar_in_string",
        );
        const malformedErrors = errors.filter(
            (d) => d.code === DiagnosticCode.VIEW_REF_FIELD_IN_SQL,
        );
        expect(malformedErrors).toHaveLength(0);
    });

    test("should still flag truly malformed references like $foo", () => {
        const errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "truly_malformed",
        );
        const malformedErrors = errors.filter(
            (d) => d.code === DiagnosticCode.VIEW_REF_FIELD_IN_SQL,
        );
        expect(malformedErrors.length).toBeGreaterThan(0);
    });
});
