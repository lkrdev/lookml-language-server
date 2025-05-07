import { TextDocument } from "vscode-languageserver-textdocument";
import {
  Diagnostic,
  DiagnosticSeverity,
  Range,
  Position,
} from "vscode-languageserver/node";
import { WorkspaceModel } from "../models/workspace";
import { ensureMinRangeLength } from '../utils/range';
import {
  DimensionPosition,
  LookmlDimension,
  LookmlExploreWithFileInfo,
  LookmlModelWithFileInfo,
  LookmlViewWithFileInfo,
  Position as LookmlPosition,
  MeasurePosition,
  LookmlMeasure,
  LookMlViewPositions,
  LookmlExplore
} from "lookml-parser";
import { ZodError } from 'zod';
import {
  dimensionSchema,
  dimensionGroupSchema,
  measureSchema,
  setSchema,
  exploreSchema,
} from '../schemas/lookml';

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
    isView ?
      diagnostics.push(...this.validateViewReferences(document)) :
      diagnostics.push(...this.validateModelReferences(document));
    diagnostics.push(...this.validateProperties(document));

    const fileName = document.uri.split("/").pop() ?? "";
    const errors = this.workspaceModel.getErrorsByFileName(fileName);

    for (const errorDetails of errors) {
      diagnostics.push({
        severity: DiagnosticSeverity.Error,
        message: errorDetails.error.exception.message,
        range: ensureMinRangeLength({
          start: { line: errorDetails.error.exception.location.start.line - 1, character: errorDetails.error.exception.location.start.column - 1 },
          end: { line: errorDetails.error.exception.location.end.line - 1, character: errorDetails.error.exception.location.end.column - 1 },
        }),
      });
    }

    return diagnostics;
  }

  private validateSqlReferences(
    sql: string,
    position: LookmlPosition | undefined,
  ): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    if (!position) return diagnostics;
  
    const validRefPattern = /\$\{([^}]+)\}/g;
    const invalidRefPattern = /\$[^{][^}\s]*}?|\$\{[^}]*$/g;
  
    let match;
  
    const charStart = position.$p[1];
    const charEnd = position.$p[3];
    const lineStart = position.$p[0] - 1;
    const lineEnd = position.$p[2] - 1;

    const range = {
      start: { line: lineStart, character: charStart  },
      end: { line: lineEnd, character: charEnd },
    };

    // ✅ Detect valid references
    while ((match = validRefPattern.exec(sql)) !== null) {
      if (!match[0].startsWith("${") || !match[0].endsWith("}")) {
        diagnostics.push({
          severity: DiagnosticSeverity.Error,
          range,
          message: "Invalid field reference syntax. Use ${view_name.field_name}",
          source: "lookml-lsp",
          code: DiagnosticCode.VIEW_REF_FIELD_IN_SQL
        });
      }
    }
  
    // ❌ Detect malformed references (e.g. $foo, $foo}, ${bar)
    while ((match = invalidRefPattern.exec(sql)) !== null) {
      diagnostics.push({
        severity: DiagnosticSeverity.Error,
        range,
        message: "Malformed LookML reference. Use full ${view.field} syntax.",
        source: "lookml-lsp",
        code: DiagnosticCode.VIEW_REF_FIELD_IN_SQL
      });
    }
  
    return diagnostics;
  }

  private validateViewReferences(document: TextDocument): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const uri = document.uri.replace("file://", "");
    const viewNames = this.workspaceModel.getViewsByFile(uri);
    if (!viewNames?.length) return diagnostics;

    // Process each view in the file
    for (const viewName of viewNames) {
      const viewDetails = this.workspaceModel.getView(viewName);
      if (!viewDetails) continue;

      const positions = viewDetails.positions;

      // Validate dimensions
      if (viewDetails.view.dimension) {
        Object.entries(viewDetails.view.dimension).forEach(([dimName, dimension]) => {
          if (!dimension.sql) {
            return;
          }

          const sqlPosition = positions.dimension?.[dimName]?.sql;
          diagnostics.push(...this.validateSqlReferences(dimension.sql, sqlPosition));
        });
      }

      // Validate dimension groups
      if (viewDetails.view.dimension_group) {
        Object.entries(viewDetails.view.dimension_group).forEach(([dimGroupName, dimensionGroup]) => {
          if (!dimensionGroup.sql) {
            return;
          }

          const sqlPosition = positions.dimension_group?.[dimGroupName]?.sql;
          diagnostics.push(...this.validateSqlReferences(dimensionGroup.sql, sqlPosition));
        });
      }

      // Validate measures
      if (viewDetails.view.measure) {
        Object.entries(viewDetails.view.measure).forEach(([measureName, measure]) => {
          if (!measure.sql) {
            return;
          }

          const sqlPosition = positions.measure?.[measureName]?.sql;
          diagnostics.push(...this.validateSqlReferences(measure.sql, sqlPosition));
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

        Object.entries(viewDetails.view).forEach(([key, value]) => {
          switch (key) {
            case "dimension":
              const dimensionDiagnostics = this.validateDimension({
                viewDetails,
                dimensions: value
              });
              diagnostics = [...diagnostics, ...dimensionDiagnostics];
              break;
            case "dimension_group":
              const dimensionGroupDiagnostics = this.validateDimensionGroup(value, positions);
              diagnostics = [...diagnostics, ...dimensionGroupDiagnostics];
              break;
            case "measure":
              const measureDiagnostics = this.validateMeasure({
                measures: value,
                viewDetails
              });
              diagnostics = [...diagnostics, ...measureDiagnostics];
              break;
            case "set":
              const setDiagnostics = this.validateSet({
                sets: value,
                viewDetails
              });
              diagnostics = [...diagnostics, ...setDiagnostics];
              break;
          }
        });
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
    const uri = document.uri.replace("file://", "");
    const views = (this.workspaceModel.getViewsByFile(uri) || [])
      .map(viewName => this.workspaceModel.getView(viewName))
      .filter((v): v is LookmlViewWithFileInfo => v !== undefined);

    const explores = (this.workspaceModel.getExploresByFile(uri) || [])
      .map(exploreName => this.workspaceModel.getExplore(exploreName))
      .filter((e): e is LookmlExploreWithFileInfo => e !== undefined);

    const models = (this.workspaceModel.getModelsByFile(uri) || [])
      .map(modelName => this.workspaceModel.getModel(modelName))
      .filter((m): m is LookmlModelWithFileInfo => m !== undefined);

    return { views, explores, models };
  }

  private validateSet({ viewDetails, sets }: {
    viewDetails: LookmlViewWithFileInfo,
    sets: { [key: string]: { fields: string[] } }
  }): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const positions = viewDetails.positions;

    Object.entries(sets).forEach(([setName, set]) => {
      try {
        setSchema.parse(set);

        for (const [index, field] of set.fields.entries()) {
          let fieldName = field;
          let targetedViewName: string | undefined = viewDetails.view.$name;
          let targetedViewDetails: LookmlViewWithFileInfo | undefined = viewDetails;

          const setFieldPosition = positions.set?.[setName]?.fields?.[index];
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
          const endCharacter = targetedViewName ? startCharacter + targetedViewName.length : setFieldPosition.$p[3];

          if (!targetedViewDetails) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              message: `View ${targetedViewName} not found`,
              range: {
                start: { line: setFieldPosition.$p[0] - 1, character: startCharacter },
                end: { line: setFieldPosition.$p[2] - 1, character: endCharacter }
              },
              source: "lookml-lsp",
              code: DiagnosticCode.DRILL_FIELDS_VIEW_NOT_FOUND
            });
            continue;
          }
          const viewDimensions = targetedViewDetails.view.dimension;
          const viewMeasures = targetedViewDetails.view.measure;
          const viewDimensionGroups = targetedViewDetails.view.dimension_group;

          if (!viewDimensions?.[fieldName] && !viewMeasures?.[fieldName] && !viewDimensionGroups?.[fieldName]) {
            if (fieldName.includes("_")) {
              const fieldSplit = fieldName.split("_");
              const groupName = fieldSplit.pop();

              if (!groupName) {
                throw new Error(`No group name found for field ${fieldName}`);
              }

              const dimensionGroupName = fieldSplit.join("_");
              const dimensionGroup = viewDimensionGroups?.[dimensionGroupName];
              
              const timeframes = dimensionGroup?.timeframes ?? ["time", "date"];
              if (viewDimensionGroups?.[dimensionGroupName] && timeframes.includes(groupName)) {
                continue;
              }
            }
            
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              message: `Field "${fieldName}" not found in view "${targetedViewName}"`,
              range: {
                start: { line: setFieldPosition.$p[0] - 1, character: startCharacter },
                end: { line: setFieldPosition.$p[2] - 1, character: endCharacter }
              },
              source: "lookml-lsp",
              code: DiagnosticCode.DRILL_FIELDS_FIELD_NOT_FOUND
            });
            continue;
          }
        }
      } catch (error: ZodError | unknown) {
        if (error instanceof ZodError) {
          for (const issue of error.issues) {
            const path = issue.path as string[];
            const setPositions = positions.set?.[setName] as DimensionPosition | undefined;

            let currentPosition: any = setPositions;
            for (const pathPart of path) {
              if (!currentPosition) break;
              currentPosition = currentPosition[pathPart];
            }
            const position = currentPosition as LookmlPosition | undefined;

            if (!position) {
              throw new Error(`No position found for set ${setName}`);
            }

            const startLine = position.$p[0] - 1;
            const startCharacter = position.$p[1];
            const endLine = position.$p[2] - 1;
            const endCharacter = position.$p[3];

            diagnostics.push({
              severity: DiagnosticSeverity.Error,
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

    return diagnostics;
  }

  private validateDimension({ viewDetails, dimensions }: {
    viewDetails: LookmlViewWithFileInfo,
    dimensions: { [key: string]: LookmlDimension },
  }): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const positions = viewDetails.positions;

    Object.values(dimensions).forEach((dimension) => {
      try {
        dimensionSchema.parse(dimension);
        
        if (dimension.drill_fields) {
          for (const [index, drillField] of dimension.drill_fields.entries()) {
            let fieldName = drillField;
            let targetedViewName: string | undefined = viewDetails.view.$name;
            let targetedViewDetails: LookmlViewWithFileInfo | undefined = viewDetails;

            const drillFieldPosition = positions.dimension?.[dimension.$name]?.drill_fields?.[index];
            if (!drillFieldPosition) {
              throw new Error(`No position found for drill field ${drillField}`);
            }

            if (drillField.includes("*")) {
              const fieldWithoutAsterisk = drillField.replace("*", "");

              const startCharater = drillFieldPosition.$p[1];
                const endCharater = targetedViewName ? startCharater + fieldWithoutAsterisk.length : drillFieldPosition.$p[3];

              if (!targetedViewDetails?.view?.set?.[fieldWithoutAsterisk]) {
                diagnostics.push({
                  severity: DiagnosticSeverity.Error,
                  range: {
                    start: { line: drillFieldPosition.$p[0] - 1, character: startCharater },
                    end: { line: drillFieldPosition.$p[2] - 1, character: endCharater }
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
            const endCharater = targetedViewName ? startCharater + targetedViewName.length : drillFieldPosition.$p[3];

            const fieldLength = fieldName.length;
            if (!targetedViewDetails) {
              diagnostics.push({
                severity: DiagnosticSeverity.Error,
                message: `View ${targetedViewName} not found`,
                range: {
                  start: { line: drillFieldPosition.$p[0] - 1, character: startCharater },
                  end: { line: drillFieldPosition.$p[2] - 1, character: endCharater }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.DRILL_FIELDS_VIEW_NOT_FOUND
              });
              continue;
            }

            const viewDimensions = targetedViewDetails.view.dimension;
            const viewMeasures = targetedViewDetails.view.measure;
            const viewDimensionGroups = targetedViewDetails.view.dimension_group;

            if (!viewDimensions?.[fieldName] && !viewMeasures?.[fieldName] && !viewDimensionGroups?.[fieldName]) {
              if (fieldName.includes("_")) {
                const fieldSplit = fieldName.split("_");
                const groupName = fieldSplit.pop();
  
                if (!groupName) {
                  throw new Error(`No group name found for field ${fieldName}`);
                }
  
                const dimensionGroupName = fieldSplit.join("_");
                const dimensionGroup = viewDimensionGroups?.[dimensionGroupName];
                
                const timeframes = dimensionGroup?.timeframes ?? ["time", "date"];
                if (viewDimensionGroups?.[dimensionGroupName] && timeframes.includes(groupName)) {
                  continue;
                }
              }

              diagnostics.push({
                severity: DiagnosticSeverity.Error,
                message: `Field "${fieldName}" not found in view ${targetedViewDetails.view.$name}`,
                range: {
                  start: { line: drillFieldPosition.$p[0] - 1, character: startCharater },
                  end: { line: drillFieldPosition.$p[2] - 1, character: endCharater }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.DRILL_FIELDS_FIELD_NOT_FOUND
              });
              continue;
            }
          }
        }
      } catch (error: ZodError | unknown) {
        if (error instanceof ZodError) {
          for (const issue of error.issues) {
            const dimensionName = dimension.$name;
            const path = issue.path as string[]
            const fieldPositions = positions.dimension as Record<string, DimensionPosition> | undefined;
            const dimensionPositions = fieldPositions?.[dimensionName] as DimensionPosition | undefined;

            let currentPosition: any = dimensionPositions;
            for (const pathPart of path) {
              if (!currentPosition) break;
              currentPosition = currentPosition[pathPart];
            }
            const position = currentPosition as LookmlPosition | undefined;

            if (!position) {
              throw new Error(`No position found for dimension ${dimensionName}`);
            }

            const startLine = position.$p[0] - 1;
            const startCharacter = position.$p[1];
            const endLine = position.$p[2] - 1;
            const endCharacter = position.$p[3];

            diagnostics.push(
              {
                severity: DiagnosticSeverity.Error,
                message: issue.message,
                range: {
                  start: { line: startLine, character: startCharacter },
                  end: { line: endLine, character: endCharacter }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.PROP_INVALID_PROPERTY
              }
            );
          }
        } else {
          throw error;
        }
      }
    });

    return diagnostics;
  }

  private validateMeasure({ viewDetails, measures }: {
    viewDetails: LookmlViewWithFileInfo,
    measures: { [key: string]: LookmlMeasure },
  }): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const positions = viewDetails.positions;

    Object.values(measures).forEach((measure) => {
      try {
        measureSchema.parse(measure);

        if (measure.drill_fields) {
          for (const [index, drillField] of measure.drill_fields.entries()) {
            let fieldName = drillField;
            let targetedViewName: string | undefined = viewDetails.view.$name;
            let targetedViewDetails: LookmlViewWithFileInfo | undefined = viewDetails;

            const drillFieldPosition = positions.measure?.[measure.$name]?.drill_fields?.[index];
            if (!drillFieldPosition) {
              throw new Error(`No position found for drill field ${drillField}`);
            }

            if (drillField.includes("*")) {
              const fieldWithoutAsterisk = drillField.replace("*", "");

              if (!targetedViewDetails?.view?.set?.[fieldWithoutAsterisk]) {
                const startCharater = drillFieldPosition.$p[1];
                const endCharater = targetedViewName ? startCharater + fieldWithoutAsterisk.length : drillFieldPosition.$p[3];
                diagnostics.push({
                  severity: DiagnosticSeverity.Error,
                  range: {
                    start: { line: drillFieldPosition.$p[0] - 1, character: startCharater },
                    end: { line: drillFieldPosition.$p[2] - 1, character: endCharater }
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

            const fieldLength = fieldName.length;

            

            if (!targetedViewDetails) {
              const startCharater = drillFieldPosition.$p[1];
              const endCharater = targetedViewName ? startCharater + targetedViewName.length : drillFieldPosition.$p[3];

              diagnostics.push({
                severity: DiagnosticSeverity.Error,
                message: `View ${targetedViewName} not found`,
                range: {
                  start: { line: drillFieldPosition.$p[0] - 1, character: startCharater },
                  end: { line: drillFieldPosition.$p[2] - 1, character: endCharater }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.DRILL_FIELDS_VIEW_NOT_FOUND
              });
              continue;
            }

            const viewDimensions = targetedViewDetails.view.dimension;
            const viewMeasures = targetedViewDetails.view.measure;
            const viewDimensionGroups = targetedViewDetails.view.dimension_group;

            if (!viewDimensions?.[fieldName] && !viewMeasures?.[fieldName] && !viewDimensionGroups?.[fieldName]) {
              if (fieldName.includes("_")) {
                const fieldSplit = fieldName.split("_");
                const groupName = fieldSplit.pop();
  
                if (!groupName) {
                  throw new Error(`No group name found for field ${fieldName}`);
                }
  
                const dimensionGroupName = fieldSplit.join("_");
                const dimensionGroup = viewDimensionGroups?.[dimensionGroupName];
                
                const timeframes = dimensionGroup?.timeframes ?? ["time", "date"];
                if (viewDimensionGroups?.[dimensionGroupName] && timeframes.includes(groupName)) {
                  continue;
                }
              }

              const startCharater = targetedViewName  ? drillFieldPosition.$p[1] + targetedViewName.length + 1 : drillFieldPosition.$p[1];
              const endCharater = startCharater + fieldLength;
              
              diagnostics.push({
                severity: DiagnosticSeverity.Error,
                message: `Field "${fieldName}" not found in view "${targetedViewDetails.view.$name}"`,
                range: {
                  start: { line: drillFieldPosition.$p[0] - 1, character: startCharater },
                  end: { line: drillFieldPosition.$p[2] - 1, character: endCharater }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.DRILL_FIELDS_FIELD_NOT_FOUND
              });
              continue;
            }
          }
        }
      } catch (error: ZodError | unknown) {
        if (error instanceof ZodError) {
          for (const issue of error.issues) {
            const measureName = measure.$name;
            const path = issue.path as string[];
            const fieldPositions = positions.measure as Record<string, DimensionPosition> | undefined;
            const measurePositions = fieldPositions?.[measureName] as DimensionPosition | undefined;

            let currentPosition: any = measurePositions;
            for (const pathPart of path) {
              if (!currentPosition) break;
              currentPosition = currentPosition[pathPart];
            }
            const position = currentPosition as LookmlPosition | undefined;

            if (!position) {
              throw new Error(`No position found for measure ${measureName}`);
            }

            const startLine = position.$p[0] - 1;
            const startCharacter = position.$p[1];
            const endLine = position.$p[2] - 1;
            const endCharacter = position.$p[3];

            diagnostics.push(
              {
                severity: DiagnosticSeverity.Error,
                message: issue.message,
                range: {
                  start: { line: startLine, character: startCharacter },
                  end: { line: endLine, character: endCharacter }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.PROP_INVALID_PROPERTY
              }
            );
          }
        } else {
          throw error;
        }
      }
    });
    return diagnostics;
  }

  private validateDimensionGroup(dimensionGroups: { [key: string]: LookmlDimension }, positions: LookMlViewPositions): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];

    Object.values(dimensionGroups).forEach((dimensionGroup) => {
      try {
        dimensionGroupSchema.parse(dimensionGroup);
      } catch (error: ZodError | unknown) {
        if (error instanceof ZodError) {
          for (const issue of error.issues) {
            const dimensionGroupName = dimensionGroup.$name;
            const path = issue.path as string[];
            const fieldPositions = positions.dimension_group as Record<string, DimensionPosition> | undefined;
            const dimensionGroupPositions = fieldPositions?.[dimensionGroupName] as DimensionPosition | undefined;

            let currentPosition: any = dimensionGroupPositions;
            for (const pathPart of path) {
              if (!currentPosition) break;
              currentPosition = currentPosition[pathPart];
            }
            const position = currentPosition as LookmlPosition | undefined;

            if (!position) {
              throw new Error(`No position found for dimension group ${dimensionGroupName}`);
            }

            const startLine = position.$p[0] - 1;
            const startCharacter = position.$p[1];
            const endLine = position.$p[2] - 1;
            const endCharacter = position.$p[3];

            diagnostics.push(
              {
                severity: DiagnosticSeverity.Error,
                message: issue.message,
                range: {
                  start: { line: startLine, character: startCharacter },
                  end: { line: endLine, character: endCharacter }
                },
                source: "lookml-lsp",
                code: DiagnosticCode.PROP_INVALID_PROPERTY
              }
            );
          }
        } else {
          throw error;
        }
      }
    });

    return diagnostics;
  }

  private validateModel(modelDetails: LookmlModelWithFileInfo): Diagnostic[] {
    const diagnostics: Diagnostic[] = [];
    const modelIncludedViews = this.workspaceModel.getIncludedViewsForModel(modelDetails.model.$file_name);

    Object.entries(modelDetails.model).forEach(([key, value]) => {
      switch (key) {
        case "explore":
          const positions = modelDetails.positions;

          const models: {
            [key: string]: LookmlExplore
          } = value;

          Object.values(models).forEach((explore) => {
            try {
              exploreSchema.parse(explore);

              if (explore.extends) {
                for (const [index, view] of explore.extends.entries()) {
                  if (!modelIncludedViews?.has(view) && !modelDetails.model.explore?.[view]) {
                    const startLine = positions.explore?.[explore.$name]?.extends?.[index]?.$p[0];
                    const startCharater = positions.explore?.[explore.$name]?.extends?.[index]?.$p[1];
                    const endLine = positions.explore?.[explore.$name]?.extends?.[index]?.$p[2];
                    const endCharater = startCharater + view.length;


                    diagnostics.push({
                      severity: DiagnosticSeverity.Error,
                      range: {
                        start: { line: startLine - 1, character: startCharater },
                        end: { line: endLine - 1, character: endCharater }
                      },
                      message: `Extend View: "${view}" not found in model "${modelDetails.model.$file_name}"`,
                      source: "lookml-lsp",
                      code: DiagnosticCode.EXPLORE_VIEW_NOT_FOUND
                    })
                  }
                }
              }
            } catch (error: ZodError | unknown) {
              if (error instanceof ZodError) {
                for (const issue of error.issues) {
                  const exploreName = explore.$name;
                  const path = issue.path as string[];
                  const fieldPositions = positions.explore as Record<string, DimensionPosition> | undefined;
                  const explorePositions = fieldPositions?.[exploreName] as DimensionPosition | undefined;

                  // Traverse the path to get the position
                  let currentPosition: any = explorePositions;
                  for (const pathPart of path) {
                    if (!currentPosition) break;
                    currentPosition = currentPosition[pathPart];
                  }
                  const position = currentPosition as LookmlPosition | undefined;

                  if (!position) {
                    throw new Error(`No position found for explore ${exploreName}`);
                  }

                  const startLine = position.$p[0] - 1;
                  const startCharacter = position.$p[1];
                  const endLine = position.$p[2] - 1;
                  const endCharacter = position.$p[3];

                  diagnostics.push(
                    {
                      severity: DiagnosticSeverity.Error,
                      message: issue.message,
                      range: {
                        start: { line: startLine, character: startCharacter },
                        end: { line: endLine, character: endCharacter }
                      },
                      source: "lookml-lsp",
                      code: DiagnosticCode.PROP_INVALID_PROPERTY
                    }
                  );
                  return
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

    const includedViews = this.workspaceModel.getIncludedViewsForModel(modelName) || new Set();

    // Track explores and their available views
    const exploreAvailableViews: Map<string, Set<string>> = new Map();

    // First pass: build explore context and available views
    if (model.model.explore) {
      Object.entries(model.model.explore).forEach(([exploreName, explore]) => {
        // Initialize available views for this explore

        const exploreViewDetails = this.workspaceModel.getView(exploreName);
        if (!exploreViewDetails && !explore.from) {
          const explorePosition = model.positions.explore?.[exploreName]?.$name?.$p;
          if (!explorePosition) {
            throw new Error(`No position found for explore ${exploreName}`);
          }

          diagnostics.push({
            severity: DiagnosticSeverity.Error,
            range: {
              start: { line: explorePosition[0] - 1, character: explorePosition[1] },
              end: { line: explorePosition[2] - 1, character: explorePosition[3] }
            },
            message: `Explore "${exploreName}" must have a base view`,
            source: "lookml-lsp",
            code: DiagnosticCode.EXPLORE_VIEW_NOT_FOUND
          });
        }

        const availableViews = new Set<string>();
        if (exploreViewDetails) {
          availableViews.add(exploreName);
        };

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
        const availableViews = exploreAvailableViews.get(exploreName) ?? new Set<string>();

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

        if (!availableViews) return;
        if (explore.from) {
          const viewName = explore.from;
          const viewDetails = this.workspaceModel.getView(viewName);
          if (!viewDetails) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range: this.getRangeFromPositions(model.positions, exploreName, 'from'),
              message: `Referenced view "${viewName}" not found in workspace`,
              source: "lookml-lsp",
              code: DiagnosticCode.VIEW_REF_VIEW_NOT_FOUND
            });
          } else if (!includedViews.has(viewName)) {
            diagnostics.push({
              severity: DiagnosticSeverity.Error,
              range: this.getRangeFromPositions(model.positions, exploreName, 'from'),
              message: `View "${viewName}" exists but is not included in this model`,
              source: "lookml-lsp",
              code: DiagnosticCode.VIEW_REF_VIEW_NOT_INCLUDED
            });
          }
        }

        // Validate joins
        if (explore.join) {
          Object.entries(explore.join).forEach(([joinName, join]) => {
            const viewDetails = this.workspaceModel.getView(joinName);
            if (!viewDetails) {
              const explorePosition = model.positions.explore?.[exploreName]?.join?.[joinName]?.$p;
              const range = {
                start: { line: explorePosition[0] - 1, character: explorePosition[1] },
                end: { line: explorePosition[2] - 1, character: explorePosition[3] }
              }
              diagnostics.push({
                severity: DiagnosticSeverity.Error,
                range,
                message: `Referenced view "${joinName}" not found in workspace`,
                source: "lookml-lsp",
                code: DiagnosticCode.JOIN_VIEW_NOT_FOUND
              });
            } else if (!includedViews.has(joinName)) {
              diagnostics.push({
                severity: DiagnosticSeverity.Error,
                range: this.getRangeFromPositions(model.positions, exploreName, 'join', joinName),
                message: `View "${joinName}" exists but is not included in this model`,
                source: "lookml-lsp",
                code: DiagnosticCode.JOIN_VIEW_NOT_INCLUDED
              });
            }

            // Validate sql_on references
            if (join.sql_on) {
              const fieldRefPattern = /\$\{([a-zA-Z0-9_]+)\.([a-zA-Z0-9_]+)\}/g;
              let fieldMatch;

              const sqlOnPosition = model.positions.explore?.[exploreName]?.join?.[joinName]?.sql_on;
              const startLine = sqlOnPosition?.$p[0];
              const startCharater = sqlOnPosition?.$p[1];
              const endLine = sqlOnPosition?.$p[2];
              const endCharater = sqlOnPosition?.$p[3];

              while ((fieldMatch = fieldRefPattern.exec(join.sql_on)) !== null) {
                const viewName = fieldMatch[1];
                const fieldName = fieldMatch[2];

                // Check if view exists and is available
                const viewDetails = this.workspaceModel.getView(viewName);
                if (!viewDetails) {
                  diagnostics.push({
                    severity: DiagnosticSeverity.Error,
                    range: {
                      start: { line: startLine - 1, character: startCharater },
                      end: { line: endLine - 1, character: endCharater }
                    },
                    message: `Referenced view "${viewName}" not found in workspace`,
                    source: "lookml-lsp",
                    code: DiagnosticCode.SQL_REF_VIEW_NOT_FOUND
                  });
                } else if (!availableViews.has(viewName)) {
                  diagnostics.push({
                    severity: DiagnosticSeverity.Error,
                    range: {
                      start: { line: startLine - 1, character: startCharater },
                      end: { line: endLine - 1, character: endCharater }
                    },
                    message: `View "${viewName}" is not available in this explore context. It must be joined before it can be referenced.`,
                    source: "lookml-lsp",
                    code: DiagnosticCode.SQL_REF_VIEW_NOT_AVAILABLE
                  });
                } else if (!viewDetails.view.measure?.[fieldName] && 
                          !viewDetails.view.dimension?.[fieldName] && 
                          !viewDetails.view.dimension_group?.[fieldName]) {
                  diagnostics.push({
                    severity: DiagnosticSeverity.Error,
                    range: {
                      start: { line: startLine - 1, character: startCharater },
                      end: { line: endLine - 1, character: endCharater }
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

  private getRangeFromPositions(positions: any, ...path: string[]): Range {
    let current = positions;
    for (const part of path) {
      if (!current) break;
      current = current[part];
    }
    
    if (!current || !current.$p) {
      return Range.create(0, 0, 0, 0);
    }

    const [startLine, startChar, endLine, endChar] = current.$p;
    return Range.create(
      Position.create(startLine - 1, startChar),
      Position.create(endLine - 1, endChar)
    );
  }
}
