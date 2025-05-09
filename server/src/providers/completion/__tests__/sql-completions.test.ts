import { CompletionItemKind, MarkupKind } from "vscode-languageserver/node";
import { SQLCompletionProvider } from "../sql-completions";
import { CompletionContext } from "../context-detector";

interface MockField {
    $name: string;
    type: string;
    label?: string;
    description?: string;
}

interface MockView {
    dimension: { [key: string]: MockField };
    measure: { [key: string]: MockField };
    dimension_group?: { [key: string]: MockField };
}

interface MockViewWithFileInfo {
    view: MockView;
}

describe("SQLCompletionProvider", () => {
    let sqlCompletionProvider: SQLCompletionProvider;
    let mockWorkspaceModel: any;

    beforeEach(() => {
        // Create a mock workspace model
        mockWorkspaceModel = {
            getViews: jest.fn().mockReturnValue(new Map([
                ["users", {}],
                ["orders", {}],
                ["products", {}]
            ])),
            getExplore: jest.fn(),
            getView: jest.fn().mockImplementation((viewName) => {
                if (viewName === "users") {
                    return {
                        view: {
                            dimension: {
                                "id": { $name: "id", type: "number", label: "ID" },
                                "name": { $name: "name", type: "string", label: "Name" }
                            },
                            measure: {
                                "count": { $name: "count", type: "count", label: "Count" }
                            }
                        }
                    } as MockViewWithFileInfo;
                }
                return undefined;
            }),
            getTableFields: jest.fn().mockImplementation((tableName) => {
                if (tableName === "users") {
                    return [
                        { name: "id", type: "number" },
                        { name: "name", type: "string" }
                    ];
                }
                return undefined;
            })
        };

        sqlCompletionProvider = new SQLCompletionProvider(mockWorkspaceModel);
    });

    describe("getTableReferenceCompletions", () => {
        test("should return completion items for all views", () => {
            const context: CompletionContext = { type: "table_reference" };
            const completions = sqlCompletionProvider.getTableReferenceCompletions(context);

            expect(completions).toHaveLength(3);
            expect(completions[0]).toEqual({
                label: "users",
                kind: CompletionItemKind.Class,
                insertText: "users",
                detail: "View: users",
                data: { type: "view-ref", viewName: "users" }
            });
        });
    });

    describe("getFieldReferenceCompletions", () => {
        test("should return completion items for all fields in a view", () => {
            const context: CompletionContext = { type: "field_reference", viewName: "users" };
            const completions = sqlCompletionProvider.getFieldReferenceCompletions(context);

            expect(completions).toHaveLength(3);
            expect(completions).toEqual(
                [
                    {
                        "data": {
                            "fieldName": "count",
                            "type": "field-ref",
                            "viewName": "users",
                        },
                        "detail": "count in users",
                        "kind": 5,
                        "label": "Count",
                    },
                    {
                        "data": {
                            "fieldName": "id",
                            "type": "field-ref",
                            "viewName": "users",
                        },
                        "detail": "number in users",
                        "kind": 5,
                        "label": "ID",
                    },
                    {
                        "data": {
                            "fieldName": "name",
                            "type": "field-ref",
                            "viewName": "users",
                        },
                        "detail": "string in users",
                        "kind": 5,
                        "label": "Name",
                    },
                ]
            )
        });

        test("should return empty array for non-existent view", () => {
            const context: CompletionContext = { type: "field_reference", viewName: "non_existent" };

            const completions = sqlCompletionProvider.getFieldReferenceCompletions(context);
            expect(completions).toHaveLength(0);
        });
    });

    describe("getCompletions", () => {
        test("should return SQL completions for sql context", () => {
            const context: CompletionContext = {
                type: "sql",
                viewName: "users",
                linePrefix: "SELECT "
            };
            const completions = sqlCompletionProvider.getCompletions(context);

            // Should include SQL functions, keywords, and field references
            expect(completions.length).toBeGreaterThan(0);
            expect(completions.some(item => item.label === "CONCAT")).toBe(true);
            expect(completions.some(item => item.label === "SELECT")).toBe(true);
            expect(completions.some(item => item.label === "${users.id}")).toBe(true);
        });

        test("should return join SQL completions for sql_on context", () => {
            const context: CompletionContext = {
                type: "sql_on",
                exploreName: "orders",
                joinName: "users",
                linePrefix: "users.id = "
            };
            const completions = sqlCompletionProvider.getCompletions(context);

            // Should include SQL operators and field references
            expect(completions.length).toBeGreaterThan(0);
            expect(completions.some(item => item.label === "=")).toBe(true);
            expect(completions.some(item => item.label === "AND")).toBe(true);
        });

        test("should return empty array for unsupported context", () => {
            const context: CompletionContext = { type: "empty" };
            const completions = sqlCompletionProvider.getCompletions(context);
            expect(completions).toHaveLength(0);
        });
    });

    describe("getDimensionReferenceCompletions", () => {
        test("should return completion items for dimensions in a view", () => {
            const context: CompletionContext = {
                type: "dimension_reference",
                viewName: "users"
            };
            const completions = sqlCompletionProvider.getDimensionReferenceCompletions(context);

            expect(completions).toHaveLength(2);
            expect(completions[0]).toEqual({
                label: "id",
                kind: CompletionItemKind.Field,
                detail: "Dimension from users",
                documentation: {
                    kind: MarkupKind.Markdown,
                    value: "Dimension: id"
                },
                insertText: "id"
            });
        });

        test("should return empty array when no view name is provided", () => {
            const context: CompletionContext = { type: "dimension_reference" };
            const completions = sqlCompletionProvider.getDimensionReferenceCompletions(context);
            expect(completions).toHaveLength(0);
        });
    });

    describe("getSQLFunctionSnippet", () => {
        test("should return correct snippet for CONCAT function", () => {
            const snippet = sqlCompletionProvider["getSQLFunctionSnippet"]("CONCAT");
            expect(snippet).toBe("CONCAT(${1:expr1}, ${2:expr2})");
        });

        test("should return correct snippet for CAST function", () => {
            const snippet = sqlCompletionProvider["getSQLFunctionSnippet"]("CAST");
            expect(snippet).toBe("CAST(${1:expr} AS ${2:type})");
        });

        test("should return default snippet for unknown function", () => {
            const snippet = sqlCompletionProvider["getSQLFunctionSnippet"]("UNKNOWN");
            expect(snippet).toBe("UNKNOWN($1)");
        });
    });
}); 