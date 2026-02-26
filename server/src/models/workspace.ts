import {
    LookmlError,
    LookmlExploreWithFileInfo,
    LookmlFile,
    LookmlModel,
    LookmlModelWithFileInfo,
    LookmlProject,
    LookmlViewWithFileInfo,
    parse,
    parseFiles,
    transformations,
} from "lookml-parser";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import {
    Connection,
    Diagnostic,
    DiagnosticSeverity,
    DocumentUri,
    Location,
    Position,
    Range
} from "vscode-languageserver/node";
import { URI } from "vscode-uri";
import {
    DIMENSION_GROUP_DEFAULT_INTERVALS,
    DIMENSION_GROUP_DEFAULT_TIMEFRAMES,
} from "../schemas/defaults";
import { getLines } from "../utils/document";
import { LookMLParser } from "./lookml-parser";


export class WorkspaceModel {
    public connection: Connection;
    private lookmlParser: LookMLParser;
    public project?: LookmlProject;

    // Document tracking
    private errors: Map<string, LookmlError[]> = new Map();
    private views: Map<string, LookmlViewWithFileInfo> = new Map();
    private explores: Map<string, LookmlExploreWithFileInfo> = new Map();
    private models: Map<string, LookmlModelWithFileInfo> = new Map();
    private viewsByFile: Map<DocumentUri, string[]> = new Map();
    private includedViews: Map<string, Set<string>> = new Map();
    private exploresByFile: Map<DocumentUri, string[]> = new Map();
    private modelsByFile: Map<DocumentUri, string[]> = new Map();
    private loadedFiles: Set<string> = new Set();

    // Version tracking for incremental updates
    private documentVersions: Map<DocumentUri, number> = new Map();

    constructor(args: { connection: Connection }) {
        this.connection = args.connection;
        this.lookmlParser = new LookMLParser();
    }

    public getView(name: string): LookmlViewWithFileInfo | undefined {
        return this.views.get(name);
    }

    public getViews(): Map<string, LookmlViewWithFileInfo> {
        return this.views;
    }

    public getViewsByFile(uri: string): string[] {
        return this.viewsByFile.get(uri) ?? [];
    }

    public getErrorsByFileName(fileName: string): LookmlError[] {
        return this.errors.get(fileName) ?? [];
    }

    public getExplore(name: string): LookmlExploreWithFileInfo | undefined {
        return this.explores.get(name);
    }

    public getExplores(): Map<string, LookmlExploreWithFileInfo> {
        return this.explores;
    }

    public getExploresByFile(uri: string): string[] {
        return this.exploresByFile.get(uri) ?? [];
    }

    public getModels(): Map<string, LookmlModelWithFileInfo> {
        return this.models;
    }

    public getModelsByFile(uri: string): string[] {
        return this.modelsByFile.get(uri) ?? [];
    }

    /**
     * Get a specific model by name
     */
    public getModel(name: string): LookmlModelWithFileInfo | undefined {
        return this.models.get(name);
    }

    public isViewFile(document: TextDocument): boolean {
        return (
            document.uri.includes(".view") &&
            document.getText().includes("view:")
        );
    }

    public isModelFile(document: TextDocument): boolean {
        return document.uri.includes(".model");
    }

    public getViewNameFromFile(document: TextDocument): string | undefined {
        const lines = getLines(document);

        // Scan first 10 lines for view declaration
        for (let i = 0; i < Math.min(10, lines.length); i++) {
            const line = lines[i].trim();

            // Skip empty lines and comments
            if (line === "" || line.startsWith("#")) continue;

            const viewMatch = line.match(/^view:\s+([a-zA-Z0-9_]+)\s*\{/);
            if (viewMatch) {
                return viewMatch[1];
            }
        }

        return undefined;
    }

    /**
     * Initialize the workspace by finding and loading the model file
     */
    public async initialize(): Promise<void> {
        await this.parseFiles({
            reset: true,
        });
    }

    public async parseDocument(document: TextDocument): Promise<void> {
        const response = parse(document.getText());
        const isModel = document.uri.includes(".model");
        const cwd = process.cwd();

        const filePath = document.uri.replace(`file://${cwd}/`, "");
        const fullFileName = filePath.split("/").pop() ?? "";
        const fileRel = filePath.split(".")[0];

        const project: LookmlProject = {
            file: {
                [filePath.replace(".lkml", "")]: {
                    ...response,
                    $file_name: fullFileName.split(".")[0],
                    $file_path: filePath,
                    $file_rel: fileRel,
                    $file_type: isModel ? "model" : "view",
                },
            },
        };
        transformations.addPositions(project as any);

        await this.processProject(project);
    }

    public async parseFiles({
        source,
        reset = false,
    }: {
        source?: string;
        reset?: boolean;
    }): Promise<void> {
        source = source ?? "**/*.{view,model,explore}.lkml";

        const project = await parseFiles({
            source,
            fileOutput: "by-name",
            readFileOptions: { encoding: "utf-8" },
            readFileConcurrency: 4,
            transformations: {
                applyExtensionsRefinements: true,
                removeAbstract: true,
            } as any,
        });
        
        transformations.addPositions(project);

        if (reset) {
            this.errors = new Map<string, LookmlError[]>();
            this.explores = new Map<string, LookmlExploreWithFileInfo>();
            this.models = new Map<string, LookmlModelWithFileInfo>();
            this.views = new Map<string, LookmlViewWithFileInfo>();
            this.viewsByFile = new Map<DocumentUri, string[]>();
        }

        if (!reset) {
            // TODO: remove this once we have a better way to handle updates
        }

        if (project.errors) {
            for (const error of project.errors) {
                const fileName = error.$file_path.split("/").pop() ?? "";
                const existingErrors = this.errors.get(fileName) ?? [];
                existingErrors.push(error);
                this.errors.set(fileName, existingErrors);
            }
        }

        await this.processProject(project);
    }

    private expandViewDimensionGroups(view: any, viewPositions: any) {
        if (!view.dimension_group) return;

        if (!view.dimension) view.dimension = {};
        if (viewPositions && !viewPositions.dimension)
            viewPositions.dimension = {};

        const groupEntries = Object.entries(view.dimension_group) as [
            string,
            any,
        ][];
        for (const [groupName, group] of groupEntries) {
            // Only expand time and duration groups
            if (group.type === "time" || group.type === "duration") {
                const names =
                    group.type === "time"
                        ? group.timeframes || DIMENSION_GROUP_DEFAULT_TIMEFRAMES
                        : group.intervals || DIMENSION_GROUP_DEFAULT_INTERVALS;

                const groupPos = viewPositions?.dimension_group?.[groupName];

                for (const name of names) {
                    const expandedName =
                        group.type === "time"
                            ? `${groupName}_${name}`
                            : `${name}s_${groupName}`;

                    if (!view.dimension[expandedName]) {
                        view.dimension[expandedName] = {
                            ...group,
                            $name: expandedName,
                            type: "dimension",
                        };
                    }
                    if (
                        viewPositions &&
                        groupPos &&
                        !viewPositions.dimension[expandedName]
                    ) {
                        viewPositions.dimension[expandedName] = groupPos;
                    }
                }
                // Stop direct reference to group name by removing it
                delete view.dimension_group[groupName];
                if (viewPositions?.dimension_group) {
                    delete viewPositions.dimension_group[groupName];
                }
            }
        }
    }

    public async processProject(project: LookmlProject): Promise<void> {
        const initialEntries: {
            view: Array<LookmlFile["view"]>;
            explore: Array<LookmlFile["explore"]>;
        } = {
            view: [],
            explore: [],
        };

        const entities = Object.values(project.file).reduce((acc, value) => {
            const { explore, view } = value;
            const file = {
                $file_name: value.$file_name,
                $file_path: value.$file_path,
                $file_rel: value.$file_rel,
                $file_type: value.$file_type,
            };

            if (explore) {
                const exploreEntries = Array.isArray(explore) ? explore : [explore];
                exploreEntries.forEach((entry) => {
                    Object.entries(entry).forEach(([name, e]: [string, any]) => {
                        if (name.startsWith("$")) return;
                        if (!e.$name) e.$name = name;
                        acc.explore.push({
                            file,
                            explore: e,
                        });
                    });
                });
            }

            if (view) {
                const viewEntries = Array.isArray(view) ? view : [view];
                viewEntries.forEach((entry) => {
                    Object.entries(entry).forEach(([name, v]: [string, any]) => {
                        if (name.startsWith("$")) return;
                        if (!v.$name) v.$name = name;
                        acc.view.push({
                            file,
                            view: v,
                        });
                    });
                });
            }
            return acc;
        }, initialEntries);

        for (const { file, view } of entities.view) {
            const viewName = view.$name;
            const filePath = file.$file_path;
            const fileName = file.$file_name;

            const uri = path.resolve(process.cwd(), filePath);
            const viewsByFile = this.viewsByFile.get(uri) || [];

            const filePositions =
                project?.positions?.file[filePath.replace(".lkml", "")];

            if (!filePositions) {
                throw new Error(`filePositions not found for ${filePath}`);
            }

            this.views.set(viewName, {
                file,
                uri,
                view,
                positions: filePositions?.view?.[viewName],
            });

            if (viewsByFile.includes(viewName)) {
                continue;
            }

            viewsByFile.push(viewName);
            this.viewsByFile.set(uri, viewsByFile);
        }

        // Apply refinements mapping
        for (const { view } of entities.view) {
            const viewName = view.$name;
            if (viewName && viewName.startsWith("+")) {
                const baseName = viewName.slice(1);
                const baseEntry = this.views.get(baseName);
                if (baseEntry) {
                    let targetView = baseEntry.view;
                    if (Array.isArray(targetView)) {
                        targetView = targetView[0];
                    }
                    const refineViews = Array.isArray(view) ? view : [view];

                    for (const refineView of refineViews) {
                        if (refineView.dimension) {
                            targetView.dimension = {
                                ...(targetView.dimension || {}),
                                ...refineView.dimension,
                            };
                        }
                        if (refineView.measure) {
                            targetView.measure = {
                                ...(targetView.measure || {}),
                                ...refineView.measure,
                            };
                        }
                        if (refineView.dimension_group) {
                            targetView.dimension_group = {
                                ...(targetView.dimension_group || {}),
                                ...refineView.dimension_group,
                            };
                        }
                    }
                }
            }
        }

        for (const { file, explore } of entities.explore) {
            const exploreName = explore.$name;
            const filePath = file.$file_path;
            const fileName = file.$file_name;

            const uri = path.resolve(process.cwd(), filePath);
            const filePositions =
                project?.positions?.file[filePath.replace(".lkml", "")];

            if (!filePositions) {
                throw new Error(`filePositions not found for ${filePath}`);
            }

            this.explores.set(exploreName, {
                explore,
                file,
                uri,
                positions: filePositions.explore?.[exploreName],
            });

            const fileExploreNames = this.exploresByFile.get(uri) || [];
            fileExploreNames.push(exploreName);
            this.exploresByFile.set(uri, fileExploreNames);
        }

        for (const [key, value] of Object.entries(project.file) as [
            string,
            any,
        ][]) {
            switch (value.$file_type) {
                case "model": {
                    const model = value as LookmlModel;
                    const filePath = model.$file_path;
                    const fileRel = model.$file_rel;
                    const fileName = value.$file_name;

                    this.includedViews.set(fileName, new Set<string>());

                    const uri = path.resolve(process.cwd(), filePath);
                    const filePositions =
                        project?.positions?.file[`${fileRel}.model`];

                    if (!filePositions) {
                        throw new Error(
                            `filePositions not found for ${filePath}`,
                        );
                    }

                    this.models.set(fileName, {
                        model,
                        uri,
                        positions: filePositions,
                    });

                    const modelFileNames = this.modelsByFile.get(uri) || [];

                    if (model.view) {
                        Object.keys(model.view).forEach((viewName) => {
                            const includedViews =
                                this.includedViews.get(fileName) ||
                                new Set<string>();
                            includedViews.add(viewName);
                            this.includedViews.set(fileName, includedViews);
                        });
                    }

                    if (!modelFileNames.includes(fileName)) {
                        modelFileNames.push(fileName);
                        this.modelsByFile.set(uri, modelFileNames);
                    }

                    const includes =
                        typeof model.include === "string"
                            ? [model.include]
                            : model.include;
                    if (!includes) {
                        continue;
                    }

                    for (const include of includes) {
                        await this.resolveInclude(uri, include, fileName);
                    }
                }
            }
        }

        // Final pass: Expand all dimension groups in all views
        for (const viewDetails of this.views.values()) {
            this.expandViewDimensionGroups(
                viewDetails.view,
                viewDetails.positions,
            );
        }
    }

    /**
     * Process a document and update the workspace model
     */
    public async updateDocument(document: TextDocument): Promise<void> {
        const { uri, version = 0 } = document;
        const fsPath = URI.parse(uri).fsPath;

        // Skip if we've already processed this version
        if (version && this.documentVersions.get(fsPath) === version) {
            // Skip if we've already processed this version
            return;
        }
        this.documentVersions.set(fsPath, version);

        // Remove existing data for this file
        this.clearDocumentData(uri);

        const cleanUri = uri.replace(`file://${process.cwd()}/`, "");
        try {
            await this.parseDocument(document);
        } catch (error) {
            const fileName = cleanUri.split("/").pop() ?? "";
            const filePath = cleanUri.split("/").slice(0, -1).join("/");
            const fileRel = filePath.split("/").pop() ?? "";
            const fileType = fileRel.includes(".model") ? "model" : "view";

            const lookmlError: LookmlError = {
                error: error as LookmlError["error"],
                $file_name: fileName,
                $file_path: filePath,
                $file_rel: fileRel,
                $file_type: fileType,
            };

            if (lookmlError.error.exception) {
                const existingErrors = this.errors.get(fileName) ?? [];
                existingErrors.push(lookmlError);
                this.errors.set(fileName, existingErrors);
            }
            console.error("updateDocument parse error", error);
        }
    }

    /**
     * Remove data for a document that's been closed/deleted
     */
    public removeDocument(uri: DocumentUri): void {
        this.clearDocumentData(uri);
        this.documentVersions.delete(uri);
        this.loadedFiles.delete(uri);
    }

    /**
     * Clear all data associated with a document
     */
    private clearDocumentData(uri: DocumentUri): void {
        const fsPath = URI.parse(uri).fsPath;
        // Remove views defined in this file
        const viewNames = this.viewsByFile.get(fsPath) || [];
        for (const viewName of viewNames) {
            this.views.delete(viewName);
        }
        this.viewsByFile.delete(fsPath);

        // Remove explores defined in this file
        const exploreNames = this.exploresByFile.get(fsPath) || [];
        for (const exploreName of exploreNames) {
            this.explores.delete(exploreName);
        }
        this.exploresByFile.delete(fsPath);

        // Remove models defined in this file
        const modelNames = this.modelsByFile.get(fsPath) || [];
        for (const modelName of modelNames) {
            this.models.delete(modelName);
        }
        this.modelsByFile.delete(fsPath);

        const fileName = fsPath.split("/").pop() ?? "";

        const errorsByFile = this.errors.get(fileName) ?? [];
        errorsByFile.forEach((error) => {
            this.errors.delete(fileName);
        });
    }

    /**
     * Get diagnostics for a document
     */
    public getDiagnostics(document: TextDocument): Diagnostic[] {
        // Use lookml-parser to get advanced diagnostics
        const parserDiagnostics = this.lookmlParser.getDiagnostics(document);

        // Convert to LSP diagnostics format if needed
        const diagnostics: Diagnostic[] = parserDiagnostics.map((diag: any) => {
            return {
                severity: DiagnosticSeverity.Error,
                range:
                    diag.range ||
                    Range.create(Position.create(0, 0), Position.create(0, 1)),
                message: diag.message || "Unknown error",
                source: "lookml-lsp",
                code: diag.code,
            };
        });

        return diagnostics;
    }

    /**
     * Find all references to a symbol in the workspace
     */
    public findReferences(name: string): Location[] {
        const references: Location[] = [];

        // Check if it's a view
        if (this.views.has(name)) {
            const view = this.views.get(name)!;
            console.log("findReferences view", view);
        }
        return references;
    }

    /**
     * Get the workspace folder containing a given document
     */
    public getWorkspaceFolder(documentUri: string): string | null {
        try {
            const parsedUri = URI.parse(documentUri);
            return path.dirname(parsedUri.fsPath);
        } catch (e) {
            return null;
        }
    }

    /**
     * Get model name from URI
     */
    public getModelNameFromUri(uri: string): string | null {
        const fileNameMatch = uri.match(/([^\/]+)\.model\.lkml$/);
        return fileNameMatch ? fileNameMatch[1] : null;
    }

    /**
     * Get included views for a model
     */
    public getIncludedViewsForModel(
        modelName: string,
    ): Set<string> | undefined {
        return this.includedViews.get(modelName);
    }

    /**
     * Resolve include patterns to actual files
     */
    private async resolveInclude(
        baseUri: string,
        includePattern: string,
        modelName: string,
    ): Promise<void> {
        try {
            // Clean up the pattern (remove quotes)
            const cleanPattern = includePattern
                .replace(/\s*#.*$/, "") // 1. remove comments (everything after #)
                .replace(/^["']|["']$/g, ""); // 2. remove surrounding quotes

            // Get the base directory
            const baseDir = this.getWorkspaceFolder(baseUri);

            if (!baseDir) {
                console.log(
                    `Could not determine base directory for ${baseUri}`,
                );
                return;
            }
            // Send a custom request to the client to find matching files
            const matchedFiles = await this.getMatchingFiles(
                baseDir,
                cleanPattern,
            );

            for (const filePath of matchedFiles) {
                const fsPath = URI.parse(filePath).fsPath;
                if (this.loadedFiles.has(fsPath)) continue;
                this.loadedFiles.add(fsPath);
                try {
                    // Request file content via LSP
                    const viewsFromThisFile =
                        this.viewsByFile.get(fsPath) || [];
                    // console.log(`RESOLVE include: filePath=${fsPath}, viewsFound=${viewsFromThisFile.join(",")}`);
                    const modelIncludes =
                        this.includedViews.get(modelName) || new Set();

                    viewsFromThisFile.forEach((view) =>
                        modelIncludes.add(view),
                    );
                    this.includedViews.set(modelName, modelIncludes);
                } catch (fileError) {
                    console.error(
                        `Failed to load file ${filePath}:`,
                        fileError,
                    );
                }
            }
        } catch (e) {
            console.error(`Error resolving include ${includePattern}:`, e);
        }
    }

    /**
     * Request matching files from client
     */
    public async getMatchingFiles(
        baseDir: string,
        pattern: string,
    ): Promise<string[]> {
        try {
            // Send a custom request to the client
            const response = await this.connection.sendRequest(
                "lookml/findMatchingFiles",
                {
                    baseDir,
                    pattern,
                },
            );

            // The response should be an array of file paths
            if (Array.isArray(response)) {
                return response;
            } else {
                console.error(`Invalid response format from client:`, response);
                return [];
            }
        } catch (error) {
            console.error(
                `Error requesting matching files from client:`,
                error,
            );
            if (error instanceof Error) {
                console.error(`Error details:`, {
                    message: error.message,
                    stack: error.stack,
                });
            }
            return [];
        }
    }

    /**
     * Use lookml-parser to get completions
     */
    public getCompletions(document: TextDocument, position: Position): any[] {
        return this.lookmlParser.getCompletions(document, position);
    }

    /**
     * Use lookml-parser to get hover information
     */
    public getHoverInfo(
        document: TextDocument,
        position: Position,
    ): any | null {
        return this.lookmlParser.getHoverInfo(document, position);
    }

    /**
     * Clean up resources when shutting down
     */
    public async cleanup(): Promise<void> {
        await this.lookmlParser.cleanup();
    }

    /**
     * Get all fields for a view, including those inherited via extends
     */
    public getViewFields(viewName: string, visited: Set<string> = new Set()): {
        dimension: Record<string, any>;
        measure: Record<string, any>;
        dimension_group: Record<string, any>;
    } {
        if (visited.has(viewName)) {
            return { dimension: {}, measure: {}, dimension_group: {} };
        }
        visited.add(viewName);

        const viewDetails = this.getView(viewName);
        if (!viewDetails || !viewDetails.view) {
            return { dimension: {}, measure: {}, dimension_group: {} };
        }

        const view = viewDetails.view;
        let dimensions = { ...(view.dimension || {}) };
        let measures = { ...(view.measure || {}) };
        let dimensionGroups = { ...(view.dimension_group || {}) };

        if (view.extends) {
            const extendedViews = Array.isArray(view.extends)
                ? view.extends
                : [view.extends];
            // Process extends in reverse order (later ones override earlier ones, 
            // but local fields override all)
            for (const extName of extendedViews) {
                const extFields = this.getViewFields(extName, new Set(visited));
                dimensions = { ...extFields.dimension, ...dimensions };
                measures = { ...extFields.measure, ...measures };
                dimensionGroups = {
                    ...extFields.dimension_group,
                    ...dimensionGroups,
                };
            }
        }

        return {
            dimension: dimensions,
            measure: measures,
            dimension_group: dimensionGroups,
        };
    }

    /**
     * Get fields for a specific table/view
     * Used for providing field completions in SQL contexts
     */
    public getTableFields(
        tableName: string,
    ): { name: string; type: string }[] | null {
        // Look up all fields including inherited ones
        const fields = this.getViewFields(tableName);
        
        const hasFields = 
            Object.keys(fields.dimension).length > 0 || 
            Object.keys(fields.measure).length > 0 || 
            Object.keys(fields.dimension_group).length > 0;

        if (!hasFields) {
            return null;
        }

        const dimensionFields = Object.entries(fields.dimension).map(
            ([fieldName, field]: [string, any]) => ({
                name: fieldName,
                type: field.type || "dimension",
            }),
        );

        const measureFields = Object.entries(fields.measure).map(
            ([fieldName, field]: [string, any]) => ({
                name: fieldName,
                type: field.type || "measure",
            }),
        );

        const dimensionGroupFields = Object.entries(fields.dimension_group).map(
            ([groupName, group]: [string, any]) => ({
                name: groupName,
                type: group.type || "dimension",
            }),
        );

        return [...dimensionFields, ...measureFields, ...dimensionGroupFields];
    }
}
