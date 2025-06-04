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
exports.LookMLValidator = void 0;
exports.Validate = Validate;
const workspace_1 = require("./models/workspace");
const diagnostics_1 = require("./providers/diagnostics");
const vscode_languageserver_textdocument_1 = require("vscode-languageserver-textdocument");
const fs = __importStar(require("fs"));
const path = __importStar(require("path"));
// Minimal Connection object for WorkspaceModel
const connection = {
    sendRequest: () => __awaiter(void 0, void 0, void 0, function* () { }),
    sendNotification: () => { },
    onNotification: () => { },
    dispose: () => { }
};
class LookMLValidator {
    constructor() {
        this.workspaceModel = new workspace_1.WorkspaceModel({ connection });
        this.diagnosticsProvider = new diagnostics_1.DiagnosticsProvider(this.workspaceModel);
    }
    validate(folderPath) {
        return __awaiter(this, void 0, void 0, function* () {
            if (folderPath) {
                // Ensure the path is absolute
                const absoluteFolderPath = path.resolve(folderPath);
                // Use a glob pattern relative to the provided folder path
                yield this.workspaceModel.parseFiles({ source: `${absoluteFolderPath}/**/*.{view,model,explore}.lkml`, reset: true });
            }
            else {
                // Default behavior: scan from the current working directory or a predefined root
                yield this.workspaceModel.parseFiles({ reset: true });
            }
            let allDiagnostics = [];
            const files = new Set();
            // Collect all unique file URIs from models, views, and explores
            this.workspaceModel.getModels().forEach(model => files.add(model.uri));
            this.workspaceModel.getViews().forEach(view => files.add(view.uri));
            this.workspaceModel.getExplores().forEach(explore => files.add(explore.uri));
            for (const fileUri of files) {
                try {
                    const filePath = fileUri.startsWith('file://') ? new URL(fileUri).pathname : fileUri;
                    // Check if file exists and is accessible before reading
                    if (!fs.existsSync(filePath)) {
                        console.warn(`File not found or inaccessible: ${filePath}, skipping.`);
                        // Optionally, add a diagnostic for missing files if that's desired behavior
                        // allDiagnostics.push({
                        //   message: `File not found: ${filePath}`,
                        //   range: { start: { line: 0, character: 0 }, end: { line: 0, character: 0 } },
                        //   severity: DiagnosticSeverity.Warning, // Or Error, depending on requirements
                        //   source: 'lookml-validator'
                        // });
                        continue;
                    }
                    const content = fs.readFileSync(filePath, 'utf-8');
                    const document = vscode_languageserver_textdocument_1.TextDocument.create(fileUri, 'lookml', 0, content);
                    // It's important to update the document in the workspace model as well,
                    // especially if parseFiles doesn't store the content or if there are incremental updates.
                    yield this.workspaceModel.updateDocument(document);
                    const diagnostics = this.diagnosticsProvider.validateDocument(document);
                    allDiagnostics = allDiagnostics.concat(diagnostics);
                }
                catch (error) {
                    console.error(`Error processing file ${fileUri}:`, error);
                    // Optionally, add a diagnostic for files that cause errors during processing
                    // allDiagnostics.push({
                    //   message: `Error processing file ${fileUri}: ${(error as Error).message}`,
                    //   range: { start: { line: 0, character: 0 }, end: { line: 0, character: 0 } },
                    //   severity: DiagnosticSeverity.Error,
                    //   source: 'lookml-validator'
                    // });
                }
            }
            return allDiagnostics;
        });
    }
}
exports.LookMLValidator = LookMLValidator;
// Export a single Validate function
function Validate(folderPath) {
    return __awaiter(this, void 0, void 0, function* () {
        const validator = new LookMLValidator();
        return validator.validate(folderPath);
    });
}
