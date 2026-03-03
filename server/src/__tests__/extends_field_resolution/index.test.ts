import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { Diagnostic } from "vscode-languageserver/node";
import { WorkspaceModel } from "../../models/workspace";
import { DiagnosticsProvider } from "../../providers/diagnostics";
import { createMockConnection } from "../utils";

describe("Extends Field Resolution", () => {
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
            "global_sales_aggregated.model.lkml",
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

    test("should have zero diagnostics for global_sales_aggregated view", () => {
        const viewDef = workspaceModel.getView("global_sales_aggregated");
        expect(viewDef).toBeDefined();
        const viewLine = viewDef!.positions;

        const errorsInBlock = sharedDiagnostics.filter((d) => {
            const diagnosticLine = d.range.start.line;
            return (
                diagnosticLine >= viewLine.$p[0] &&
                diagnosticLine <= viewLine.$p[2]
            );
        });

        expect(errorsInBlock.length).toBe(0);
    });

    test("workspace model should have all fields from extended view", () => {
        const fields = workspaceModel.getTableFields("global_sales_aggregated");
        expect(fields).toBeDefined();
        const fieldNames = fields!.map(f => f.name);
        
        // From parent view
        expect(fieldNames).toContain("day_date"); // The parameter 'dimension_group: day' usually gives day_date
        // For a timeframe in day, the view should ideally have "day_date" inside fields or it can be resolved.
        // LookML actually creates a field for each timeframe, e.g., 'day_date'.
        // Whether it's literally tracked as 'day_date' in table fields or we just rely on no diagnostics...
        expect(fieldNames).toContain("ecosystem");
        expect(fieldNames).toContain("country_id");
        expect(fieldNames).toContain("customer");

        // From current view
        expect(fieldNames).toContain("combined");
    });

    test("should have diagnostic for drill_fields error in global_sales_aggregated_drill_error", () => {
        const viewDef = workspaceModel.getView("global_sales_aggregated_drill_error");
        expect(viewDef).toBeDefined();
        const viewLine = viewDef!.positions;

        const errorsInBlock = sharedDiagnostics.filter((d) => {
            const diagnosticLine = d.range.start.line;
            return (
                diagnosticLine >= viewLine.$p[0] &&
                diagnosticLine <= viewLine.$p[2]
            );
        });

        expect(errorsInBlock.length).toEqual(1);
        expect(
            errorsInBlock.some(d => d.message.includes("day_date2") && d.message.includes("not found"))
        ).toBe(true);
    });

    test("should have diagnostic for sql reference error in global_sales_aggregated_day_reference_error", () => {
        const viewDef = workspaceModel.getView("global_sales_aggregated_day_reference_error");
        expect(viewDef).toBeDefined();
        const viewLine = viewDef!.positions;

        const errorsInBlock = sharedDiagnostics.filter((d) => {
            const diagnosticLine = d.range.start.line;
            return (
                diagnosticLine >= viewLine.$p[0] &&
                diagnosticLine <= viewLine.$p[2]
            );
        });

        expect(errorsInBlock.length).toEqual(1);
        expect(
            errorsInBlock.some(d => d.message.includes("day_date3") && d.message.includes("Could not find a field"))
        ).toBe(true);
    });
});
