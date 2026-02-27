import {
    ArrayPosition,
    LookmlExplore,
    LookmlExploreWithFileInfo,
    LookmlModelWithFileInfo,
    Position as LookmlPosition,
    LookmlView,
    LookmlViewWithFileInfo,
} from "lookml-parser";
import { TextDocument } from "vscode-languageserver-textdocument";
import {
    Diagnostic,
    DiagnosticSeverity,
    Position,
    Range,
} from "vscode-languageserver/node";
import * as fs from "fs";
import * as path from "path";
import { URI } from "vscode-uri";
import { ZodError, ZodIssue } from "zod";
import { WorkspaceModel } from "../models/workspace";
import { exploreSchema, LookMLView } from "../schemas/lookml";
import { ensureMinRangeLength } from "../utils/range";

export enum DiagnosticCode {
    // Syntax validation (10000-19999)
    SYNTAX_UNBALANCED_CLOSING_BRACE = 10001,
    SYNTAX_UNCLOSED_BRACE = 10002,
    SYNTAX_INVALID_PROPERTY_NAME = 10003,
    SYNTAX_INVALID_INDENTATION = 10004,
    SYNTAX_MISSING_SQL_TERMINATOR = 10005,
    SYNTAX_MISSING_BLOCK_COLON = 10006,
    SYNTAX_INVALID_BLOCK_TYPE = 10007,

    // View Reference validation (20000-29999)
    VIEW_REF_FIELD_NOT_FOUND = 20001,
    VIEW_REF_VIEW_NOT_FOUND = 20002,
    VIEW_REF_VIEW_NOT_INCLUDED = 20003,
    VIEW_REF_FIELD_IN_SQL = 20004,

    // SQL Reference validation (30000-39999)
    SQL_REF_FIELD_NOT_FOUND = 30001,
    SQL_REF_VIEW_NOT_FOUND = 30002,
    SQL_REF_VIEW_NOT_INCLUDED = 30003,
    SQL_REF_VIEW_NOT_AVAILABLE = 30004,
    SQL_REF_CIRCULAR = 30005,

    // Drill Fields validation (40000-49999)
    DRILL_FIELDS_INVALID_FORMAT = 40001,
    DRILL_FIELDS_MISSING_BRACKET = 40002,
    DRILL_FIELDS_MISSING_CLOSING = 40003,
    DRILL_FIELDS_EMPTY_FIELD = 40004,
    DRILL_FIELDS_VIEW_NOT_FOUND = 40005,
    DRILL_FIELDS_SET_NOT_FOUND = 40006,
    DRILL_FIELDS_FIELD_NOT_FOUND = 40007,

    // Property validation (50000-59999)
    PROP_INVALID_BLOCK_PARENT = 50001,
    PROP_INVALID_CHILD_BLOCK = 50002,
    PROP_INVALID_PROPERTY = 50003,
    PROP_INVALID_TYPE = 50004,
    PROP_INVALID_CONTEXT = 50005,
    PROP_INVALID_HIDDEN_VALUE = 50006,
    PROP_PRIMARY_KEY_INVALID_CONTEXT = 50007,
    PROP_RELATIONSHIP_INVALID_CONTEXT = 50008,

    // Join validation (60000-69999)
    JOIN_VIEW_NOT_FOUND = 60001,
    JOIN_FIELD_NOT_FOUND = 60002,
    JOIN_VIEW_NOT_INCLUDED = 60003,
    JOIN_INVALID_RELATIONSHIP = 60004,
    JOIN_VIEW_NOT_AVAILABLE = 60005,

    // Explore validation (70000-79999)
    EXPLORE_VIEW_NOT_FOUND = 70001,
    EXPLORE_FIELD_NOT_FOUND = 70002,
    EXPLORE_VIEW_NOT_INCLUDED = 70003,
    EXPLORE_INVALID_EXTENDS = 70004,
    EXPLORE_INACCESSIBLE_VIEW = 70005,

    // View extends validation (80000-89999)
    EXTENDS_VIEW_NOT_FOUND = 80001,

    // Include validation (90000-99999)
    INCLUDE_FILE_NOT_FOUND = 90001,
}

export class DiagnosticsProvider {
    private workspaceModel: WorkspaceModel;

    constructor(workspaceModel: WorkspaceModel) {
        this.workspaceModel = workspaceModel;
    }

    /**
     * Collect view names referenced in ${view.field} in dimension/measure/dimension_group sql.
     */
    private getReferencedViewNamesFromSql(view: LookmlView): Set<string> {
        const refs = new Set<string>();
        const collectFromSql = (sql: string | undefined) => {
            if (!sql) return;
            const pattern = /\$\{([a-zA-Z0-9_]+)\.([a-zA-Z0-9_.]+)\}/g;
            let match: RegExpExecArray | null;
            while ((match = pattern.exec(sql)) !== null) {
                refs.add(match[1]);
            }
        };

        if (view.dimension) {
            Object.values(view.dimension).forEach((d) => collectFromSql(d.sql));
        }
        if (view.measure) {
            Object.values(view.measure).forEach((m) => collectFromSql(m.sql));
        }
        if (view.dimension_group) {
            Object.values(view.dimension_group).forEach((dg) =>
                collectFromSql(dg.sql),
            );
        }
        return refs;
    }

    /**
     * Check if a field exists in a view, including fields inherited from extended views
     * (extends: [view_name]) and dimension_group timeframes (e.g. day_date from dimension_group: day).
     * Used so that refinements can reference dimensions from their base view without false "not found" errors.
     */
    private fieldExistsInView(
        viewName: string,
        fieldName: string,
        visited: Set<string> = new Set(),
    ): boolean {
        if (visited.has(viewName)) return false;
        visited.add(viewName);

        const viewDetails = this.workspaceModel.getView(viewName);
        if (!viewDetails?.view) return false;

        const view = viewDetails.view;

        // Looker special refs: TABLE = current view's table, SQL_TABLE_NAME = view's sql_table_name
        if (fieldName === "TABLE" || fieldName === "SQL_TABLE_NAME") return true;
        if (view.dimension?.[fieldName] || view.measure?.[fieldName])
            return true;
        if (view.dimension_group?.[fieldName]) return true;

        // dimension_group timeframes: e.g. "day_date" or "date_transaction_month_name" (timeframe can contain "_")
        const dimensionGroups = view.dimension_group ?? {};
        for (const [dimGroupName, dimGroup] of Object.entries(dimensionGroups)) {
            const timeframes = dimGroup.timeframes ?? ["time", "date"];
            for (const timeframe of timeframes) {
                if (fieldName === `${dimGroupName}_${timeframe}`) return true;
            }
        }

        const extendsList =
            view.extends === undefined
                ? []
                : Array.isArray(view.extends)
                  ? view.extends
                  : [view.extends];
        for (const extViewName of extendsList) {
            if (this.fieldExistsInView(extViewName, fieldName, visited))
                return true;
        }
        return false;
    }

    /**
     * Resolve a field reference like "day_date" to the dimension_group name "day"
     * if it matches a dimension_group + timeframe combination. Returns null if
     * the ref doesn't match any dimension_group timeframe.
     */
    private resolveToDimensionGroupName(
        view: LookmlView,
        fieldRef: string,
    ): string | null {
        if (!view.dimension_group) return null;
        for (const [dgName, dg] of Object.entries(view.dimension_group)) {
            const timeframes = dg.timeframes ?? ["time", "date"];
            for (const tf of timeframes) {
                if (fieldRef === `${dgName}_${tf}`) return dgName;
            }
        }
        return null;
    }

    /**
     * Build a field dependency graph for a view and detect circular references
     * using DFS with three-color marking (white/gray/black).
     * Catches both direct self-references (sql: ${publisher} in publisher)
     * and indirect cycles (A -> B -> ... -> A).
     */
    private validateCircularReferences(
        viewDetails: LookmlViewWithFileInfo,
    ): Diagnostic[] {
        const diagnostics: Diagnostic[] = [];
        const view = viewDetails.view;
        const positions = viewDetails.positions;
        const viewName = view.$name ?? "";

        const graph = new Map<string, Set<string>>();
        const fieldSqlPositions = new Map<
            string,
            { $p: number[] } | undefined
        >();

        const refPattern = /\$\{([^}]+)\}/g;

        const collectDeps = (
            fieldName: string,
            sql: string | undefined,
            sqlPosition: any,
        ) => {
            if (!sql) return;
            const deps = new Set<string>();
            let match;
            refPattern.lastIndex = 0;
            while ((match = refPattern.exec(sql)) !== null) {
                const ref = match[1];
                if (ref === "TABLE" || ref === "SQL_TABLE_NAME") continue;
                if (ref.includes(".")) {
                    const [refView, refField] = ref.split(".");
                    if (refView === viewName) {
                        deps.add(refField);
                    }
                } else {
                    deps.add(ref);
                }
            }
            graph.set(fieldName, deps);
            fieldSqlPositions.set(fieldName, sqlPosition);
        };

        if (view.dimension) {
            for (const [name, dim] of Object.entries(view.dimension)) {
                collectDeps(name, dim.sql, positions?.dimension?.[name]?.sql);
            }
        }
        if (view.measure) {
            for (const [name, meas] of Object.entries(view.measure)) {
                collectDeps(name, meas.sql, positions?.measure?.[name]?.sql);
            }
        }
        if (view.dimension_group) {
            for (const [name, dg] of Object.entries(view.dimension_group)) {
                collectDeps(
                    name,
                    dg.sql,
                    positions?.dimension_group?.[name]?.sql,
                );
            }
        }

        const WHITE = 0,
            GRAY = 1,
            BLACK = 2;
        const color = new Map<string, number>();
        for (const field of graph.keys()) {
            color.set(field, WHITE);
        }

        const fieldsInCycles = new Set<string>();

        const dfs = (node: string, path: string[]) => {
            color.set(node, GRAY);
            path.push(node);

            const deps = graph.get(node) ?? new Set();
            for (const dep of deps) {
                const resolved =
                    this.resolveToDimensionGroupName(view, dep) ?? dep;
                if (!graph.has(resolved)) continue;

                if (color.get(resolved) === GRAY) {
                    const cycleStart = path.indexOf(resolved);
                    for (let i = cycleStart; i < path.length; i++) {
                        fieldsInCycles.add(path[i]);
                    }
                } else if (color.get(resolved) === WHITE) {
                    dfs(resolved, path);
                }
            }

            path.pop();
            color.set(node, BLACK);
        };

        for (const field of graph.keys()) {
            if (color.get(field) === WHITE) {
                dfs(field, []);
            }
        }

        for (const fieldName of fieldsInCycles) {
            const pos = fieldSqlPositions.get(fieldName);
            if (!pos?.$p) continue;

            const deps = graph.get(fieldName) ?? new Set();
            const cycleDeps = [...deps].filter((d) => {
                const resolved =
                    this.resolveToDimensionGroupName(view, d) ?? d;
                return fieldsInCycles.has(resolved);
            });

            const range = {
                start: { line: pos.$p[0], character: pos.$p[1] },
                end: { line: pos.$p[2], character: pos.$p[3] },
            };

            diagnostics.push({
                severity: DiagnosticSeverity.Error,
                range: ensureMinRangeLength(range),
                message: `Circular reference detected: "${fieldName}" in view "${viewName}" references ${cycleDeps.map((d) => `"${d}"`).join(", ")} creating a cycle.`,
                source: "lookml-lsp",
                code: DiagnosticCode.SQL_REF_CIRCULAR,
            });
        }

        return diagnostics;
    }

    /**
     * Validate a document and return diagnostics
     */
    public validateDocument(document: TextDocument): Diagnostic[] {
        const diagnostics: Diagnostic[] = [];
        diagnostics.push(...this.validateProperties(document));
        diagnostics.push(...this.validateModelReferences(document));
        diagnostics.push(...this.validateExploreFileInaccessibleViews(document));
        diagnostics.push(...this.validateIncludes(document));

        const fileName = document.uri.split("/").pop() ?? "";
        const errors = this.workspaceModel.getErrorsByFileName(fileName);

        for (const errorDetails of errors) {
            diagnostics.push({
                severity: DiagnosticSeverity.Error,
                message: errorDetails.error.exception.message,
                code: errorDetails.error.exception.code,
                range: ensureMinRangeLength({
                    start: {
                        line:
                            errorDetails.error.exception.location.start.line -
                            1,
                        character:
                            errorDetails.error.exception.location.start.column -
                            1,
                    },
                    end: {
                        line:
                            errorDetails.error.exception.location.end.line - 1,
                        character:
                            errorDetails.error.exception.location.end.column -
                            1,
                    },
                }),
            });
        }

        return diagnostics;
    }

    private validateSqlReferences(
        sql: string,
        position: LookmlPosition | undefined,
        currentViewName?: string,
        context?: Record<string, LookmlViewWithFileInfo>,
    ): Diagnostic[] {
        const diagnostics: Diagnostic[] = [];
        if (!position) return diagnostics;

        const validRefPattern = /\$\{([^}]+)\}/g;
        const invalidRefPattern = /\$[^{][^}\s]*}?|\$\{[^}]*$/g;

        let match;

        const charStart = position.$p[1];
        const charEnd = position.$p[3];
        const lineStart = position.$p[0];
        const lineEnd = position.$p[2];

        const range = {
            start: { line: lineStart, character: charStart },
            end: { line: lineEnd, character: charEnd },
        };

        // ✅ Detect valid references
        while ((match = validRefPattern.exec(sql)) !== null) {
            const ref = match[1];
            if (ref.includes(".")) {
                const refParts = ref.split(".");
                const viewName = refParts[0];
                const fieldName = refParts[1];

                const viewDetails = context?.[viewName]
                    ? context[viewName]
                    : this.workspaceModel.getView(viewName);

                if (!viewDetails) {
                    diagnostics.push({
                        severity: DiagnosticSeverity.Error,
                        range,
                        message: `Could not find a field named "${ref}"`,
                        code: DiagnosticCode.VIEW_REF_FIELD_NOT_FOUND,
                    });
                    continue;
                }

                if (!this.fieldExistsInView(viewName, fieldName)) {
                    diagnostics.push({
                        severity: DiagnosticSeverity.Error,
                        range,
                        message: `Could not find a field named "${ref}"`,
                        code: DiagnosticCode.VIEW_REF_FIELD_NOT_FOUND,
                    });
                }
            } else if (currentViewName && ref !== "TABLE") {
                const fieldName = ref;
                if (!this.fieldExistsInView(currentViewName, fieldName)) {
                    diagnostics.push({
                        severity: DiagnosticSeverity.Error,
                        range,
                        message: `Could not find a field named "${ref}"`,
                        code: DiagnosticCode.VIEW_REF_FIELD_NOT_FOUND,
                    });
                }
            }
        }

        // ❌ Detect malformed references (e.g. $foo, $foo}, ${bar)
        while ((match = invalidRefPattern.exec(sql)) !== null) {
            diagnostics.push({
                severity: DiagnosticSeverity.Error,
                range,
                message:
                    "Malformed LookML reference. Use full ${view.field} syntax.",
                source: "lookml-lsp",
                code: DiagnosticCode.VIEW_REF_FIELD_IN_SQL,
            });
        }

        return diagnostics;
    }

    private validateDrillFields({
        view,
        drillFields,
        viewDetails,
        arrayPosition,
    }: {
        view: LookmlView;
        drillFields: string[];
        viewDetails: LookmlViewWithFileInfo;
        arrayPosition?: ArrayPosition;
    }): Diagnostic[] {
        const diagnostics: Diagnostic[] = [];

        for (const [index, drillField] of drillFields.entries()) {
            let fieldName = drillField;
            let targetedViewName: string | undefined = view.$name;
            let targetedViewDetails: LookmlViewWithFileInfo | undefined =
                viewDetails;

            const drillFieldPosition = arrayPosition?.[index];
            if (!drillFieldPosition) {
                throw new Error(
                    `No position found for drill field ${drillField}`,
                );
            }

            if (drillField.includes("*")) {
                const fieldWithoutAsterisk = drillField.replace("*", "");
                const startCharater = drillFieldPosition.$p[1];
                const isReferencingADifferentView =
                    targetedViewName !== view.$name;
                const endCharater =
                    isReferencingADifferentView && targetedViewName
                        ? startCharater + fieldWithoutAsterisk.length
                        : drillFieldPosition.$p[3];

                if (!targetedViewDetails?.view?.set?.[fieldWithoutAsterisk]) {
                    diagnostics.push({
                        severity: DiagnosticSeverity.Error,
                        range: {
                            start: {
                                line: drillFieldPosition.$p[0],
                                character: startCharater,
                            },
                            end: {
                                line: drillFieldPosition.$p[2],
                                character: endCharater,
                            },
                        },
                        message: `Set "${fieldWithoutAsterisk}" not found in view "${targetedViewName}"`,
                        source: "lookml-lsp",
                        code: DiagnosticCode.DRILL_FIELDS_SET_NOT_FOUND,
                    });
                }
                continue;
            }

            if (drillField.includes(".")) {
                const drillFieldParts = drillField.split(".");
                targetedViewName = drillFieldParts[0];
                fieldName = drillFieldParts[1];
                targetedViewDetails =
                    this.workspaceModel.getView(targetedViewName);
            }

            const startCharater = drillFieldPosition.$p[1];
            const isReferencingADifferentView = targetedViewName !== view.$name;
            const endCharater =
                isReferencingADifferentView && targetedViewName
                    ? startCharater + targetedViewName.length
                    : drillFieldPosition.$p[3];

            if (!targetedViewDetails) {
                diagnostics.push({
                    severity: DiagnosticSeverity.Error,
                    message: `View ${targetedViewName} not found`,
                    range: {
                        start: {
                            line: drillFieldPosition.$p[0],
                            character: startCharater,
                        },
                        end: {
                            line: drillFieldPosition.$p[2],
                            character: endCharater,
                        },
                    },
                    source: "lookml-lsp",
                    code: DiagnosticCode.DRILL_FIELDS_VIEW_NOT_FOUND,
                });
                continue;
            }

            if (!this.fieldExistsInView(targetedViewDetails.view.$name ?? "", fieldName)) {
                diagnostics.push({
                    severity: DiagnosticSeverity.Error,
                    message: `Field "${fieldName}" not found in view "${targetedViewDetails.view.$name}"`,
                    range: {
                        start: {
                            line: drillFieldPosition.$p[0],
                            character: startCharater,
                        },
                        end: {
                            line: drillFieldPosition.$p[2],
                            character: endCharater,
                        },
                    },
                    source: "lookml-lsp",
                    code: DiagnosticCode.DRILL_FIELDS_FIELD_NOT_FOUND,
                });
            }
        }

        return diagnostics;
    }

    // Then in the validation method:
    protected validateProperties(document: TextDocument): Diagnostic[] {
        let diagnostics: Diagnostic[] = [];

        // Parse the document into a structure
        const parsedStructure = this.getFileStructure(document);

        if (parsedStructure.views.length) {
            for (const viewDetails of parsedStructure.views) {
                const positions = viewDetails.positions;
                const view = viewDetails.view;

                // Validate the view structure using Zod schema
                const result = LookMLView.safeParse(view);
                if (!result.success) {
                    // Add validation errors to diagnostics
                    result.error.errors.forEach((error: ZodIssue) => {
                        let currentPosition: any = positions;
                        for (const pathPart of error.path) {
                            if (!currentPosition) break;
                            if (!currentPosition[pathPart]) {
                                continue;
                            }

                            currentPosition = currentPosition[pathPart];
                        }
                        const position = currentPosition as
                            | LookmlPosition
                            | undefined;
                        if (position?.$p && Array.isArray(position.$p)) {
                            diagnostics.push({
                                severity: DiagnosticSeverity.Error,
                                range: {
                                    start: {
                                        line: position.$p[0],
                                        character: position.$p[1],
                                    },
                                    end: {
                                        line: position.$p[2],
                                        character: position.$p[3],
                                    },
                                },
                                message: error.message,
                                source: "lookml-lsp",
                                code: DiagnosticCode.PROP_INVALID_TYPE,
                            });
                        }
                    });
                }

                // Additional validations that can't be expressed in the schema
                if (view.extends && "extends_ref" in view) {
                    diagnostics.push({
                        severity: DiagnosticSeverity.Error,
                        code: DiagnosticCode.PROP_INVALID_CONTEXT,
                        range: this.getRangeFromPositions(
                            positions,
                            "$name",
                            "extends_ref",
                        ),
                        message:
                            "Cannot use both 'extends' and 'extends_ref' in the same view",
                        source: "lookml-lsp",
                    });
                }

                // Extends: each extended view must exist in the workspace (included in project)
                const extendsList =
                    view.extends === undefined
                        ? []
                        : Array.isArray(view.extends)
                          ? view.extends
                          : [view.extends];
                const extendsPositions = (positions as { extends?: Array<{ $p: number[] }> }).extends;
                for (const [index, extViewName] of extendsList.entries()) {
                    if (!this.workspaceModel.getView(extViewName)) {
                        const extPos = extendsPositions?.[index]?.$p;
                        const range = extPos
                            ? {
                                  start: { line: extPos[0], character: extPos[1] },
                                  end: { line: extPos[2], character: extPos[3] },
                              }
                            : this.getRangeFromPositions(positions, "$name");
                        diagnostics.push({
                            severity: DiagnosticSeverity.Error,
                            range: ensureMinRangeLength(range),
                            message: `Cannot find "${extViewName}" to extend. Ensure the view exists and is included in the model.`,
                            source: "lookml-lsp",
                            code: DiagnosticCode.EXTENDS_VIEW_NOT_FOUND,
                        });
                    }
                }

                // Circular reference detection
                diagnostics.push(
                    ...this.validateCircularReferences(viewDetails),
                );

                // Validate dimensions
                if (view.dimension) {
                    Object.entries(view.dimension).forEach(
                        ([dimName, dimension]) => {
                            // Validate drill fields
                            if (dimension.drill_fields) {
                                diagnostics.push(
                                    ...this.validateDrillFields({
                                        view,
                                        drillFields: dimension.drill_fields,
                                        viewDetails: viewDetails,
                                        arrayPosition:
                                            positions?.dimension?.[dimName]
                                                ?.drill_fields,
                                    }),
                                );
                            }

                            // Validate SQL references
                            if (dimension.sql) {
                                const sqlPosition =
                                    positions?.dimension?.[dimName]?.sql;
                                diagnostics.push(
                                    ...this.validateSqlReferences(
                                        dimension.sql,
                                        sqlPosition,
                                        viewDetails.view.$name,
                                    ),
                                );
                            }
                        },
                    );
                }

                // Validate measures
                if (view.measure) {
                    Object.entries(view.measure).forEach(
                        ([measureName, measure]) => {
                            // Validate drill fields
                            if (measure.drill_fields) {
                                diagnostics.push(
                                    ...this.validateDrillFields({
                                        view,
                                        drillFields: measure.drill_fields,
                                        viewDetails: viewDetails,
                                        arrayPosition:
                                            positions?.measure?.[measureName]
                                                ?.drill_fields,
                                    }),
                                );
                            }

                            // Validate SQL references
                            if (measure.sql) {
                                const sqlPosition =
                                    positions?.measure?.[measureName]?.sql;
                                diagnostics.push(
                                    ...this.validateSqlReferences(
                                        measure.sql,
                                        sqlPosition,
                                        viewDetails.view.$name,
                                    ),
                                );
                            }
                        },
                    );
                }

                // Validate dimension groups
                if (view.dimension_group) {
                    Object.entries(view.dimension_group).forEach(
                        ([dimGroupName, dimensionGroup]) => {
                            // Validate SQL references
                            if (dimensionGroup.sql) {
                                const sqlPosition =
                                    positions?.dimension_group?.[dimGroupName]
                                        ?.sql;
                                diagnostics.push(
                                    ...this.validateSqlReferences(
                                        dimensionGroup.sql,
                                        sqlPosition,
                                        viewDetails.view.$name,
                                    ),
                                );
                            }

                            // Validate timeframes
                            if (dimensionGroup.timeframes) {
                                const timeframesPosition =
                                    positions?.dimension_group?.[dimGroupName]
                                        ?.timeframes;
                                if (timeframesPosition) {
                                    const validTimeframes = [
                                        "raw",
                                        "yesno",
                                        "time",
                                        "date",
                                        "week",
                                        "month",
                                        "quarter",
                                        "year",
                                        "day_of_week",
                                        "day_of_month",
                                        "day_of_year",
                                        "week_of_year",
                                        "month_of_year",
                                        "quarter_of_year",
                                        "month_num",
                                        "month_name",
                                        "quarter_name",
                                        "day_name",
                                        "hour",
                                        "minute",
                                        "second",
                                        "millisecond",
                                        "microsecond",
                                        "hour_of_day",
                                        "minute_of_hour",
                                        "second_of_minute",
                                        "time_of_day",
                                        "day_of_week_index",
                                        "week_start_date",
                                        // Fiscal timeframes (require fiscal_month_offset on model)
                                        "fiscal_year",
                                        "fiscal_quarter",
                                        "fiscal_quarter_of_year",
                                        "fiscal_month_num",
                                    ];

                                    for (const [
                                        index,
                                        timeframe,
                                    ] of dimensionGroup.timeframes.entries()) {
                                        if (
                                            !validTimeframes.includes(timeframe)
                                        ) {
                                            const timeframePosition =
                                                timeframesPosition[index];
                                            if (timeframePosition) {
                                                diagnostics.push({
                                                    severity:
                                                        DiagnosticSeverity.Error,
                                                    range: {
                                                        start: {
                                                            line: timeframePosition
                                                                .$p[0],
                                                            character:
                                                                timeframePosition
                                                                    .$p[1],
                                                        },
                                                        end: {
                                                            line: timeframePosition
                                                                .$p[2],
                                                            character:
                                                                timeframePosition
                                                                    .$p[3],
                                                        },
                                                    },
                                                    message: `Invalid timeframe "${timeframe}" for dimension group "${dimGroupName}"`,
                                                    source: "lookml-lsp",
                                                    code: DiagnosticCode.PROP_INVALID_TYPE,
                                                });
                                            }
                                        }
                                    }
                                }
                            }
                        },
                    );
                }

                if (view.set) {
                    Object.entries(view.set).forEach(([setName, set]) => {
                        for (const [index, field] of set?.fields?.entries() ??
                            []) {
                            let fieldName = field;
                            let targetedViewName: string | undefined =
                                viewDetails.view.$name;
                            let targetedViewDetails:
                                | LookmlViewWithFileInfo
                                | undefined = viewDetails;

                            const setFieldPosition =
                                positions.set?.[setName]?.fields?.[index];
                            if (!setFieldPosition) {
                                throw new Error(
                                    `No position found for set field ${field}`,
                                );
                            }

                            if (field.includes(".")) {
                                const fieldParts = field.split(".");
                                targetedViewName = fieldParts[0];
                                fieldName = fieldParts[1];
                                targetedViewDetails =
                                    this.workspaceModel.getView(
                                        targetedViewName,
                                    );
                            }

                            const startCharacter = setFieldPosition.$p[1];
                            const isReferencingADifferentView =
                                targetedViewName !== viewDetails.view.$name;
                            const endCharacter =
                                isReferencingADifferentView && targetedViewName
                                    ? startCharacter + targetedViewName.length
                                    : setFieldPosition.$p[3];

                            if (!targetedViewDetails) {
                                diagnostics.push({
                                    severity: DiagnosticSeverity.Error,
                                    message: `View ${targetedViewName} not found`,
                                    range: {
                                        start: {
                                            line: setFieldPosition.$p[0],
                                            character: startCharacter,
                                        },
                                        end: {
                                            line: setFieldPosition.$p[2],
                                            character: endCharacter,
                                        },
                                    },
                                    source: "lookml-lsp",
                                    code: DiagnosticCode.DRILL_FIELDS_VIEW_NOT_FOUND,
                                });
                                continue;
                            }
                            const viewToCheck =
                                targetedViewName ?? viewDetails.view.$name ?? "";
                            if (!this.fieldExistsInView(viewToCheck, fieldName)) {
                                diagnostics.push({
                                    severity: DiagnosticSeverity.Error,
                                    message: `Field "${fieldName}" not found in view "${targetedViewName}"`,
                                    range: {
                                        start: {
                                            line: setFieldPosition.$p[0],
                                            character: startCharacter,
                                        },
                                        end: {
                                            line: setFieldPosition.$p[2],
                                            character: endCharacter,
                                        },
                                    },
                                    source: "lookml-lsp",
                                    code: DiagnosticCode.DRILL_FIELDS_FIELD_NOT_FOUND,
                                });
                                continue;
                            }
                        }
                    });
                }
            }
        }

        if (parsedStructure.models.length) {
            for (const modelDetails of parsedStructure.models) {
                const modelDiagnostics = this.validateModel(modelDetails);
                diagnostics = [...diagnostics, ...modelDiagnostics];
            }
        }

        return diagnostics;
    }

    public getFileStructure(document: TextDocument): {
        views: LookmlViewWithFileInfo[];
        explores: LookmlExploreWithFileInfo[];
        models: LookmlModelWithFileInfo[];
    } {
        const uri = URI.parse(document.uri).fsPath;
        const views = (this.workspaceModel.getViewsByFile(uri) || [])
            .map((viewName) => this.workspaceModel.getView(viewName))
            .filter((v): v is LookmlViewWithFileInfo => v !== undefined);

        const explores = (this.workspaceModel.getExploresByFile(uri) || [])
            .map((exploreName) => this.workspaceModel.getExplore(exploreName))
            .filter((e): e is LookmlExploreWithFileInfo => e !== undefined);

        const models = (this.workspaceModel.getModelsByFile(uri) || [])
            .map((modelName) => this.workspaceModel.getModel(modelName))
            .filter((m): m is LookmlModelWithFileInfo => m !== undefined);

        return { views, explores, models };
    }

    private validateModel(modelDetails: LookmlModelWithFileInfo): Diagnostic[] {
        const diagnostics: Diagnostic[] = [];
        const modelIncludedViews = this.workspaceModel.getIncludedViewsForModel(
            modelDetails.model.$file_name,
        );

        Object.entries(modelDetails.model).forEach(([key, value]) => {
            switch (key) {
                case "explore":
                    const positions = modelDetails.positions;

                    const models: {
                        [key: string]: LookmlExplore;
                    } = value;

                    Object.values(models).forEach((explore) => {
                        try {
                            exploreSchema.parse(explore);

                            if (explore.join) {
                                for (const [key, join] of Object.entries(
                                    explore.join,
                                )) {
                                    if (join.sql_on) {
                                        const sqlPosition =
                                            positions.explore?.[explore.$name]
                                                ?.join?.[key];
                                        diagnostics.push(
                                            ...this.validateSqlReferences(
                                                join.sql_on,
                                                sqlPosition,
                                            ),
                                        );
                                    }
                                }
                            }

                            if (explore.extends) {
                                for (const [
                                    index,
                                    view,
                                ] of explore.extends.entries()) {
                                    if (
                                        !modelIncludedViews?.has(view) &&
                                        !modelDetails.model.explore?.[view]
                                    ) {
                                        const startLine =
                                            positions.explore?.[explore.$name]
                                                ?.extends?.[index]?.$p[0];
                                        const startCharater =
                                            positions.explore?.[explore.$name]
                                                ?.extends?.[index]?.$p[1];
                                        const endLine =
                                            positions.explore?.[explore.$name]
                                                ?.extends?.[index]?.$p[2];
                                        const endCharater =
                                            startCharater + view.length;

                                        diagnostics.push({
                                            severity: DiagnosticSeverity.Error,
                                            range: {
                                                start: {
                                                    line: startLine,
                                                    character: startCharater,
                                                },
                                                end: {
                                                    line: endLine,
                                                    character: endCharater,
                                                },
                                            },
                                            message: `Extend View: "${view}" not found in model "${modelDetails.model.$file_name}"`,
                                            source: "lookml-lsp",
                                            code: DiagnosticCode.EXPLORE_VIEW_NOT_FOUND,
                                        });
                                    }
                                }
                            }
                        } catch (error: ZodError | unknown) {
                            if (error instanceof ZodError) {
                                for (const issue of error.issues) {
                                    const exploreName = explore.$name;
                                    const path = issue.path as string[];
                                    const fieldPositions = positions.explore;
                                    const explorePositions =
                                        fieldPositions?.[exploreName];

                                    // Traverse the path to get the position
                                    let currentPosition: any = explorePositions;
                                    for (const pathPart of path) {
                                        if (!currentPosition) break;
                                        if (!currentPosition[pathPart]) {
                                            continue;
                                        }

                                        currentPosition =
                                            currentPosition[pathPart];
                                    }
                                    const position = currentPosition as
                                        | LookmlPosition
                                        | undefined;

                                    if (!position) {
                                        throw new Error(
                                            `No position found for explore ${exploreName}`,
                                        );
                                    }

                                    const startLine = position.$p[0];
                                    const startCharacter = position.$p[1];
                                    const endLine = position.$p[2];
                                    const endCharacter = position.$p[3];

                                    diagnostics.push({
                                        severity: DiagnosticSeverity.Error,
                                        message: issue.message,
                                        range: {
                                            start: {
                                                line: startLine,
                                                character: startCharacter,
                                            },
                                            end: {
                                                line: endLine,
                                                character: endCharacter,
                                            },
                                        },
                                        source: "lookml-lsp",
                                        code: DiagnosticCode.PROP_INVALID_PROPERTY,
                                    });
                                    return;
                                }

                                throw error;
                            }
                        }
                    });
            }
        });

        return diagnostics;
    }

    /**
     * Check whether a single include path resolves to an existing file.
     * Uses project root (model file directory) for absolute LookML includes,
     * falls back to suffix matching against all known workspace files.
     */
    private includePathExists(
        includePath: string,
        knownFiles: Set<string>,
        projectRoot: string | null,
    ): boolean {
        if (projectRoot) {
            const cleanPath = includePath.startsWith("/")
                ? includePath.slice(1)
                : includePath;
            const absolutePath = path.resolve(projectRoot, cleanPath);
            if (knownFiles.has(absolutePath) || knownFiles.has(path.normalize(absolutePath))) {
                return true;
            }
            try {
                if (fs.existsSync(absolutePath)) return true;
            } catch { /* ignore */ }
        }

        const normalizedSuffix = includePath.startsWith("/")
            ? includePath.slice(1)
            : includePath;
        for (const filePath of knownFiles) {
            const normalized = filePath.replace(/\\/g, "/");
            if (
                normalized.endsWith("/" + normalizedSuffix) ||
                normalized === normalizedSuffix
            ) {
                return true;
            }
        }
        return false;
    }

    /**
     * Validate that include: paths in the document resolve to existing files.
     */
    private validateIncludes(document: TextDocument): Diagnostic[] {
        const diagnostics: Diagnostic[] = [];
        const text = document.getText();
        const lines = text.split("\n");
        const knownFiles = this.workspaceModel.getAllKnownFiles();
        const projectRoot = this.workspaceModel.getProjectRoot();
        const includePattern = /^\s*include:\s*"([^"]+)"\s*$/;

        for (let i = 0; i < lines.length; i++) {
            const match = includePattern.exec(lines[i]);
            if (!match) continue;

            const includePath = match[1].trim();
            if (includePath.includes("*") || includePath.includes("?")) continue;

            if (!this.includePathExists(includePath, knownFiles, projectRoot)) {
                const colStart = lines[i].indexOf('"') + 1;
                const colEnd = colStart + includePath.length;
                diagnostics.push({
                    severity: DiagnosticSeverity.Error,
                    range: {
                        start: { line: i, character: colStart },
                        end: { line: i, character: colEnd },
                    },
                    message: `Include file not found: "${includePath}". Check the path for typos.`,
                    source: "lookml-lsp",
                    code: DiagnosticCode.INCLUDE_FILE_NOT_FOUND,
                });
            }
        }

        return diagnostics;
    }

    /**
     * Run inaccessible-view validation for explores defined in this document.
     */
    private validateExploreFileInaccessibleViews(
        _document: TextDocument,
    ): Diagnostic[] {
        return [];
    }

    /**
     * Validate all explores: for each view used by an explore, check every field's SQL for
     * cross-view references (${other_view.field}) where the referenced view is not joined.
     * Returns diagnostics keyed by the VIEW file URI (at the field's sql position),
     * matching Looker's error reporting.
     */
    public validateAllExploresInaccessibleViews(): Map<string, Diagnostic[]> {
        const byUri = new Map<string, Diagnostic[]>();

        const appendDiag = (uri: string, diag: Diagnostic) => {
            const list = byUri.get(uri) ?? [];
            list.push(diag);
            byUri.set(uri, list);
        };

        for (const [, exploreDetails] of this.workspaceModel.getExplores()) {
            const explore = exploreDetails.explore;
            const exploreName = explore.$name ?? "";
            const sourceViewName =
                explore.from || explore.view_name || exploreName;
            const aliasName = explore.view_name || exploreName;

            const availableViews = new Set<string>([
                sourceViewName,
                aliasName,
                ...(explore.join ? Object.keys(explore.join) : []),
            ]);

            // All actual view names used in the explore (base + joins with from:)
            const viewNamesToCheck = new Map<string, string>();
            viewNamesToCheck.set(aliasName, sourceViewName);
            if (explore.join) {
                for (const [joinName, join] of Object.entries(explore.join)) {
                    const joinViewName = join.from || joinName;
                    viewNamesToCheck.set(joinName, joinViewName);
                }
            }

            for (const [fieldPrefix, viewName] of viewNamesToCheck) {
                const viewDetails = this.workspaceModel.getView(viewName);
                if (!viewDetails?.view) continue;
                const view = viewDetails.view;
                const viewUri = viewDetails.uri;
                const positions = viewDetails.positions;

                const checkSql = (
                    sql: string | undefined,
                    sqlPos: { $p: number[] } | undefined,
                    fieldName: string,
                ) => {
                    if (!sql) return;
                    const pattern =
                        /\$\{([a-zA-Z0-9_]+)\.([a-zA-Z0-9_.]+)\}/g;
                    let match: RegExpExecArray | null;
                    while ((match = pattern.exec(sql)) !== null) {
                        const refViewName = match[1];
                        if (!availableViews.has(refViewName)) {
                            const range = sqlPos?.$p
                                ? {
                                      start: {
                                          line: sqlPos.$p[0],
                                          character: sqlPos.$p[1],
                                      },
                                      end: {
                                          line: sqlPos.$p[2],
                                          character: sqlPos.$p[3],
                                      },
                                  }
                                : Range.create(0, 0, 0, 0);
                            appendDiag(viewUri, {
                                severity: DiagnosticSeverity.Error,
                                range: ensureMinRangeLength(range),
                                message: `Inaccessible view "${refViewName}" referenced in "${exploreName}.${fieldName}". "${refViewName}" is not accessible in explore "${exploreName}". Check for missing joins in explore "${exploreName}".`,
                                source: "lookml-lsp",
                                code: DiagnosticCode.EXPLORE_INACCESSIBLE_VIEW,
                            });
                        }
                    }
                };

                if (view.dimension) {
                    for (const [name, dim] of Object.entries(view.dimension)) {
                        checkSql(
                            dim.sql,
                            positions?.dimension?.[name]?.sql as any,
                            name,
                        );
                    }
                }
                if (view.measure) {
                    for (const [name, meas] of Object.entries(view.measure)) {
                        checkSql(
                            meas.sql,
                            positions?.measure?.[name]?.sql as any,
                            name,
                        );
                    }
                }
                if (view.dimension_group) {
                    for (const [name, dg] of Object.entries(
                        view.dimension_group,
                    )) {
                        checkSql(
                            dg.sql,
                            positions?.dimension_group?.[name]?.sql as any,
                            name,
                        );
                    }
                }
            }
        }

        return byUri;
    }

    /**
     * Validate include: paths in ALL workspace files (view, explore, model).
     * Returns diagnostics grouped by file URI.
     */
    public validateAllIncludes(): Map<string, Diagnostic[]> {
        const byUri = new Map<string, Diagnostic[]>();
        const knownFiles = this.workspaceModel.getAllKnownFiles();
        const projectRoot = this.workspaceModel.getProjectRoot();
        const includePattern = /^\s*include:\s*"([^"]+)"\s*$/;

        for (const filePath of knownFiles) {
            if (!filePath.endsWith(".lkml")) continue;

            let text: string;
            try {
                text = fs.readFileSync(filePath, "utf-8");
            } catch {
                continue;
            }

            const lines = text.split("\n");
            const fileDiags: Diagnostic[] = [];

            for (let i = 0; i < lines.length; i++) {
                const match = includePattern.exec(lines[i]);
                if (!match) continue;

                const includePath = match[1].trim();
                if (includePath.includes("*") || includePath.includes("?")) continue;

                let found = this.includePathExists(includePath, knownFiles, projectRoot);

                if (!found) {
                    const colStart = lines[i].indexOf('"') + 1;
                    const colEnd = colStart + includePath.length;
                    fileDiags.push({
                        severity: DiagnosticSeverity.Error,
                        range: {
                            start: { line: i, character: colStart },
                            end: { line: i, character: colEnd },
                        },
                        message: `Include file not found: "${includePath}". Check the path for typos.`,
                        source: "lookml-lsp",
                        code: DiagnosticCode.INCLUDE_FILE_NOT_FOUND,
                    });
                }
            }

            if (fileDiags.length > 0) {
                byUri.set(filePath, fileDiags);
            }
        }

        return byUri;
    }

    private validateModelReferences(document: TextDocument): Diagnostic[] {
        const diagnostics: Diagnostic[] = [];
        const modelName = this.workspaceModel.getModelNameFromUri(document.uri);
        if (!modelName) return diagnostics;

        const model = this.workspaceModel.getModel(modelName);
        if (!model) return diagnostics;

        const includedViews =
            this.workspaceModel.getIncludedViewsForModel(modelName) ||
            new Set();

        // Track explores and their available views
        const exploreAvailableViews: Map<string, Set<string>> = new Map();

        // First pass: build explore context and available views
        if (model.model.explore) {
            Object.entries(model.model.explore).forEach(
                ([exploreName, explore]) => {
                    const explore_view =
                        explore.view_name || explore.from || exploreName;
                    // Initialize available views for this explore

                    const exploreViewDetails =
                        this.workspaceModel.getView(exploreName);
                    if (
                        !exploreViewDetails &&
                        !explore.from &&
                        !explore.view_name
                    ) {
                        const explorePosition =
                            model.positions.explore?.[exploreName]?.$name?.$p;
                        if (!explorePosition) {
                            throw new Error(
                                `No position found for explore ${exploreName}`,
                            );
                        }

                        diagnostics.push({
                            severity: DiagnosticSeverity.Error,
                            range: {
                                start: {
                                    line: explorePosition[0],
                                    character: explorePosition[1],
                                },
                                end: {
                                    line: explorePosition[2],
                                    character: explorePosition[3],
                                },
                            },
                            message: `Explore name "${exploreName}" must match a view name, or the explore must provide a 'from:' or 'view_name:' property`,
                            source: "lookml-lsp",
                            code: DiagnosticCode.EXPLORE_VIEW_NOT_FOUND,
                        });
                    }

                    const aliasName = explore.view_name || exploreName;
                    const sourceViewName =
                        explore.from || explore.view_name || exploreName;

                    const availableViews = new Set<string>();
                    availableViews.add(aliasName);
                    availableViews.add(sourceViewName);

                    // Add joined views
                    if (explore.join) {
                        Object.keys(explore.join).forEach((joinName) => {
                            availableViews.add(joinName);
                        });
                    }

                    exploreAvailableViews.set(exploreName, availableViews);
                },
            );
        }

        // Second pass: validate references
        if (model.model.explore) {
            Object.entries(model.model.explore).forEach(
                ([exploreName, explore]) => {
                    const availableViews =
                        exploreAvailableViews.get(exploreName) ??
                        new Set<string>();

                    if (explore.extends) {
                        for (const extend of explore.extends) {
                            const extendAvailableViews =
                                exploreAvailableViews.get(extend);
                            if (extendAvailableViews) {
                                extendAvailableViews.forEach((view) => {
                                    availableViews.add(view);
                                });
                            }
                        }
                    }

                    if (!availableViews) return;
                    const aliasName = explore.view_name || exploreName;
                    const sourceViewName =
                        explore.from || explore.view_name || exploreName;
                    const referredViewDetails =
                        this.workspaceModel.getView(sourceViewName);

                    // Inaccessible view check: views referenced by base or joined views (extends / ${view.field}) must be in the explore
                    const viewNamesInExplore = new Set<string>([
                        sourceViewName,
                        ...(explore.join ? Object.keys(explore.join) : []),
                    ]);
                    const inaccessibleViews = new Set<string>();
                    for (const viewName of viewNamesInExplore) {
                        const viewDetails =
                            this.workspaceModel.getView(viewName);
                        if (!viewDetails?.view) continue;
                        const referenced =
                            this.getReferencedViewNamesFromSql(viewDetails.view);
                        for (const refView of referenced) {
                            if (!availableViews.has(refView)) {
                                inaccessibleViews.add(refView);
                            }
                        }
                    }
                    const explorePosition =
                        model.positions.explore?.[exploreName]?.$name?.$p;
                    const exploreRange = explorePosition
                        ? {
                              start: {
                                  line: explorePosition[0],
                                  character: explorePosition[1],
                              },
                              end: {
                                  line: explorePosition[2],
                                  character: explorePosition[3],
                              },
                          }
                        : Range.create(0, 0, 0, 0);
                    for (const refView of inaccessibleViews) {
                        diagnostics.push({
                            severity: DiagnosticSeverity.Error,
                            range: ensureMinRangeLength(exploreRange),
                            message: `Inaccessible view "${refView}" is not accessible in explore "${exploreName}". Check for missing joins in explore "${exploreName}".`,
                            source: "lookml-lsp",
                            code: DiagnosticCode.EXPLORE_INACCESSIBLE_VIEW,
                        });
                    }

                    if (!referredViewDetails) {
                        // If the view is not found in the workspace at all, emit a "view not found" error.
                        // This applies to both explicit and implicit references.
                        // The range will be the explore name itself.

                        // If neither from or view_name are provided, we already emitted a more specific error above.
                        if (!explore.from && !explore.view_name) {
                            return;
                        }

                        const explorePosition =
                            model.positions.explore?.[exploreName]?.$name?.$p;
                        if (explorePosition) {
                            diagnostics.push({
                                severity: DiagnosticSeverity.Error,
                                range: {
                                    start: {
                                        line: explorePosition[0],
                                        character: explorePosition[1],
                                    },
                                    end: {
                                        line: explorePosition[2],
                                        character: explorePosition[3],
                                    },
                                },
                                message: `Referenced view "${sourceViewName}" not found in workspace`,
                                source: "lookml-lsp",
                                code: DiagnosticCode.VIEW_REF_VIEW_NOT_FOUND,
                            });
                        }
                    } else if (!includedViews.has(sourceViewName)) {
                        diagnostics.push({
                            severity: DiagnosticSeverity.Error,
                            range: this.getRangeFromPositions(
                                model.positions,
                                "explore",
                                exploreName,
                            ),
                            message: `View "${sourceViewName}" exists but is not included in this model`,
                            source: "lookml-lsp",
                            code: DiagnosticCode.VIEW_REF_VIEW_NOT_INCLUDED,
                        });
                    }

                    const exploreContext: Record<
                        string,
                        LookmlViewWithFileInfo
                    > = {};
                    if (referredViewDetails) {
                        exploreContext[aliasName] = referredViewDetails;
                    }

                    if (explore.sql_always_where) {
                        const sqlPosition =
                            model.positions.explore?.[exploreName]
                                ?.sql_always_where;
                        diagnostics.push(
                            ...this.validateSqlReferences(
                                explore.sql_always_where,
                                sqlPosition,
                                undefined,
                                exploreContext,
                            ),
                        );
                    }

                    if (explore.sql_always_having) {
                        const sqlPosition =
                            model.positions.explore?.[exploreName]
                                ?.sql_always_having;
                        diagnostics.push(
                            ...this.validateSqlReferences(
                                explore.sql_always_having,
                                sqlPosition,
                            ),
                        );
                    }

                    // Validate joins
                    if (explore.join) {
                        Object.entries(explore.join).forEach(
                            ([joinName, join]) => {
                                const viewDetails =
                                    this.workspaceModel.getView(joinName);
                                if (!viewDetails) {
                                    const explorePosition =
                                        model.positions.explore?.[exploreName]
                                            ?.join?.[joinName]?.$p;
                                    const range = {
                                        start: {
                                            line: explorePosition[0],
                                            character: explorePosition[1],
                                        },
                                        end: {
                                            line: explorePosition[2],
                                            character: explorePosition[3],
                                        },
                                    };
                                    diagnostics.push({
                                        severity: DiagnosticSeverity.Error,
                                        range,
                                        message: `Referenced view "${joinName}" not found in workspace`,
                                        source: "lookml-lsp",
                                        code: DiagnosticCode.JOIN_VIEW_NOT_FOUND,
                                    });
                                } else if (!includedViews.has(joinName)) {
                                    diagnostics.push({
                                        severity: DiagnosticSeverity.Error,
                                        range: this.getRangeFromPositions(
                                            model.positions,
                                            "explore",
                                            exploreName,
                                            "join",
                                            joinName,
                                        ),
                                        message: `View "${joinName}" exists but is not included in this model`,
                                        source: "lookml-lsp",
                                        code: DiagnosticCode.JOIN_VIEW_NOT_INCLUDED,
                                    });
                                }

                                // Validate sql_on references
                                if (join.sql_on) {
                                    const fieldRefPattern =
                                        /\$\{([a-zA-Z0-9_]+)\.([a-zA-Z0-9_]+)\}/g;
                                    let fieldMatch;

                                    const sqlOnPosition =
                                        model.positions.explore?.[exploreName]
                                            ?.join?.[joinName]?.sql_on;
                                    const startLine = sqlOnPosition?.$p[0];
                                    const startCharater = sqlOnPosition?.$p[1];
                                    const endLine = sqlOnPosition?.$p[2];
                                    const endCharater = sqlOnPosition?.$p[3];

                                    while (
                                        (fieldMatch = fieldRefPattern.exec(
                                            join.sql_on,
                                        )) !== null
                                    ) {
                                        const viewName = fieldMatch[1];
                                        const fieldName = fieldMatch[2];

                                        // Check if view exists and is available
                                        const viewDetails =
                                            this.workspaceModel.getView(
                                                viewName,
                                            );

                                        if (!viewDetails) {
                                            diagnostics.push({
                                                severity:
                                                    DiagnosticSeverity.Error,
                                                range: {
                                                    start: {
                                                        line: startLine,
                                                        character:
                                                            startCharater,
                                                    },
                                                    end: {
                                                        line: endLine,
                                                        character: endCharater,
                                                    },
                                                },
                                                message: `Referenced view "${viewName}" not found in workspace`,
                                                source: "lookml-lsp",
                                                code: DiagnosticCode.SQL_REF_VIEW_NOT_FOUND,
                                            });
                                        } else if (
                                            !availableViews.has(viewName)
                                        ) {
                                            diagnostics.push({
                                                severity:
                                                    DiagnosticSeverity.Error,
                                                range: {
                                                    start: {
                                                        line: startLine,
                                                        character:
                                                            startCharater,
                                                    },
                                                    end: {
                                                        line: endLine,
                                                        character: endCharater,
                                                    },
                                                },
                                                message: `View "${viewName}" is not available in this explore context. It must be joined before it can be referenced.`,
                                                source: "lookml-lsp",
                                                code: DiagnosticCode.SQL_REF_VIEW_NOT_AVAILABLE,
                                            });
                                        } else if (!this.fieldExistsInView(viewName, fieldName)) {
                                            diagnostics.push({
                                                severity:
                                                    DiagnosticSeverity.Error,
                                                range: {
                                                    start: {
                                                        line: startLine,
                                                        character:
                                                            startCharater,
                                                    },
                                                    end: {
                                                        line: endLine,
                                                        character: endCharater,
                                                    },
                                                },
                                                message: `Field "${fieldName}" not found in view "${viewName}"`,
                                                source: "lookml-lsp",
                                                code: DiagnosticCode.SQL_REF_FIELD_NOT_FOUND,
                                            });
                                        }
                                    }
                                }
                            },
                        );
                    }
                },
            );
        }

        return diagnostics;
    }

    private getRangeFromPositions(positions: any, ...path: string[]): Range {
        let current = positions;
        for (const part of path) {
            if (!current) break;
            if (current[part]) {
                current = current[part];
            }
        }

        if (!current || !current.$p) {
            return Range.create(0, 0, 0, 0);
        }

        const [startLine, startChar, endLine, endChar] = current.$p;
        return Range.create(
            Position.create(startLine, startChar),
            Position.create(endLine, endChar),
        );
    }
}
