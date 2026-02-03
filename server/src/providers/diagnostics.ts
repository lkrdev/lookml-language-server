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
}

export class DiagnosticsProvider {
    private workspaceModel: WorkspaceModel;

    constructor(workspaceModel: WorkspaceModel) {
        this.workspaceModel = workspaceModel;
    }

    /**
     * Validate a document and return diagnostics
     */
    public validateDocument(document: TextDocument): Diagnostic[] {
        const diagnostics: Diagnostic[] = [];
        const isView = this.workspaceModel.isViewFile(document);
        // Combine results from all validation checks
        //diagnostics.push(...this.validateSyntax(document));
        if (isView) {
            diagnostics.push(...this.validateProperties(document));
        } else {
            diagnostics.push(...this.validateModelReferences(document));
            diagnostics.push(...this.validateProperties(document));
        }

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

                if (fieldName === "not_included") {
                }

                const view = viewDetails.view;
                if (
                    !view?.dimension?.[fieldName] &&
                    !view?.measure?.[fieldName] &&
                    !view?.dimension_group?.[fieldName]
                ) {
                    diagnostics.push({
                        severity: DiagnosticSeverity.Error,
                        range,
                        message: `Could not find a field named "${ref}"`,
                        code: DiagnosticCode.VIEW_REF_FIELD_NOT_FOUND,
                    });
                }
            } else if (currentViewName) {
                const fieldName = ref;
                const viewDetails =
                    this.workspaceModel.getView(currentViewName);
                if (viewDetails) {
                    const view = viewDetails.view;
                    if (
                        !view.dimension?.[fieldName] &&
                        !view.measure?.[fieldName] &&
                        !view.dimension_group?.[fieldName] &&
                        fieldName !== "TABLE"
                    ) {
                        diagnostics.push({
                            severity: DiagnosticSeverity.Error,
                            range,
                            message: `Could not find a field named "${ref}"`,
                            code: DiagnosticCode.VIEW_REF_FIELD_NOT_FOUND,
                        });
                    }
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

            const viewDimensions = targetedViewDetails.view.dimension;
            const viewMeasures = targetedViewDetails.view.measure;
            const viewDimensionGroups =
                targetedViewDetails.view.dimension_group;

            if (
                !viewDimensions?.[fieldName] &&
                !viewMeasures?.[fieldName] &&
                !viewDimensionGroups?.[fieldName]
            ) {
                if (fieldName.includes("_")) {
                    const fieldSplit = fieldName.split("_");
                    const groupName = fieldSplit.pop();
                    if (!groupName) {
                        throw new Error(
                            `No group name found for field ${fieldName}`,
                        );
                    }
                    const dimensionGroupName = fieldSplit.join("_");
                    const dimensionGroup =
                        viewDimensionGroups?.[dimensionGroupName];
                    const timeframes = dimensionGroup?.timeframes ?? [
                        "time",
                        "date",
                    ];
                    if (
                        viewDimensionGroups?.[dimensionGroupName] &&
                        timeframes.includes(groupName)
                    ) {
                        continue;
                    }
                }

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
                                        "hour",
                                        "minute",
                                        "second",
                                        "hour_of_day",
                                        "minute_of_hour",
                                        "second_of_minute",
                                        "time_of_day",
                                        "day_of_week_index",
                                        "week_start_date",
                                        "month_name",
                                        "quarter_name",
                                        "day_name",
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
                            const viewDimensions =
                                targetedViewDetails.view.dimension;
                            const viewMeasures =
                                targetedViewDetails.view.measure;
                            const viewDimensionGroups =
                                targetedViewDetails.view.dimension_group;

                            if (
                                !viewDimensions?.[fieldName] &&
                                !viewMeasures?.[fieldName] &&
                                !viewDimensionGroups?.[fieldName]
                            ) {
                                if (fieldName.includes("_")) {
                                    const fieldSplit = fieldName.split("_");
                                    const groupName = fieldSplit.pop();

                                    if (!groupName) {
                                        throw new Error(
                                            `No group name found for field ${fieldName}`,
                                        );
                                    }

                                    const dimensionGroupName =
                                        fieldSplit.join("_");
                                    const dimensionGroup =
                                        viewDimensionGroups?.[
                                            dimensionGroupName
                                        ];

                                    const timeframes =
                                        dimensionGroup?.timeframes ?? [
                                            "time",
                                            "date",
                                        ];
                                    if (
                                        viewDimensionGroups?.[
                                            dimensionGroupName
                                        ] &&
                                        timeframes.includes(groupName)
                                    ) {
                                        continue;
                                    }
                                }

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

                    const availableViews = new Set<string>();
                    availableViews.add(aliasName);

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

                                        const viewExtends =
                                            typeof viewDetails?.view
                                                ?.extends === "string"
                                                ? [viewDetails?.view?.extends]
                                                : viewDetails?.view?.extends;
                                        const viewExtensions = viewExtends?.map(
                                            (view) => {
                                                return this.workspaceModel.getView(
                                                    view,
                                                );
                                            },
                                        );

                                        const viewHasField = (
                                            field: string,
                                        ) => {
                                            return Boolean(
                                                viewDetails?.view.measure?.[
                                                    fieldName
                                                ] ||
                                                viewDetails?.view.dimension?.[
                                                    fieldName
                                                ] ||
                                                viewDetails?.view
                                                    .dimension_group?.[
                                                    fieldName
                                                ] ||
                                                viewExtensions?.some(
                                                    (viewDetails) =>
                                                        Boolean(
                                                            viewDetails?.view
                                                                .measure?.[
                                                                fieldName
                                                            ] ||
                                                            viewDetails?.view
                                                                .dimension?.[
                                                                fieldName
                                                            ] ||
                                                            viewDetails?.view
                                                                .dimension_group?.[
                                                                fieldName
                                                            ],
                                                        ),
                                                ),
                                            );
                                        };

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
                                        } else if (!viewHasField(fieldName)) {
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
