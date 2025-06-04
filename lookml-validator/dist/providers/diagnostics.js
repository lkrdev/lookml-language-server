"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DiagnosticsProvider = exports.DiagnosticCode = void 0;
const vscode_languageserver_types_1 = require("vscode-languageserver-types");
const zod_1 = require("zod");
const lookml_1 = require("../schemas/lookml");
const range_1 = require("../utils/range");
var DiagnosticCode;
(function (DiagnosticCode) {
    // Syntax validation (10000-19999)
    DiagnosticCode[DiagnosticCode["SYNTAX_UNBALANCED_CLOSING_BRACE"] = 10001] = "SYNTAX_UNBALANCED_CLOSING_BRACE";
    DiagnosticCode[DiagnosticCode["SYNTAX_UNCLOSED_BRACE"] = 10002] = "SYNTAX_UNCLOSED_BRACE";
    DiagnosticCode[DiagnosticCode["SYNTAX_INVALID_PROPERTY_NAME"] = 10003] = "SYNTAX_INVALID_PROPERTY_NAME";
    DiagnosticCode[DiagnosticCode["SYNTAX_INVALID_INDENTATION"] = 10004] = "SYNTAX_INVALID_INDENTATION";
    DiagnosticCode[DiagnosticCode["SYNTAX_MISSING_SQL_TERMINATOR"] = 10005] = "SYNTAX_MISSING_SQL_TERMINATOR";
    DiagnosticCode[DiagnosticCode["SYNTAX_MISSING_BLOCK_COLON"] = 10006] = "SYNTAX_MISSING_BLOCK_COLON";
    DiagnosticCode[DiagnosticCode["SYNTAX_INVALID_BLOCK_TYPE"] = 10007] = "SYNTAX_INVALID_BLOCK_TYPE";
    // View Reference validation (20000-29999)
    DiagnosticCode[DiagnosticCode["VIEW_REF_FIELD_NOT_FOUND"] = 20001] = "VIEW_REF_FIELD_NOT_FOUND";
    DiagnosticCode[DiagnosticCode["VIEW_REF_VIEW_NOT_FOUND"] = 20002] = "VIEW_REF_VIEW_NOT_FOUND";
    DiagnosticCode[DiagnosticCode["VIEW_REF_VIEW_NOT_INCLUDED"] = 20003] = "VIEW_REF_VIEW_NOT_INCLUDED";
    DiagnosticCode[DiagnosticCode["VIEW_REF_FIELD_IN_SQL"] = 20004] = "VIEW_REF_FIELD_IN_SQL";
    // SQL Reference validation (30000-39999)
    DiagnosticCode[DiagnosticCode["SQL_REF_FIELD_NOT_FOUND"] = 30001] = "SQL_REF_FIELD_NOT_FOUND";
    DiagnosticCode[DiagnosticCode["SQL_REF_VIEW_NOT_FOUND"] = 30002] = "SQL_REF_VIEW_NOT_FOUND";
    DiagnosticCode[DiagnosticCode["SQL_REF_VIEW_NOT_INCLUDED"] = 30003] = "SQL_REF_VIEW_NOT_INCLUDED";
    DiagnosticCode[DiagnosticCode["SQL_REF_VIEW_NOT_AVAILABLE"] = 30004] = "SQL_REF_VIEW_NOT_AVAILABLE";
    // Drill Fields validation (40000-49999)
    DiagnosticCode[DiagnosticCode["DRILL_FIELDS_INVALID_FORMAT"] = 40001] = "DRILL_FIELDS_INVALID_FORMAT";
    DiagnosticCode[DiagnosticCode["DRILL_FIELDS_MISSING_BRACKET"] = 40002] = "DRILL_FIELDS_MISSING_BRACKET";
    DiagnosticCode[DiagnosticCode["DRILL_FIELDS_MISSING_CLOSING"] = 40003] = "DRILL_FIELDS_MISSING_CLOSING";
    DiagnosticCode[DiagnosticCode["DRILL_FIELDS_EMPTY_FIELD"] = 40004] = "DRILL_FIELDS_EMPTY_FIELD";
    DiagnosticCode[DiagnosticCode["DRILL_FIELDS_VIEW_NOT_FOUND"] = 40005] = "DRILL_FIELDS_VIEW_NOT_FOUND";
    DiagnosticCode[DiagnosticCode["DRILL_FIELDS_SET_NOT_FOUND"] = 40006] = "DRILL_FIELDS_SET_NOT_FOUND";
    DiagnosticCode[DiagnosticCode["DRILL_FIELDS_FIELD_NOT_FOUND"] = 40007] = "DRILL_FIELDS_FIELD_NOT_FOUND";
    // Property validation (50000-59999)
    DiagnosticCode[DiagnosticCode["PROP_INVALID_BLOCK_PARENT"] = 50001] = "PROP_INVALID_BLOCK_PARENT";
    DiagnosticCode[DiagnosticCode["PROP_INVALID_CHILD_BLOCK"] = 50002] = "PROP_INVALID_CHILD_BLOCK";
    DiagnosticCode[DiagnosticCode["PROP_INVALID_PROPERTY"] = 50003] = "PROP_INVALID_PROPERTY";
    DiagnosticCode[DiagnosticCode["PROP_INVALID_TYPE"] = 50004] = "PROP_INVALID_TYPE";
    DiagnosticCode[DiagnosticCode["PROP_INVALID_CONTEXT"] = 50005] = "PROP_INVALID_CONTEXT";
    DiagnosticCode[DiagnosticCode["PROP_INVALID_HIDDEN_VALUE"] = 50006] = "PROP_INVALID_HIDDEN_VALUE";
    DiagnosticCode[DiagnosticCode["PROP_PRIMARY_KEY_INVALID_CONTEXT"] = 50007] = "PROP_PRIMARY_KEY_INVALID_CONTEXT";
    DiagnosticCode[DiagnosticCode["PROP_RELATIONSHIP_INVALID_CONTEXT"] = 50008] = "PROP_RELATIONSHIP_INVALID_CONTEXT";
    // Join validation (60000-69999)
    DiagnosticCode[DiagnosticCode["JOIN_VIEW_NOT_FOUND"] = 60001] = "JOIN_VIEW_NOT_FOUND";
    DiagnosticCode[DiagnosticCode["JOIN_FIELD_NOT_FOUND"] = 60002] = "JOIN_FIELD_NOT_FOUND";
    DiagnosticCode[DiagnosticCode["JOIN_VIEW_NOT_INCLUDED"] = 60003] = "JOIN_VIEW_NOT_INCLUDED";
    DiagnosticCode[DiagnosticCode["JOIN_INVALID_RELATIONSHIP"] = 60004] = "JOIN_INVALID_RELATIONSHIP";
    DiagnosticCode[DiagnosticCode["JOIN_VIEW_NOT_AVAILABLE"] = 60005] = "JOIN_VIEW_NOT_AVAILABLE";
    // Explore validation (70000-79999)
    DiagnosticCode[DiagnosticCode["EXPLORE_VIEW_NOT_FOUND"] = 70001] = "EXPLORE_VIEW_NOT_FOUND";
    DiagnosticCode[DiagnosticCode["EXPLORE_FIELD_NOT_FOUND"] = 70002] = "EXPLORE_FIELD_NOT_FOUND";
    DiagnosticCode[DiagnosticCode["EXPLORE_VIEW_NOT_INCLUDED"] = 70003] = "EXPLORE_VIEW_NOT_INCLUDED";
    DiagnosticCode[DiagnosticCode["EXPLORE_INVALID_EXTENDS"] = 70004] = "EXPLORE_INVALID_EXTENDS";
})(DiagnosticCode || (exports.DiagnosticCode = DiagnosticCode = {}));
class DiagnosticsProvider {
    constructor(workspaceModel) {
        this.workspaceModel = workspaceModel;
    }
    /**
     * Validate a document and return diagnostics
     */
    validateDocument(document) {
        var _a;
        const diagnostics = [];
        const isView = this.workspaceModel.isViewFile(document);
        // Combine results from all validation checks
        //diagnostics.push(...this.validateSyntax(document));
        isView ?
            diagnostics.push(...this.validateViewReferences(document)) :
            diagnostics.push(...this.validateModelReferences(document));
        diagnostics.push(...this.validateProperties(document));
        const fileName = (_a = document.uri.split("/").pop()) !== null && _a !== void 0 ? _a : "";
        const errors = this.workspaceModel.getErrorsByFileName(fileName);
        for (const errorDetails of errors) {
            diagnostics.push({
                severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                message: errorDetails.error.exception.message,
                range: (0, range_1.ensureMinRangeLength)({
                    start: {
                        line: errorDetails.error.exception.location.start.line - 1,
                        character: errorDetails.error.exception.location.start.column - 1
                    },
                    end: {
                        line: errorDetails.error.exception.location.end.line - 1,
                        character: errorDetails.error.exception.location.end.column - 1
                    },
                }),
            });
        }
        return diagnostics;
    }
    validateSqlReferences(sql, position, context) {
        const diagnostics = [];
        if (!position)
            return diagnostics;
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
            if (!match[0].startsWith("${") || !match[0].endsWith("}")) {
                diagnostics.push({
                    severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                    range,
                    message: "Invalid field reference syntax. Use ${view_name.field_name}",
                    source: "lookml-lsp",
                    code: DiagnosticCode.VIEW_REF_FIELD_IN_SQL
                });
            }
            const sql = match[1];
            if (sql.includes(".")) {
                const sqlParts = sql.split(".");
                const viewName = sqlParts[0];
                const fieldName = sqlParts[1];
                const viewDetails = (context === null || context === void 0 ? void 0 : context[viewName]) ? context[viewName] : this.workspaceModel.getView(viewName);
                if (!viewDetails) {
                    diagnostics.push({
                        severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                        range,
                        message: `View "${viewName}" not found in workspace`,
                    });
                    continue;
                }
                // todo, validate field references
            }
        }
        // ❌ Detect malformed references (e.g. $foo, $foo}, ${bar)
        while ((match = invalidRefPattern.exec(sql)) !== null) {
            diagnostics.push({
                severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                range,
                message: "Malformed LookML reference. Use full ${view.field} syntax.",
                source: "lookml-lsp",
                code: DiagnosticCode.VIEW_REF_FIELD_IN_SQL
            });
        }
        return diagnostics;
    }
    validateViewReferences(document) {
        const diagnostics = [];
        const uri = document.uri.replace("file://", "");
        const viewNames = this.workspaceModel.getViewsByFile(uri);
        if (!(viewNames === null || viewNames === void 0 ? void 0 : viewNames.length))
            return diagnostics;
        // Process each view in the file
        for (const viewName of viewNames) {
            const viewDetails = this.workspaceModel.getView(viewName);
            if (!viewDetails)
                continue;
            const positions = viewDetails.positions;
            // Validate dimensions
            if (viewDetails.view.dimension) {
                Object.entries(viewDetails.view.dimension).forEach(([dimName, dimension]) => {
                    var _a, _b;
                    if (!dimension.sql) {
                        return;
                    }
                    const sqlPosition = (_b = (_a = positions === null || positions === void 0 ? void 0 : positions.dimension) === null || _a === void 0 ? void 0 : _a[dimName]) === null || _b === void 0 ? void 0 : _b.sql;
                    diagnostics.push(...this.validateSqlReferences(dimension.sql, sqlPosition));
                });
            }
            // Validate dimension groups
            if (viewDetails.view.dimension_group) {
                Object.entries(viewDetails.view.dimension_group).forEach(([dimGroupName, dimensionGroup]) => {
                    var _a, _b;
                    if (!dimensionGroup.sql) {
                        return;
                    }
                    const sqlPosition = (_b = (_a = positions === null || positions === void 0 ? void 0 : positions.dimension_group) === null || _a === void 0 ? void 0 : _a[dimGroupName]) === null || _b === void 0 ? void 0 : _b.sql;
                    diagnostics.push(...this.validateSqlReferences(dimensionGroup.sql, sqlPosition));
                });
            }
            // Validate measures
            if (viewDetails.view.measure) {
                Object.entries(viewDetails.view.measure).forEach(([measureName, measure]) => {
                    var _a, _b;
                    if (!measure.sql) {
                        return;
                    }
                    const sqlPosition = (_b = (_a = positions === null || positions === void 0 ? void 0 : positions.measure) === null || _a === void 0 ? void 0 : _a[measureName]) === null || _b === void 0 ? void 0 : _b.sql;
                    diagnostics.push(...this.validateSqlReferences(measure.sql, sqlPosition));
                });
            }
        }
        return diagnostics;
    }
    validateDrillFields({ view, drillFields, viewDetails, arrayPosition, }) {
        var _a, _b, _c;
        const diagnostics = [];
        for (const [index, drillField] of drillFields.entries()) {
            let fieldName = drillField;
            let targetedViewName = view.$name;
            let targetedViewDetails = viewDetails;
            const drillFieldPosition = arrayPosition === null || arrayPosition === void 0 ? void 0 : arrayPosition[index];
            if (!drillFieldPosition) {
                throw new Error(`No position found for drill field ${drillField}`);
            }
            if (drillField.includes("*")) {
                const fieldWithoutAsterisk = drillField.replace("*", "");
                const startCharater = drillFieldPosition.$p[1];
                const isReferencingADifferentView = targetedViewName !== view.$name;
                const endCharater = isReferencingADifferentView && targetedViewName ? startCharater + fieldWithoutAsterisk.length : drillFieldPosition.$p[3];
                if (!((_b = (_a = targetedViewDetails === null || targetedViewDetails === void 0 ? void 0 : targetedViewDetails.view) === null || _a === void 0 ? void 0 : _a.set) === null || _b === void 0 ? void 0 : _b[fieldWithoutAsterisk])) {
                    diagnostics.push({
                        severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                        range: {
                            start: { line: drillFieldPosition.$p[0], character: startCharater },
                            end: { line: drillFieldPosition.$p[2], character: endCharater }
                        },
                        message: `Set "${fieldWithoutAsterisk}" not found in view "${targetedViewName}"`,
                        source: "lookml-lsp",
                        code: DiagnosticCode.DRILL_FIELDS_SET_NOT_FOUND
                    });
                }
                continue;
            }
            if (drillField.includes(".")) {
                const drillFieldParts = drillField.split(".");
                targetedViewName = drillFieldParts[0];
                fieldName = drillFieldParts[1];
                targetedViewDetails = this.workspaceModel.getView(targetedViewName);
            }
            const startCharater = drillFieldPosition.$p[1];
            const isReferencingADifferentView = targetedViewName !== view.$name;
            const endCharater = isReferencingADifferentView && targetedViewName ? startCharater + targetedViewName.length : drillFieldPosition.$p[3];
            if (!targetedViewDetails) {
                diagnostics.push({
                    severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                    message: `View ${targetedViewName} not found`,
                    range: {
                        start: { line: drillFieldPosition.$p[0], character: startCharater },
                        end: { line: drillFieldPosition.$p[2], character: endCharater }
                    },
                    source: "lookml-lsp",
                    code: DiagnosticCode.DRILL_FIELDS_VIEW_NOT_FOUND
                });
                continue;
            }
            const viewDimensions = targetedViewDetails.view.dimension;
            const viewMeasures = targetedViewDetails.view.measure;
            const viewDimensionGroups = targetedViewDetails.view.dimension_group;
            if (!(viewDimensions === null || viewDimensions === void 0 ? void 0 : viewDimensions[fieldName]) && !(viewMeasures === null || viewMeasures === void 0 ? void 0 : viewMeasures[fieldName]) && !(viewDimensionGroups === null || viewDimensionGroups === void 0 ? void 0 : viewDimensionGroups[fieldName])) {
                if (fieldName.includes("_")) {
                    const fieldSplit = fieldName.split("_");
                    const groupName = fieldSplit.pop();
                    if (!groupName) {
                        throw new Error(`No group name found for field ${fieldName}`);
                    }
                    const dimensionGroupName = fieldSplit.join("_");
                    const dimensionGroup = viewDimensionGroups === null || viewDimensionGroups === void 0 ? void 0 : viewDimensionGroups[dimensionGroupName];
                    const timeframes = (_c = dimensionGroup === null || dimensionGroup === void 0 ? void 0 : dimensionGroup.timeframes) !== null && _c !== void 0 ? _c : ["time", "date"];
                    if ((viewDimensionGroups === null || viewDimensionGroups === void 0 ? void 0 : viewDimensionGroups[dimensionGroupName]) && timeframes.includes(groupName)) {
                        continue;
                    }
                }
                diagnostics.push({
                    severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                    message: `Field "${fieldName}" not found in view "${targetedViewDetails.view.$name}"`,
                    range: {
                        start: { line: drillFieldPosition.$p[0], character: startCharater },
                        end: { line: drillFieldPosition.$p[2], character: endCharater }
                    },
                    source: "lookml-lsp",
                    code: DiagnosticCode.DRILL_FIELDS_FIELD_NOT_FOUND
                });
            }
        }
        return diagnostics;
    }
    // Then in the validation method:
    validateProperties(document) {
        let diagnostics = [];
        // Parse the document into a structure
        const parsedStructure = this.getFileStructure(document);
        if (parsedStructure.views.length) {
            for (const viewDetails of parsedStructure.views) {
                const positions = viewDetails.positions;
                const view = viewDetails.view;
                // Validate the view structure using Zod schema
                const result = lookml_1.LookMLView.safeParse(view);
                if (!result.success) {
                    // Add validation errors to diagnostics
                    result.error.errors.forEach((error) => {
                        let currentPosition = positions;
                        for (const pathPart of error.path) {
                            if (!currentPosition)
                                break;
                            if (!currentPosition[pathPart]) {
                                continue;
                            }
                            currentPosition = currentPosition[pathPart];
                        }
                        const position = currentPosition;
                        if ((position === null || position === void 0 ? void 0 : position.$p) && Array.isArray(position.$p)) {
                            diagnostics.push({
                                severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                                range: {
                                    start: { line: position.$p[0], character: position.$p[1] },
                                    end: { line: position.$p[2], character: position.$p[3] }
                                },
                                message: error.message,
                                source: "lookml-lsp"
                            });
                        }
                    });
                }
                // Additional validations that can't be expressed in the schema
                if (view.extends && 'extends_ref' in view) {
                    diagnostics.push({
                        severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                        range: this.getRangeFromPositions(positions, '$name', 'extends_ref'),
                        message: "Cannot use both 'extends' and 'extends_ref' in the same view",
                        source: "lookml-lsp"
                    });
                }
                // Validate dimensions
                if (view.dimension) {
                    Object.entries(view.dimension).forEach(([dimName, dimension]) => {
                        var _a, _b, _c, _d;
                        // Validate drill fields
                        if (dimension.drill_fields) {
                            diagnostics.push(...this.validateDrillFields({
                                view,
                                drillFields: dimension.drill_fields,
                                viewDetails: viewDetails,
                                arrayPosition: (_b = (_a = positions === null || positions === void 0 ? void 0 : positions.dimension) === null || _a === void 0 ? void 0 : _a[dimName]) === null || _b === void 0 ? void 0 : _b.drill_fields,
                            }));
                        }
                        // Validate SQL references
                        if (dimension.sql) {
                            const sqlPosition = (_d = (_c = positions === null || positions === void 0 ? void 0 : positions.dimension) === null || _c === void 0 ? void 0 : _c[dimName]) === null || _d === void 0 ? void 0 : _d.sql;
                            diagnostics.push(...this.validateSqlReferences(dimension.sql, sqlPosition));
                        }
                    });
                }
                // Validate measures
                if (view.measure) {
                    Object.entries(view.measure).forEach(([measureName, measure]) => {
                        var _a, _b, _c, _d;
                        // Validate drill fields
                        if (measure.drill_fields) {
                            diagnostics.push(...this.validateDrillFields({
                                view,
                                drillFields: measure.drill_fields,
                                viewDetails: viewDetails,
                                arrayPosition: (_b = (_a = positions === null || positions === void 0 ? void 0 : positions.measure) === null || _a === void 0 ? void 0 : _a[measureName]) === null || _b === void 0 ? void 0 : _b.drill_fields,
                            }));
                        }
                        // Validate SQL references
                        if (measure.sql) {
                            const sqlPosition = (_d = (_c = positions === null || positions === void 0 ? void 0 : positions.measure) === null || _c === void 0 ? void 0 : _c[measureName]) === null || _d === void 0 ? void 0 : _d.sql;
                            diagnostics.push(...this.validateSqlReferences(measure.sql, sqlPosition));
                        }
                    });
                }
                // Validate dimension groups
                if (view.dimension_group) {
                    Object.entries(view.dimension_group).forEach(([dimGroupName, dimensionGroup]) => {
                        var _a, _b, _c, _d;
                        // Validate SQL references
                        if (dimensionGroup.sql) {
                            const sqlPosition = (_b = (_a = positions === null || positions === void 0 ? void 0 : positions.dimension_group) === null || _a === void 0 ? void 0 : _a[dimGroupName]) === null || _b === void 0 ? void 0 : _b.sql;
                            diagnostics.push(...this.validateSqlReferences(dimensionGroup.sql, sqlPosition));
                        }
                        // Validate timeframes
                        if (dimensionGroup.timeframes) {
                            const timeframesPosition = (_d = (_c = positions === null || positions === void 0 ? void 0 : positions.dimension_group) === null || _c === void 0 ? void 0 : _c[dimGroupName]) === null || _d === void 0 ? void 0 : _d.timeframes;
                            if (timeframesPosition) {
                                const validTimeframes = [
                                    'raw', 'time', 'date', 'week', 'month', 'quarter', 'year',
                                    'day_of_week', 'day_of_month', 'day_of_year', 'week_of_year',
                                    'month_of_year', 'quarter_of_year', 'hour', 'minute', 'second',
                                    'hour_of_day', 'minute_of_hour', 'second_of_minute', 'time_of_day',
                                    'day_of_week_index', 'week_start_date', 'month_name', 'quarter_name',
                                    'day_name'
                                ];
                                for (const [index, timeframe] of dimensionGroup.timeframes.entries()) {
                                    if (!validTimeframes.includes(timeframe)) {
                                        const timeframePosition = timeframesPosition[index];
                                        if (timeframePosition) {
                                            diagnostics.push({
                                                severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                                                range: {
                                                    start: { line: timeframePosition.$p[0], character: timeframePosition.$p[1] },
                                                    end: { line: timeframePosition.$p[2], character: timeframePosition.$p[3] }
                                                },
                                                message: `Invalid timeframe "${timeframe}" for dimension group "${dimGroupName}"`,
                                                source: "lookml-lsp",
                                                code: DiagnosticCode.PROP_INVALID_TYPE
                                            });
                                        }
                                    }
                                }
                            }
                        }
                    });
                }
                if (view.set) {
                    Object.entries(view.set).forEach(([setName, set]) => {
                        var _a, _b, _c, _d, _e, _f;
                        for (const [index, field] of (_b = (_a = set === null || set === void 0 ? void 0 : set.fields) === null || _a === void 0 ? void 0 : _a.entries()) !== null && _b !== void 0 ? _b : []) {
                            let fieldName = field;
                            let targetedViewName = viewDetails.view.$name;
                            let targetedViewDetails = viewDetails;
                            const setFieldPosition = (_e = (_d = (_c = positions.set) === null || _c === void 0 ? void 0 : _c[setName]) === null || _d === void 0 ? void 0 : _d.fields) === null || _e === void 0 ? void 0 : _e[index];
                            if (!setFieldPosition) {
                                throw new Error(`No position found for set field ${field}`);
                            }
                            if (field.includes(".")) {
                                const fieldParts = field.split(".");
                                targetedViewName = fieldParts[0];
                                fieldName = fieldParts[1];
                                targetedViewDetails = this.workspaceModel.getView(targetedViewName);
                            }
                            const startCharacter = setFieldPosition.$p[1];
                            const isReferencingADifferentView = targetedViewName !== viewDetails.view.$name;
                            const endCharacter = isReferencingADifferentView && targetedViewName ? startCharacter + targetedViewName.length : setFieldPosition.$p[3];
                            if (!targetedViewDetails) {
                                diagnostics.push({
                                    severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                                    message: `View ${targetedViewName} not found`,
                                    range: {
                                        start: { line: setFieldPosition.$p[0], character: startCharacter },
                                        end: { line: setFieldPosition.$p[2], character: endCharacter }
                                    },
                                    source: "lookml-lsp",
                                    code: DiagnosticCode.DRILL_FIELDS_VIEW_NOT_FOUND
                                });
                                continue;
                            }
                            const viewDimensions = targetedViewDetails.view.dimension;
                            const viewMeasures = targetedViewDetails.view.measure;
                            const viewDimensionGroups = targetedViewDetails.view.dimension_group;
                            if (!(viewDimensions === null || viewDimensions === void 0 ? void 0 : viewDimensions[fieldName]) && !(viewMeasures === null || viewMeasures === void 0 ? void 0 : viewMeasures[fieldName]) && !(viewDimensionGroups === null || viewDimensionGroups === void 0 ? void 0 : viewDimensionGroups[fieldName])) {
                                if (fieldName.includes("_")) {
                                    const fieldSplit = fieldName.split("_");
                                    const groupName = fieldSplit.pop();
                                    if (!groupName) {
                                        throw new Error(`No group name found for field ${fieldName}`);
                                    }
                                    const dimensionGroupName = fieldSplit.join("_");
                                    const dimensionGroup = viewDimensionGroups === null || viewDimensionGroups === void 0 ? void 0 : viewDimensionGroups[dimensionGroupName];
                                    const timeframes = (_f = dimensionGroup === null || dimensionGroup === void 0 ? void 0 : dimensionGroup.timeframes) !== null && _f !== void 0 ? _f : ["time", "date"];
                                    if ((viewDimensionGroups === null || viewDimensionGroups === void 0 ? void 0 : viewDimensionGroups[dimensionGroupName]) && timeframes.includes(groupName)) {
                                        continue;
                                    }
                                }
                                diagnostics.push({
                                    severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                                    message: `Field "${fieldName}" not found in view "${targetedViewName}"`,
                                    range: {
                                        start: { line: setFieldPosition.$p[0], character: startCharacter },
                                        end: { line: setFieldPosition.$p[2], character: endCharacter }
                                    },
                                    source: "lookml-lsp",
                                    code: DiagnosticCode.DRILL_FIELDS_FIELD_NOT_FOUND
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
    getFileStructure(document) {
        const uri = document.uri.replace("file://", "");
        const views = (this.workspaceModel.getViewsByFile(uri) || [])
            .map(viewName => this.workspaceModel.getView(viewName))
            .filter((v) => v !== undefined);
        const explores = (this.workspaceModel.getExploresByFile(uri) || [])
            .map(exploreName => this.workspaceModel.getExplore(exploreName))
            .filter((e) => e !== undefined);
        const models = (this.workspaceModel.getModelsByFile(uri) || [])
            .map(modelName => this.workspaceModel.getModel(modelName))
            .filter((m) => m !== undefined);
        return { views, explores, models };
    }
    validateModel(modelDetails) {
        const diagnostics = [];
        const modelIncludedViews = this.workspaceModel.getIncludedViewsForModel(modelDetails.model.$file_name);
        Object.entries(modelDetails.model).forEach(([key, value]) => {
            switch (key) {
                case "explore":
                    const positions = modelDetails.positions;
                    const models = value;
                    Object.values(models).forEach((explore) => {
                        var _a, _b, _c, _d, _e, _f, _g, _h, _j, _k, _l, _m, _o, _p, _q, _r;
                        try {
                            lookml_1.exploreSchema.parse(explore);
                            if (explore.join) {
                                for (const [key, join] of Object.entries(explore.join)) {
                                    if (join.sql_on) {
                                        const sqlPosition = (_c = (_b = (_a = positions.explore) === null || _a === void 0 ? void 0 : _a[explore.$name]) === null || _b === void 0 ? void 0 : _b.join) === null || _c === void 0 ? void 0 : _c[key];
                                        diagnostics.push(...this.validateSqlReferences(join.sql_on, sqlPosition));
                                    }
                                }
                            }
                            if (explore.extends) {
                                for (const [index, view] of explore.extends.entries()) {
                                    if (!(modelIncludedViews === null || modelIncludedViews === void 0 ? void 0 : modelIncludedViews.has(view)) && !((_d = modelDetails.model.explore) === null || _d === void 0 ? void 0 : _d[view])) {
                                        const startLine = (_h = (_g = (_f = (_e = positions.explore) === null || _e === void 0 ? void 0 : _e[explore.$name]) === null || _f === void 0 ? void 0 : _f.extends) === null || _g === void 0 ? void 0 : _g[index]) === null || _h === void 0 ? void 0 : _h.$p[0];
                                        const startCharater = (_m = (_l = (_k = (_j = positions.explore) === null || _j === void 0 ? void 0 : _j[explore.$name]) === null || _k === void 0 ? void 0 : _k.extends) === null || _l === void 0 ? void 0 : _l[index]) === null || _m === void 0 ? void 0 : _m.$p[1];
                                        const endLine = (_r = (_q = (_p = (_o = positions.explore) === null || _o === void 0 ? void 0 : _o[explore.$name]) === null || _p === void 0 ? void 0 : _p.extends) === null || _q === void 0 ? void 0 : _q[index]) === null || _r === void 0 ? void 0 : _r.$p[2];
                                        const endCharater = startCharater + view.length;
                                        diagnostics.push({
                                            severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                                            range: {
                                                start: { line: startLine, character: startCharater },
                                                end: { line: endLine, character: endCharater }
                                            },
                                            message: `Extend View: "${view}" not found in model "${modelDetails.model.$file_name}"`,
                                            source: "lookml-lsp",
                                            code: DiagnosticCode.EXPLORE_VIEW_NOT_FOUND
                                        });
                                    }
                                }
                            }
                        }
                        catch (error) {
                            if (error instanceof zod_1.ZodError) {
                                for (const issue of error.issues) {
                                    const exploreName = explore.$name;
                                    const path = issue.path;
                                    const fieldPositions = positions.explore;
                                    const explorePositions = fieldPositions === null || fieldPositions === void 0 ? void 0 : fieldPositions[exploreName];
                                    // Traverse the path to get the position
                                    let currentPosition = explorePositions;
                                    for (const pathPart of path) {
                                        if (!currentPosition)
                                            break;
                                        if (!currentPosition[pathPart]) {
                                            continue;
                                        }
                                        currentPosition = currentPosition[pathPart];
                                    }
                                    const position = currentPosition;
                                    if (!position) {
                                        throw new Error(`No position found for explore ${exploreName}`);
                                    }
                                    const startLine = position.$p[0];
                                    const startCharacter = position.$p[1];
                                    const endLine = position.$p[2];
                                    const endCharacter = position.$p[3];
                                    diagnostics.push({
                                        severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                                        message: issue.message,
                                        range: {
                                            start: { line: startLine, character: startCharacter },
                                            end: { line: endLine, character: endCharacter }
                                        },
                                        source: "lookml-lsp",
                                        code: DiagnosticCode.PROP_INVALID_PROPERTY
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
    validateModelReferences(document) {
        const diagnostics = [];
        const modelName = this.workspaceModel.getModelNameFromUri(document.uri);
        if (!modelName)
            return diagnostics;
        const model = this.workspaceModel.getModel(modelName);
        if (!model)
            return diagnostics;
        const includedViews = this.workspaceModel.getIncludedViewsForModel(modelName) || new Set();
        // Track explores and their available views
        const exploreAvailableViews = new Map();
        // First pass: build explore context and available views
        if (model.model.explore) {
            Object.entries(model.model.explore).forEach(([exploreName, explore]) => {
                var _a, _b, _c;
                const explore_view = explore.view_name || explore.from || exploreName;
                // Initialize available views for this explore
                const exploreViewDetails = this.workspaceModel.getView(exploreName);
                if (!exploreViewDetails && !explore.from && !explore.view_name) {
                    const explorePosition = (_c = (_b = (_a = model.positions.explore) === null || _a === void 0 ? void 0 : _a[exploreName]) === null || _b === void 0 ? void 0 : _b.$name) === null || _c === void 0 ? void 0 : _c.$p;
                    if (!explorePosition) {
                        throw new Error(`No position found for explore ${exploreName}`);
                    }
                    diagnostics.push({
                        severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                        range: {
                            start: { line: explorePosition[0], character: explorePosition[1] },
                            end: { line: explorePosition[2], character: explorePosition[3] }
                        },
                        message: `Explore "${exploreName}" must have a base view`,
                        source: "lookml-lsp",
                        code: DiagnosticCode.EXPLORE_VIEW_NOT_FOUND
                    });
                }
                const availableViews = new Set();
                if (exploreViewDetails) {
                    availableViews.add(exploreName);
                }
                ;
                // Add the base view
                if (explore.from) {
                    availableViews.add(explore.from);
                }
                // Add joined views
                if (explore.join) {
                    Object.keys(explore.join).forEach(joinName => {
                        availableViews.add(joinName);
                    });
                }
                exploreAvailableViews.set(exploreName, availableViews);
            });
        }
        // Second pass: validate references
        if (model.model.explore) {
            Object.entries(model.model.explore).forEach(([exploreName, explore]) => {
                var _a, _b, _c, _d, _e, _f;
                const availableViews = (_a = exploreAvailableViews.get(exploreName)) !== null && _a !== void 0 ? _a : new Set();
                if (explore.extends) {
                    for (const extend of explore.extends) {
                        const extendAvailableViews = exploreAvailableViews.get(extend);
                        if (extendAvailableViews) {
                            extendAvailableViews.forEach(view => {
                                availableViews.add(view);
                            });
                        }
                    }
                }
                if (!availableViews)
                    return;
                if (explore.from) {
                    const viewName = explore.from;
                    const viewDetails = this.workspaceModel.getView(viewName);
                    if (!viewDetails) {
                        diagnostics.push({
                            severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                            range: this.getRangeFromPositions(model.positions, 'explore', exploreName, 'from'),
                            message: `Referenced view "${viewName}" not found in workspace`,
                            source: "lookml-lsp",
                            code: DiagnosticCode.VIEW_REF_VIEW_NOT_FOUND
                        });
                    }
                    else if (!includedViews.has(viewName)) {
                        diagnostics.push({
                            severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                            range: this.getRangeFromPositions(model.positions, 'explore', exploreName, 'from'),
                            message: `View "${viewName}" exists but is not included in this model`,
                            source: "lookml-lsp",
                            code: DiagnosticCode.VIEW_REF_VIEW_NOT_INCLUDED
                        });
                    }
                }
                const exploreContext = {
                    [(_b = explore.view_name) !== null && _b !== void 0 ? _b : exploreName]: {}
                };
                if (explore.sql_always_where) {
                    const sqlPosition = (_d = (_c = model.positions.explore) === null || _c === void 0 ? void 0 : _c[exploreName]) === null || _d === void 0 ? void 0 : _d.sql_always_where;
                    diagnostics.push(...this.validateSqlReferences(explore.sql_always_where, sqlPosition, exploreContext));
                }
                if (explore.sql_always_having) {
                    const sqlPosition = (_f = (_e = model.positions.explore) === null || _e === void 0 ? void 0 : _e[exploreName]) === null || _f === void 0 ? void 0 : _f.sql_always_having;
                    diagnostics.push(...this.validateSqlReferences(explore.sql_always_having, sqlPosition));
                }
                // Validate joins
                if (explore.join) {
                    Object.entries(explore.join).forEach(([joinName, join]) => {
                        var _a, _b, _c, _d, _e, _f, _g, _h, _j, _k, _l;
                        const viewDetails = this.workspaceModel.getView(joinName);
                        if (!viewDetails) {
                            const explorePosition = (_d = (_c = (_b = (_a = model.positions.explore) === null || _a === void 0 ? void 0 : _a[exploreName]) === null || _b === void 0 ? void 0 : _b.join) === null || _c === void 0 ? void 0 : _c[joinName]) === null || _d === void 0 ? void 0 : _d.$p;
                            const range = {
                                start: { line: explorePosition[0], character: explorePosition[1] },
                                end: { line: explorePosition[2], character: explorePosition[3] }
                            };
                            diagnostics.push({
                                severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                                range,
                                message: `Referenced view "${joinName}" not found in workspace`,
                                source: "lookml-lsp",
                                code: DiagnosticCode.JOIN_VIEW_NOT_FOUND
                            });
                        }
                        else if (!includedViews.has(joinName)) {
                            diagnostics.push({
                                severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                                range: this.getRangeFromPositions(model.positions, 'explore', exploreName, 'join', joinName),
                                message: `View "${joinName}" exists but is not included in this model`,
                                source: "lookml-lsp",
                                code: DiagnosticCode.JOIN_VIEW_NOT_INCLUDED
                            });
                        }
                        // Validate sql_on references
                        if (join.sql_on) {
                            const fieldRefPattern = /\$\{([a-zA-Z0-9_]+)\.([a-zA-Z0-9_]+)\}/g;
                            let fieldMatch;
                            const sqlOnPosition = (_h = (_g = (_f = (_e = model.positions.explore) === null || _e === void 0 ? void 0 : _e[exploreName]) === null || _f === void 0 ? void 0 : _f.join) === null || _g === void 0 ? void 0 : _g[joinName]) === null || _h === void 0 ? void 0 : _h.sql_on;
                            const startLine = sqlOnPosition === null || sqlOnPosition === void 0 ? void 0 : sqlOnPosition.$p[0];
                            const startCharater = sqlOnPosition === null || sqlOnPosition === void 0 ? void 0 : sqlOnPosition.$p[1];
                            const endLine = sqlOnPosition === null || sqlOnPosition === void 0 ? void 0 : sqlOnPosition.$p[2];
                            const endCharater = sqlOnPosition === null || sqlOnPosition === void 0 ? void 0 : sqlOnPosition.$p[3];
                            while ((fieldMatch = fieldRefPattern.exec(join.sql_on)) !== null) {
                                const viewName = fieldMatch[1];
                                const fieldName = fieldMatch[2];
                                // Check if view exists and is available
                                const viewDetails = this.workspaceModel.getView(viewName);
                                const viewExtends = typeof ((_j = viewDetails === null || viewDetails === void 0 ? void 0 : viewDetails.view) === null || _j === void 0 ? void 0 : _j.extends) === 'string' ? [(_k = viewDetails === null || viewDetails === void 0 ? void 0 : viewDetails.view) === null || _k === void 0 ? void 0 : _k.extends] : (_l = viewDetails === null || viewDetails === void 0 ? void 0 : viewDetails.view) === null || _l === void 0 ? void 0 : _l.extends;
                                const viewExtensions = viewExtends === null || viewExtends === void 0 ? void 0 : viewExtends.map((view) => {
                                    return this.workspaceModel.getView(view);
                                });
                                const viewHasField = (field) => {
                                    var _a, _b, _c;
                                    return Boolean(((_a = viewDetails === null || viewDetails === void 0 ? void 0 : viewDetails.view.measure) === null || _a === void 0 ? void 0 : _a[fieldName]) ||
                                        ((_b = viewDetails === null || viewDetails === void 0 ? void 0 : viewDetails.view.dimension) === null || _b === void 0 ? void 0 : _b[fieldName]) ||
                                        ((_c = viewDetails === null || viewDetails === void 0 ? void 0 : viewDetails.view.dimension_group) === null || _c === void 0 ? void 0 : _c[fieldName]) ||
                                        (viewExtensions === null || viewExtensions === void 0 ? void 0 : viewExtensions.some((viewDetails) => {
                                            var _a, _b, _c;
                                            return Boolean(((_a = viewDetails === null || viewDetails === void 0 ? void 0 : viewDetails.view.measure) === null || _a === void 0 ? void 0 : _a[fieldName]) ||
                                                ((_b = viewDetails === null || viewDetails === void 0 ? void 0 : viewDetails.view.dimension) === null || _b === void 0 ? void 0 : _b[fieldName]) ||
                                                ((_c = viewDetails === null || viewDetails === void 0 ? void 0 : viewDetails.view.dimension_group) === null || _c === void 0 ? void 0 : _c[fieldName]));
                                        })));
                                };
                                if (!viewDetails) {
                                    diagnostics.push({
                                        severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                                        range: {
                                            start: { line: startLine, character: startCharater },
                                            end: { line: endLine, character: endCharater }
                                        },
                                        message: `Referenced view "${viewName}" not found in workspace`,
                                        source: "lookml-lsp",
                                        code: DiagnosticCode.SQL_REF_VIEW_NOT_FOUND
                                    });
                                }
                                else if (!availableViews.has(viewName)) {
                                    diagnostics.push({
                                        severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                                        range: {
                                            start: { line: startLine, character: startCharater },
                                            end: { line: endLine, character: endCharater }
                                        },
                                        message: `View "${viewName}" is not available in this explore context. It must be joined before it can be referenced.`,
                                        source: "lookml-lsp",
                                        code: DiagnosticCode.SQL_REF_VIEW_NOT_AVAILABLE
                                    });
                                }
                                else if (!viewHasField(fieldName)) {
                                    diagnostics.push({
                                        severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                                        range: {
                                            start: { line: startLine, character: startCharater },
                                            end: { line: endLine, character: endCharater }
                                        },
                                        message: `Field "${fieldName}" not found in view "${viewName}"`,
                                        source: "lookml-lsp",
                                        code: DiagnosticCode.SQL_REF_FIELD_NOT_FOUND
                                    });
                                }
                            }
                        }
                    });
                }
            });
        }
        return diagnostics;
    }
    getRangeFromPositions(positions, ...path) {
        let current = positions;
        for (const part of path) {
            if (!current)
                break;
            if (current[part]) {
                current = current[part];
            }
        }
        if (!current || !current.$p) {
            return vscode_languageserver_types_1.Range.create(0, 0, 0, 0);
        }
        const [startLine, startChar, endLine, endChar] = current.$p;
        return vscode_languageserver_types_1.Range.create(vscode_languageserver_types_1.Position.create(startLine, startChar), vscode_languageserver_types_1.Position.create(endLine, endChar));
    }
}
exports.DiagnosticsProvider = DiagnosticsProvider;
