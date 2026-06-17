import { TextDocument } from "vscode-languageserver-textdocument";
import { Range } from "vscode-languageserver/node";
import { getLines } from "../utils/document";

export interface DashboardFieldReference {
    viewName: string;
    fieldName: string;
    fullRef: string;
    range: Range;
    line: number;
    context: "field" | "filter" | "listen" | "sort" | "pivots" | "column" | "dynamic_fields";
}

export interface DashboardExploreReference {
    exploreName: string;
    range: Range;
    line: number;
}

export interface DashboardModelReference {
    modelName: string;
    range: Range;
    line: number;
}

export interface DashboardInfo {
    name: string;
    title?: string;
    fieldReferences: DashboardFieldReference[];
    exploreReferences: DashboardExploreReference[];
    modelReferences: DashboardModelReference[];
}

/**
 * Parses LookML dashboard files (YAML-based) and extracts field references
 * like `view_name.field_name` from fields, filters, listen, sorts, etc.
 */
export class DashboardParser {
    /**
     * Check if a document is a dashboard file
     */
    public static isDashboardFile(uri: string): boolean {
        return uri.endsWith(".dashboard.lookml");
    }

    /**
     * Parse a dashboard document and extract all field references.
     * Uses line-by-line regex scanning for accurate position tracking
     * (YAML parsers don't preserve original positions reliably).
     */
    public parseDashboard(document: TextDocument): DashboardInfo {
        const lines = getLines(document);
        const fieldReferences: DashboardFieldReference[] = [];
        const exploreReferences: DashboardExploreReference[] = [];
        const modelReferences: DashboardModelReference[] = [];
        let dashboardName = "";
        let dashboardTitle: string | undefined;

        // view_name.field_name pattern — must contain a dot with word chars on both sides
        const fieldRefPattern = /\b([a-zA-Z_][a-zA-Z0-9_]*)\.([a-zA-Z_][a-zA-Z0-9_]*)\b/g;

        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            const trimmed = line.trim();

            // Extract dashboard name
            if (trimmed.startsWith("- dashboard:")) {
                const match = trimmed.match(/^- dashboard:\s+(\S+)/);
                if (match) dashboardName = match[1];
                continue;
            }
            if (trimmed.startsWith("title:") && !dashboardTitle) {
                const match = trimmed.match(/^title:\s+["']?(.+?)["']?\s*$/);
                if (match) dashboardTitle = match[1];
                continue;
            }

            // Extract explore references
            if (trimmed.startsWith("explore:")) {
                const match = trimmed.match(/^explore:\s+(\S+)/);
                if (match) {
                    const exploreName = match[1];
                    const col = line.indexOf(exploreName);
                    exploreReferences.push({
                        exploreName,
                        range: Range.create(i, col, i, col + exploreName.length),
                        line: i,
                    });
                }
            }

            // Extract model references
            if (trimmed.startsWith("model:")) {
                const match = trimmed.match(/^model:\s+(\S+)/);
                if (match) {
                    const modelName = match[1];
                    const col = line.indexOf(modelName, line.indexOf("model:") + 6);
                    modelReferences.push({
                        modelName,
                        range: Range.create(i, col, i, col + modelName.length),
                        line: i,
                    });
                }
            }

            // Extract field: key in filters
            if (trimmed.startsWith("field:")) {
                const match = trimmed.match(/^field:\s+(\S+)/);
                if (match) {
                    const ref = match[1];
                    const dotIdx = ref.indexOf(".");
                    if (dotIdx > 0) {
                        const viewName = ref.substring(0, dotIdx);
                        const fieldName = ref.substring(dotIdx + 1);
                        const col = line.indexOf(ref, line.indexOf("field:") + 6);
                        fieldReferences.push({
                            viewName,
                            fieldName,
                            fullRef: ref,
                            range: Range.create(i, col, i, col + ref.length),
                            line: i,
                            context: "filter",
                        });
                    }
                }
                continue;
            }

            // Extract field references from list items (fields:, sorts:, pivots:, etc.)
            if (trimmed.startsWith("- ")) {
                const listContext = this.getListContext(lines, i);
                if (listContext) {
                    const itemContent = trimmed.substring(2).trim();
                    // Strip sort suffixes like " desc" or " asc"
                    const cleanItem = itemContent.replace(/\s+(asc|desc)\s*$/i, "");
                    const dotIdx = cleanItem.indexOf(".");
                    if (dotIdx > 0 && /^[a-zA-Z_][a-zA-Z0-9_]*\.[a-zA-Z_][a-zA-Z0-9_]*$/.test(cleanItem)) {
                        const viewName = cleanItem.substring(0, dotIdx);
                        const fieldName = cleanItem.substring(dotIdx + 1);
                        const col = line.indexOf(cleanItem, line.indexOf("- ") + 2);
                        fieldReferences.push({
                            viewName,
                            fieldName,
                            fullRef: cleanItem,
                            range: Range.create(i, col, i, col + cleanItem.length),
                            line: i,
                            context: listContext,
                        });
                    }
                }
                continue;
            }

            // Extract listen mappings: `filter_name: view_name.field_name`
            if (this.isInListenBlock(lines, i)) {
                const listenMatch = trimmed.match(/^(\S+):\s+(\S+)/);
                if (listenMatch) {
                    const ref = listenMatch[2];
                    const dotIdx = ref.indexOf(".");
                    if (dotIdx > 0 && /^[a-zA-Z_][a-zA-Z0-9_]*\.[a-zA-Z_][a-zA-Z0-9_]*$/.test(ref)) {
                        const viewName = ref.substring(0, dotIdx);
                        const fieldName = ref.substring(dotIdx + 1);
                        const col = line.lastIndexOf(ref);
                        fieldReferences.push({
                            viewName,
                            fieldName,
                            fullRef: ref,
                            range: Range.create(i, col, i, col + ref.length),
                            line: i,
                            context: "listen",
                        });
                    }
                }
            }
        }

        return {
            name: dashboardName,
            title: dashboardTitle,
            fieldReferences,
            exploreReferences,
            modelReferences,
        };
    }

    private static readonly FIELD_LIST_KEYS: Record<string, DashboardFieldReference["context"]> = {
        "fields:": "field",
        "sorts:": "sort",
        "pivots:": "pivots",
        "hidden_fields:": "field",
        "dynamic_fields:": "dynamic_fields",
    };

    /**
     * Scan upward from a list-item line to find its parent YAML key.
     * Returns the field context if the parent is a known field-reference key,
     * or null otherwise.
     */
    private getListContext(lines: string[], lineIdx: number): DashboardFieldReference["context"] | null {
        const line = lines[lineIdx];
        const currentIndent = line.length - line.trimStart().length;

        for (let j = lineIdx - 1; j >= 0; j--) {
            const prevLine = lines[j];
            const prevTrimmed = prevLine.trim();
            if (prevTrimmed === "") continue;

            const prevIndent = prevLine.length - prevLine.trimStart().length;
            if (prevIndent < currentIndent) {
                for (const [key, ctx] of Object.entries(DashboardParser.FIELD_LIST_KEYS)) {
                    if (prevTrimmed.startsWith(key)) return ctx;
                }
                return null;
            }
        }
        return null;
    }

    /**
     * Check if a line index is inside a `listen:` block by scanning upward.
     */
    private isInListenBlock(lines: string[], lineIdx: number): boolean {
        // A listen value line looks like `      some_key: view.field`
        // We need to find the parent `listen:` key
        const line = lines[lineIdx];
        const trimmed = line.trim();

        // Must be a key: value pair (not a list item, not a known keyword)
        if (trimmed.startsWith("- ") || trimmed.startsWith("#")) return false;
        if (!trimmed.includes(":")) return false;

        // Skip known YAML keys that are not listen mappings
        const knownKeys = [
            "name:", "title:", "type:", "model:", "explore:", "field:",
            "default_value:", "allow_multiple_values:", "required:",
            "ui_config:", "display:", "limit:", "height:", "width:",
            "row:", "col:", "description:", "layout:", "preferred_viewer:",
            "auto_run:", "note_text:", "note_display:", "note_state:",
            "filters:", "fields:", "sorts:", "pivots:", "listen:",
            "show_view_names:", "show_row_numbers:", "show_totals:",
            "show_row_totals:", "value_format:", "dynamic_fields:",
            "label:", "color_application:", "series_colors:",
            "map_plot_mode:", "map_tile_provider:", "hidden_fields:",
            "hidden_points_if_no:", "query_timezone:", "column_limit:",
            "total:", "custom_color_enabled:", "value_labels:",
            "label_type:", "show_x_axis_label:", "show_y_axis_labels:",
            "y_axis_labels:", "x_axis_label:", "show_null_labels:",
            "tags:", "stacking:", "series_types:", "truncate_column_names:",
            "conditional_formatting:", "header_text_alignment:",
            "comparison_type:", "comparison_reverse_colors:",
            "show_comparison:", "show_comparison_label:", "comparison_label:",
            "map_layer_name:", "single_value_title:", "value_format_name:",
            "font_size:", "text_color:", "enable_conditional_formatting:",
            "conditional_formatting_include_totals:",
            "conditional_formatting_include_nulls:",
        ];
        for (const key of knownKeys) {
            if (trimmed.startsWith(key)) return false;
        }

        // Scan upward to find the parent block
        const currentIndent = line.length - line.trimStart().length;
        for (let j = lineIdx - 1; j >= 0; j--) {
            const prevLine = lines[j];
            const prevTrimmed = prevLine.trim();
            if (prevTrimmed === "") continue;

            const prevIndent = prevLine.length - prevLine.trimStart().length;
            if (prevIndent < currentIndent) {
                return prevTrimmed.startsWith("listen:");
            }
        }
        return false;
    }

    /**
     * Find the field reference at a given position in a dashboard document.
     */
    public getFieldReferenceAtPosition(
        document: TextDocument,
        line: number,
        character: number,
    ): DashboardFieldReference | undefined {
        const info = this.parseDashboard(document);
        for (const ref of info.fieldReferences) {
            if (
                ref.range.start.line === line &&
                character >= ref.range.start.character &&
                character <= ref.range.end.character
            ) {
                return ref;
            }
        }
        return undefined;
    }

    /**
     * Find the explore reference at a given position.
     */
    public getExploreReferenceAtPosition(
        document: TextDocument,
        line: number,
        character: number,
    ): DashboardExploreReference | undefined {
        const info = this.parseDashboard(document);
        for (const ref of info.exploreReferences) {
            if (
                ref.range.start.line === line &&
                character >= ref.range.start.character &&
                character <= ref.range.end.character
            ) {
                return ref;
            }
        }
        return undefined;
    }
}
