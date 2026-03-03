import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { Diagnostic } from "vscode-languageserver/node";
import { WorkspaceModel } from "../../models/workspace";
import { DiagnosticsProvider } from "../../providers/diagnostics";
import { createMockConnection, getDiagnosticsForView } from "../utils";

describe("Circular Reference", () => {
    let workspaceModel: WorkspaceModel;
    let diagnosticsProvider: DiagnosticsProvider;
    let mockConnection: any;
    let sharedDiagnostics: Diagnostic[];

    beforeAll(async () => {
        mockConnection = createMockConnection();
        workspaceModel = new WorkspaceModel({ connection: mockConnection });
        diagnosticsProvider = new DiagnosticsProvider(workspaceModel);

        const examplePath = path.join(__dirname, "lkml", "circular.model.lkml");

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

    test("should have diagnostic for circular reference error", () => {
        const view1_errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "view1",
        );
        expect(view1_errors.length).toEqual(1);
        expect(view1_errors[0].message).toContain(
            "Circular reference detected",
        );
    });

    test("should have diagnostic for circular reference error", () => {
        const view2_errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "view2",
        );
        expect(view2_errors.length).toEqual(1);
        expect(view2_errors[0].message).toContain(
            "Circular reference detected",
        );
    });

    test("should have diagnostic for circular reference error in sql_view1", () => {
        const view1_errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "sql_view1",
        );
        expect(view1_errors.length).toEqual(1);
        expect(view1_errors[0].message).toContain(
            "Circular reference detected",
        );
    });

    test("should have diagnostic for circular reference error in sql_view2", () => {
        const view2_errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "sql_view2",
        );
        expect(view2_errors.length).toEqual(1);
        expect(view2_errors[0].message).toContain(
            "Circular reference detected",
        );
    });

    test("should have diagnostic for circular reference error in dimension_self_reference", () => {
        const view1_errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "dimension_self_reference",
        );
        expect(view1_errors.length).toEqual(2);
        expect(view1_errors[0].message).toContain(
            "Circular reference detected",
        );
        expect(view1_errors[1].message).toContain(
            "Circular reference detected",
        );
    });

    test("should have no diagnostic for circular reference error in dimension_sql_table_name_circular_no_error1", () => {
        const view1_errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "dimension_sql_table_name_circular_no_error1",
        );
        expect(view1_errors.length).toEqual(0);

        const view2_errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "dimension_sql_table_name_circular_no_error2",
        );
        expect(view2_errors.length).toEqual(0);
    });
});
