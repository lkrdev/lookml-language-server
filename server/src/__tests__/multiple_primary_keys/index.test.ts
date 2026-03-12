import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { Diagnostic } from "vscode-languageserver/node";
import { WorkspaceModel } from "../../models/workspace";
import {
    DiagnosticCode,
    DiagnosticsProvider,
} from "../../providers/diagnostics";
import { createMockConnection, getDiagnosticsForView } from "../utils";

describe("Multiple Primary Keys", () => {
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
            "multiple_primary_keys.model.lkml",
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

    test("should report errors for view with two primary keys", () => {
        const errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "two_pks",
        );
        const pkErrors = errors.filter(
            (d) => d.code === DiagnosticCode.VIEW_MULTIPLE_PRIMARY_KEYS,
        );
        expect(pkErrors.length).toEqual(2);
        expect(pkErrors[0].message).toContain("Multiple primary keys");
        expect(pkErrors[0].message).toContain("pk1");
        expect(pkErrors[0].message).toContain("pk2");
    });

    test("should not report errors for view with single primary key", () => {
        const errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "single_pk",
        );
        const pkErrors = errors.filter(
            (d) => d.code === DiagnosticCode.VIEW_MULTIPLE_PRIMARY_KEYS,
        );
        expect(pkErrors.length).toEqual(0);
    });

    test("should not report errors for view with no primary keys", () => {
        const errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "no_pk",
        );
        const pkErrors = errors.filter(
            (d) => d.code === DiagnosticCode.VIEW_MULTIPLE_PRIMARY_KEYS,
        );
        expect(pkErrors.length).toEqual(0);
    });

    test("should report error when child view adds a second PK inherited from base", () => {
        const errors = getDiagnosticsForView(
            workspaceModel,
            sharedDiagnostics,
            "child_adds_pk",
        );
        const pkErrors = errors.filter(
            (d) => d.code === DiagnosticCode.VIEW_MULTIPLE_PRIMARY_KEYS,
        );
        expect(pkErrors.length).toEqual(1);
        expect(pkErrors[0].message).toContain("Multiple primary keys");
        expect(pkErrors[0].message).toContain("child_id");
        expect(pkErrors[0].message).toContain("base_id");
    });
});
