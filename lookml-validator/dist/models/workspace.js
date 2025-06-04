"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.WorkspaceModel = void 0;
const vscode_languageserver_types_1 = require("vscode-languageserver-types");
const path = __importStar(require("path"));
const vscode_uri_1 = require("vscode-uri");
const lookml_parser_1 = require("./lookml-parser");
const lookml_parser_2 = require("lookml-parser");
class WorkspaceModel {
    constructor(args) {
        // Document tracking
        this.errors = new Map();
        this.views = new Map();
        this.explores = new Map();
        this.models = new Map();
        this.viewsByFile = new Map();
        this.includedViews = new Map();
        this.exploresByFile = new Map();
        this.modelsByFile = new Map();
        this.loadedFiles = new Set();
        // Version tracking for incremental updates
        this.documentVersions = new Map();
        this.connection = args.connection;
        this.lookmlParser = new lookml_parser_1.LookMLParser();
    }
    getView(name) {
        return this.views.get(name);
    }
    getViews() {
        return this.views;
    }
    getViewsByFile(uri) {
        var _a;
        return (_a = this.viewsByFile.get(uri)) !== null && _a !== void 0 ? _a : [];
    }
    getErrorsByFileName(fileName) {
        var _a;
        return (_a = this.errors.get(fileName)) !== null && _a !== void 0 ? _a : [];
    }
    getExplore(name) {
        return this.explores.get(name);
    }
    getExplores() {
        return this.explores;
    }
    getExploresByFile(uri) {
        var _a;
        return (_a = this.exploresByFile.get(uri)) !== null && _a !== void 0 ? _a : [];
    }
    getModels() {
        return this.models;
    }
    getModelsByFile(uri) {
        var _a;
        return (_a = this.modelsByFile.get(uri)) !== null && _a !== void 0 ? _a : [];
    }
    /**
     * Get a specific model by name
     */
    getModel(name) {
        return this.models.get(name);
    }
    isViewFile(document) {
        return document.uri.includes(".view") && document.getText().includes("view:");
    }
    isModelFile(document) {
        return document.uri.includes(".model");
    }
    getViewNameFromFile(document) {
        const lines = document.getText().split("\n");
        // Scan first 10 lines for view declaration
        for (let i = 0; i < Math.min(10, lines.length); i++) {
            const line = lines[i].trim();
            // Skip empty lines and comments
            if (line === "" || line.startsWith("#"))
                continue;
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
    initialize() {
        return __awaiter(this, void 0, void 0, function* () {
            yield this.parseFiles({
                reset: true,
            });
        });
    }
    parseDocument(document) {
        return __awaiter(this, void 0, void 0, function* () {
            var _a;
            const response = (0, lookml_parser_2.parse)(document.getText());
            const isModel = document.uri.includes(".model");
            const cwd = process.cwd();
            const filePath = document.uri.replace(`file://${cwd}/`, "");
            const fullFileName = (_a = filePath.split("/").pop()) !== null && _a !== void 0 ? _a : "";
            const fileRel = filePath.split(".")[0];
            const project = {
                file: {
                    [filePath.replace(".lkml", "")]: Object.assign(Object.assign({}, response), { $file_name: fullFileName.split(".")[0], $file_path: filePath, $file_rel: fileRel, $file_type: isModel ? "model" : "view" }),
                },
            };
            lookml_parser_2.transformations.addPositions(project);
            yield this.processProject(project);
        });
    }
    parseFiles(_a) {
        return __awaiter(this, arguments, void 0, function* ({ source, reset = false, }) {
            var _b, _c;
            source = source !== null && source !== void 0 ? source : "**/*.{view,model,explore}.lkml";
            const project = yield (0, lookml_parser_2.parseFiles)({
                source,
                fileOutput: 'by-name',
                readFileOptions: { encoding: "utf-8" },
                readFileConcurrency: 4,
            });
            lookml_parser_2.transformations.addPositions(project);
            if (reset) {
                this.errors = new Map();
                this.explores = new Map();
                this.models = new Map();
                this.views = new Map();
                this.viewsByFile = new Map();
            }
            if (!reset) {
                // TODO: remove this once we have a better way to handle updates
            }
            if (project.errors) {
                for (const error of project.errors) {
                    const fileName = (_b = error.$file_path.split("/").pop()) !== null && _b !== void 0 ? _b : "";
                    const existingErrors = (_c = this.errors.get(fileName)) !== null && _c !== void 0 ? _c : [];
                    existingErrors.push(error);
                    this.errors.set(fileName, existingErrors);
                }
            }
            yield this.processProject(project);
        });
    }
    processProject(project) {
        return __awaiter(this, void 0, void 0, function* () {
            var _a, _b, _c, _d, _e;
            const initialEntries = {
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
                    Object.values(explore).forEach((explore) => {
                        acc.explore.push({
                            file,
                            explore
                        });
                    });
                }
                if (view) {
                    Object.values(view).forEach((view) => {
                        acc.view.push({
                            file,
                            view
                        });
                    });
                }
                return acc;
            }, initialEntries);
            for (const { file, view } of entities.view) {
                const viewName = view.$name;
                const filePath = file.$file_path;
                const fileName = file.$file_name;
                const uri = `${process.cwd()}/${filePath}`;
                const viewsByFile = this.viewsByFile.get(uri) || [];
                const filePositions = (_a = project === null || project === void 0 ? void 0 : project.positions) === null || _a === void 0 ? void 0 : _a.file[filePath.replace(".lkml", "")];
                if (!filePositions) {
                    throw new Error(`filePositions not found for ${filePath}`);
                }
                this.views.set(viewName, {
                    file,
                    uri,
                    view,
                    positions: (_b = filePositions === null || filePositions === void 0 ? void 0 : filePositions.view) === null || _b === void 0 ? void 0 : _b[viewName],
                });
                if (viewsByFile.includes(viewName)) {
                    continue;
                }
                viewsByFile.push(viewName);
                this.viewsByFile.set(uri, viewsByFile);
            }
            for (const { file, explore } of entities.explore) {
                const exploreName = explore.$name;
                const filePath = file.$file_path;
                const fileName = file.$file_name;
                const uri = `${process.cwd()}/${filePath}`;
                const filePositions = (_c = project === null || project === void 0 ? void 0 : project.positions) === null || _c === void 0 ? void 0 : _c.file[filePath.replace(".lkml", "")];
                if (!filePositions) {
                    throw new Error(`filePositions not found for ${filePath}`);
                }
                this.explores.set(exploreName, {
                    explore,
                    file,
                    uri,
                    positions: (_d = filePositions.explore) === null || _d === void 0 ? void 0 : _d[exploreName],
                });
                const fileExploreNames = this.exploresByFile.get(uri) || [];
                fileExploreNames.push(exploreName);
                this.exploresByFile.set(uri, fileExploreNames);
            }
            for (const [key, value] of Object.entries(project.file)) {
                switch (value.$file_type) {
                    case "model": {
                        const model = value;
                        const filePath = model.$file_path;
                        const fileRel = model.$file_rel;
                        const fileName = value.$file_name;
                        this.includedViews.set(fileName, new Set);
                        const uri = `${process.cwd()}/${filePath}`;
                        const filePositions = (_e = project === null || project === void 0 ? void 0 : project.positions) === null || _e === void 0 ? void 0 : _e.file[`${fileRel}.model`];
                        if (!filePositions) {
                            throw new Error(`filePositions not found for ${filePath}`);
                        }
                        this.models.set(fileName, {
                            model,
                            uri,
                            positions: filePositions,
                        });
                        const modelFileNames = this.modelsByFile.get(uri) || [];
                        if (model.view) {
                            Object.keys(model.view).forEach((viewName) => {
                                const includedViews = this.includedViews.get(fileName) || new Set();
                                includedViews.add(viewName);
                                this.includedViews.set(fileName, includedViews);
                            });
                        }
                        if (!modelFileNames.includes(fileName)) {
                            modelFileNames.push(fileName);
                            this.modelsByFile.set(uri, modelFileNames);
                        }
                        const includes = typeof model.include === 'string' ? [model.include] : model.include;
                        if (!includes) {
                            continue;
                        }
                        for (const include of includes) {
                            yield this.resolveInclude(uri, include, fileName);
                        }
                    }
                }
            }
        });
    }
    /**
     * Process a document and update the workspace model
     */
    updateDocument(document) {
        return __awaiter(this, void 0, void 0, function* () {
            var _a, _b, _c;
            const { uri, version = 0 } = document;
            // Skip if we've already processed this version
            if (version && this.documentVersions.get(uri) === version) {
                console.log("SKIPPING UPDATE DOCUMENT", uri, version);
                return;
            }
            this.documentVersions.set(uri, version);
            // Remove existing data for this file
            this.clearDocumentData(uri);
            const cleanUri = uri.replace(`file://${process.cwd()}/`, "");
            try {
                yield this.parseDocument(document);
            }
            catch (error) {
                const fileName = (_a = cleanUri.split("/").pop()) !== null && _a !== void 0 ? _a : "";
                const filePath = cleanUri.split("/").slice(0, -1).join("/");
                const fileRel = (_b = filePath.split("/").pop()) !== null && _b !== void 0 ? _b : "";
                const fileType = fileRel.includes(".model") ? "model" : "view";
                const lookmlError = {
                    error: error,
                    $file_name: fileName,
                    $file_path: filePath,
                    $file_rel: fileRel,
                    $file_type: fileType,
                };
                if (lookmlError.error.exception) {
                    const existingErrors = (_c = this.errors.get(fileName)) !== null && _c !== void 0 ? _c : [];
                    existingErrors.push(lookmlError);
                    this.errors.set(fileName, existingErrors);
                }
                console.error("updateDocument parse error", error);
            }
        });
    }
    /**
     * Remove data for a document that's been closed/deleted
     */
    removeDocument(uri) {
        this.clearDocumentData(uri);
        this.documentVersions.delete(uri);
        this.loadedFiles.delete(uri);
    }
    /**
     * Clear all data associated with a document
     */
    clearDocumentData(uri) {
        var _a, _b;
        // Remove views defined in this file
        const viewNames = this.viewsByFile.get(uri) || [];
        for (const viewName of viewNames) {
            this.views.delete(viewName);
        }
        this.viewsByFile.delete(uri);
        // Remove explores defined in this file
        const exploreNames = this.exploresByFile.get(uri) || [];
        for (const exploreName of exploreNames) {
            this.explores.delete(exploreName);
        }
        this.exploresByFile.delete(uri);
        // Remove models defined in this file
        const modelNames = this.modelsByFile.get(uri) || [];
        for (const modelName of modelNames) {
            this.models.delete(modelName);
        }
        this.modelsByFile.delete(uri);
        const fileName = (_a = uri.split("/").pop()) !== null && _a !== void 0 ? _a : "";
        const errorsByFile = (_b = this.errors.get(fileName)) !== null && _b !== void 0 ? _b : [];
        errorsByFile.forEach((error) => {
            this.errors.delete(fileName);
        });
    }
    /**
     * Get diagnostics for a document
     */
    getDiagnostics(document) {
        // Use lookml-parser to get advanced diagnostics
        const parserDiagnostics = this.lookmlParser.getDiagnostics(document);
        // Convert to LSP diagnostics format if needed
        const diagnostics = parserDiagnostics.map((diag) => {
            return {
                severity: vscode_languageserver_types_1.DiagnosticSeverity.Error,
                range: diag.range ||
                    vscode_languageserver_types_1.Range.create(vscode_languageserver_types_1.Position.create(0, 0), vscode_languageserver_types_1.Position.create(0, 1)),
                message: diag.message || "Unknown error",
                source: "lookml-lsp",
            };
        });
        return diagnostics;
    }
    /**
     * Find all references to a symbol in the workspace
     */
    findReferences(name) {
        const references = [];
        // Check if it's a view
        if (this.views.has(name)) {
            const view = this.views.get(name);
            console.log("findReferences view", view);
        }
        return references;
    }
    /**
     * Get the workspace folder containing a given document
     */
    getWorkspaceFolder(documentUri) {
        try {
            const parsedUri = vscode_uri_1.URI.parse(documentUri);
            return path.dirname(parsedUri.fsPath);
        }
        catch (e) {
            return null;
        }
    }
    /**
     * Get model name from URI
     */
    getModelNameFromUri(uri) {
        const fileNameMatch = uri.match(/([^\/]+)\.model\.lkml$/);
        return fileNameMatch ? fileNameMatch[1] : null;
    }
    /**
     * Get included views for a model
     */
    getIncludedViewsForModel(modelName) {
        return this.includedViews.get(modelName);
    }
    /**
     * Resolve include patterns to actual files
     */
    resolveInclude(baseUri, includePattern, modelName) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                // Clean up the pattern (remove quotes)
                const cleanPattern = includePattern
                    .replace(/\s*#.*$/, "") // 1. remove comments (everything after #)
                    .replace(/^["']|["']$/g, ""); // 2. remove surrounding quotes
                // Get the base directory
                const baseDir = this.getWorkspaceFolder(baseUri);
                if (!baseDir) {
                    console.log(`Could not determine base directory for ${baseUri}`);
                    return;
                }
                // Send a custom request to the client to find matching files
                const matchedFiles = yield this.getMatchingFiles(baseDir, cleanPattern);
                for (const filePath of matchedFiles) {
                    if (this.loadedFiles.has(filePath))
                        continue;
                    try {
                        // Request file content via LSP
                        const viewsFromThisFile = this.viewsByFile.get(filePath) || [];
                        const modelIncludes = this.includedViews.get(modelName) || new Set();
                        viewsFromThisFile.forEach((view) => modelIncludes.add(view));
                        this.includedViews.set(modelName, modelIncludes);
                    }
                    catch (fileError) {
                        console.error(`Failed to load file ${filePath}:`, fileError);
                    }
                }
            }
            catch (e) {
                console.error(`Error resolving include ${includePattern}:`, e);
            }
        });
    }
    /**
     * Request matching files from client
     */
    getMatchingFiles(baseDir, pattern) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                // Send a custom request to the client
                const response = yield this.connection.sendRequest("lookml/findMatchingFiles", {
                    baseDir,
                    pattern,
                });
                // The response should be an array of file paths
                if (Array.isArray(response)) {
                    return response;
                }
                else {
                    console.error(`Invalid response format from client:`, response);
                    return [];
                }
            }
            catch (error) {
                console.error(`Error requesting matching files from client:`, error);
                if (error instanceof Error) {
                    console.error(`Error details:`, {
                        message: error.message,
                        stack: error.stack,
                    });
                }
                return [];
            }
        });
    }
    /**
     * Use lookml-parser to get completions
     */
    getCompletions(document, position) {
        return this.lookmlParser.getCompletions(document, position);
    }
    /**
     * Use lookml-parser to get hover information
     */
    getHoverInfo(document, position) {
        return this.lookmlParser.getHoverInfo(document, position);
    }
    /**
     * Clean up resources when shutting down
     */
    cleanup() {
        return __awaiter(this, void 0, void 0, function* () {
            yield this.lookmlParser.cleanup();
        });
    }
    /**
     * Get fields for a specific table/view
     * Used for providing field completions in SQL contexts
     */
    getTableFields(tableName) {
        // Look up the view in our workspace
        const viewDetails = this.getView(tableName);
        const view = viewDetails === null || viewDetails === void 0 ? void 0 : viewDetails.view;
        if (!view || !view.measure || !view.dimension) {
            return null;
        }
        // Convert the Map to an array of field objects
        const measureFields = view.measure ? Object.entries(view.measure).map(([fieldName, field]) => ({
            name: fieldName,
            type: field.type,
        })) : [];
        const dimensionFields = view.dimension ? Object.entries(view.dimension).map(([fieldName, field]) => ({
            name: fieldName,
            type: field.type,
        })) : [];
        const dimensionGroupFields = view.dimension_group ? Object.entries(view.dimension_group).map(([fieldName, field]) => ({
            name: fieldName,
            type: field.type,
        })) : [];
        return [...measureFields, ...dimensionFields, ...dimensionGroupFields];
    }
}
exports.WorkspaceModel = WorkspaceModel;
