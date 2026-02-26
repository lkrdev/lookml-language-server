import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { Diagnostic } from "vscode-languageserver/node";
import { WorkspaceModel } from "../../models/workspace";
import { DiagnosticsProvider } from "../../providers/diagnostics";
import {
    DIMENSION_GROUP_DEFAULT_INTERVALS,
    DIMENSION_GROUP_DEFAULT_TIMEFRAMES,
} from "../../schemas/defaults";
import { createMockConnection } from "../utils";

describe("Workspace Model: dimension_group expansion", () => {
    let workspaceModel: WorkspaceModel;
    let mockConnection: any;

    beforeAll(async () => {
        mockConnection = createMockConnection();
        workspaceModel = new WorkspaceModel({ connection: mockConnection });

        const examplePath = path.join(
            __dirname,
            "lkml",
            "dimension_group.model.lkml",
        );

        // Parse the file into the workspace model
        await workspaceModel.parseFiles({
            source: examplePath,
            reset: true,
        });
    });

    test("should expand time dimension_group into multiple fields", () => {
        const view = workspaceModel.getView("order_items");
        expect(view).toBeDefined();

        const fields = workspaceModel.getTableFields("order_items");
        expect(fields).toBeDefined();

        const fieldNames = fields!.map(f => f.name);
        
        // Check for expanded timefields
        expect(fieldNames).toContain("created_date");
        expect(fieldNames).toContain("created_time");
        expect(fieldNames).toContain("created_raw");
        expect(fieldNames).not.toContain("created");
    });

    test("should expand duration dimension_group into multiple fields", () => {
        const fields = workspaceModel.getTableFields("order_items");
        const fieldNames = fields!.map(f => f.name);
        
        // Check for expanded duration fields
        expect(fieldNames).toContain("days_duration_test");
        expect(fieldNames).toContain("weeks_duration_test");
    });

    test("should use default timeframes for sales view when none are specified", () => {
        const fields = workspaceModel.getTableFields("sales");
        const fieldNames = fields!.map(f => f.name);
        
        for (const timeframe of DIMENSION_GROUP_DEFAULT_TIMEFRAMES) {
            expect(fieldNames).toContain(`created_${timeframe}`);
        }
    });

    test("should use default intervals for duration for sales view when none are specified", () => {
        const fields = workspaceModel.getTableFields("sales");
        const fieldNames = fields!.map(f => f.name);
        
        for (const interval of DIMENSION_GROUP_DEFAULT_INTERVALS) {
            expect(fieldNames).toContain(`${interval}s_duration_test`);
        }
    });
});

describe("Workspace Model and Diagnostics: dimension_group references", () => {
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
            "dimension_group_reference.model.lkml",
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

    test("order_items should have zero diagnostics", () => {
        const exploreDef = workspaceModel.getExplore("order_items");
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

    test("sales should have diagnostics for referencing the group name instead of a timeframe", () => {
        const exploreDef = workspaceModel.getExplore("sales");
        expect(exploreDef).toBeDefined();
        const exploreLine = exploreDef!.positions;

        const errorsInBlock = sharedDiagnostics.filter((d) => {
            const diagnosticLine = d.range.start.line;
            return (
                diagnosticLine >= exploreLine.$p[0] &&
                diagnosticLine <= exploreLine.$p[2]
            );
        });
        // We expect 2 errors (one for no_view_reference, one for view_reference)
        expect(errorsInBlock.length).toBe(2);
        
        const messages = errorsInBlock.map(e => e.message);
        expect(messages).toContain('Could not find a field named "sales.created"');
        expect(messages).toContain('Field "created" not found in view "sales"');
    });

});

describe("Dimension Group Extend", () => {
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
            "dimension_group_extend.model.lkml",
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

    test("sales should have zero diagnostics", () => {
        const exploreDef = workspaceModel.getExplore("sales");
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
});
