import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { Diagnostic } from "vscode-languageserver/node";
import { WorkspaceModel } from "../../models/workspace";
import { DiagnosticsProvider } from "../../providers/diagnostics";
import { createMockConnection } from "../utils";

describe("Extends View", () => {
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
            "order_items.model.lkml",
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

    test("should have zero diagnostics for order_items_extended", () => {
        const exploreDef = workspaceModel.getExplore("order_items_extended");
        expect(exploreDef).toBeDefined();
        const exploreLine = exploreDef!.positions;

        const errorsInBlock = sharedDiagnostics.filter((d) => {
            const diagnosticLine = d.range.start.line;
            return (
                diagnosticLine >= exploreLine.$p[0] &&
                diagnosticLine <= exploreLine.$p[2]
            );
        });

        expect(errorsInBlock.length).toBe(0);
    });

    test("should have zero diagnostics for order_items2", () => {
        const exploreDef = workspaceModel.getExplore("order_items2");
        expect(exploreDef).toBeDefined();
        const exploreLine = exploreDef!.positions;

        const errorsInBlock = sharedDiagnostics.filter((d) => {
            const diagnosticLine = d.range.start.line;
            return (
                diagnosticLine >= exploreLine.$p[0] &&
                diagnosticLine <= exploreLine.$p[2]
            );
        });

        expect(errorsInBlock.length).toBe(0);
    });

    test("should have zero diagnostics for order_items_double_extended", () => {
        const exploreDef = workspaceModel.getExplore("order_items_double_extended");
        expect(exploreDef).toBeDefined();
        const exploreLine = exploreDef!.positions;

        const errorsInBlock = sharedDiagnostics.filter((d) => {
            const diagnosticLine = d.range.start.line;
            return (
                diagnosticLine >= exploreLine.$p[0] &&
                diagnosticLine <= exploreLine.$p[2]
            );
        });

        expect(errorsInBlock.length).toBe(0);
    });

    test("workspace model should have proper fields for order_items_extended", () => {
        const fields = workspaceModel.getTableFields("order_items_extended");
        expect(fields).toBeDefined();
        const fieldNames = fields!.map(f => f.name);
        expect(fieldNames).toContain("id");
        expect(fieldNames.length).toBe(1);
    });

    test("workspace model should have proper fields for order_items2", () => {
        const fields = workspaceModel.getTableFields("order_items2");
        expect(fields).toBeDefined();
        const fieldNames = fields!.map(f => f.name);
        expect(fieldNames).toContain("id");
        expect(fieldNames).toContain("id2");
        expect(fieldNames.length).toBe(2);
    });

    test("workspace model should have proper fields for order_items_double_extended", () => {
        const fields = workspaceModel.getTableFields("order_items_double_extended");
        expect(fields).toBeDefined();
        const fieldNames = fields!.map(f => f.name);
        expect(fieldNames).toContain("id");
        expect(fieldNames).toContain("id2");
        expect(fieldNames.length).toBe(2);
    });

    test("should have zero diagnostics for order_items_override_id_final", () => {
        const exploreDef = workspaceModel.getExplore("order_items_override_id_final");
        expect(exploreDef).toBeDefined();
        const exploreLine = exploreDef!.positions;

        const errorsInBlock = sharedDiagnostics.filter((d) => {
            const diagnosticLine = d.range.start.line;
            return (
                diagnosticLine >= exploreLine.$p[0] &&
                diagnosticLine <= exploreLine.$p[2]
            );
        });

        expect(errorsInBlock.length).toBe(0);
    });

    test("workspace model should have type string for order_items_override_ids1.id", ()=>{
        const fields = workspaceModel.getTableFields("order_items_override_ids1");
        expect(fields).toBeDefined();
        const idField = fields!.find(f => f.name === "id");
        expect(idField).toBeDefined();
        expect(idField!.type).toBe("string");
    })

    test("workspace model should have yesno field for order_items_override_id_final.id", () => {
        const fields = workspaceModel.getTableFields("order_items_override_id_final");
        expect(fields).toBeDefined();
        const idField = fields!.find(f => f.name === "id");
        expect(idField).toBeDefined();
        expect(idField!.type).toBe("yesno");
        const idField2 = fields!.find(f => f.name === "id2");
        expect(idField2).toBeDefined();
        expect(idField2!.type).toBe("number");
    });
});