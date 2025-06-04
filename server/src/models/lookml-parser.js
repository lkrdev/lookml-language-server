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
exports.LookMLParser = void 0;
const node_1 = require("vscode-languageserver/node");
const path = __importStar(require("path"));
const vscode_uri_1 = require("vscode-uri");
const lookml_parser_1 = require("lookml-parser");
const fs = __importStar(require("fs/promises"));
const os = __importStar(require("os"));
class LookMLParser {
    constructor() {
        this.lookmlProject = null;
        this.tempFilesDir = null;
        this.initTempDir();
    }
    /**
     * Initialize temp directory for lookml-parser file operations
     */
    initTempDir() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                this.tempFilesDir = yield fs.mkdtemp(path.join(os.tmpdir(), "lookml-lsp-"));
            }
            catch (error) {
                console.error('Failed to create temp directory:', error);
            }
        });
    }
    /**
     * Get the lookml-parser Project object
     */
    getLookMLProject() {
        return this.lookmlProject;
    }
    /**
     * Perform custom parsing to extract locations and basic structure
     */
    customParseDocument(document, result) {
        const text = document.getText();
        const lines = text.split("\n");
        const uri = document.uri;
        // Determine if this is a model file by checking extension or content
        result.isModelFile =
            uri.endsWith(".model.lkml") ||
                text.includes("connection:") ||
                text.includes("include:");
        // Extract model name from filename if this is a model file
        if (result.isModelFile) {
            const fileNameMatch = uri.match(/([^\/]+)\.model\.lkml$/);
            if (fileNameMatch) {
                result.modelName = fileNameMatch[1];
            }
            else {
                // If no match from filename, use a fallback name
                result.modelName = `model_${Math.random().toString(36).substring(2, 9)}`;
            }
        }
        // Create a model entry if this is a model file
        if (result.isModelFile && result.modelName) {
            const modelInfo = {
                name: result.modelName,
                location: node_1.Location.create(uri, node_1.Range.create(node_1.Position.create(0, 0), node_1.Position.create(0, 0))),
                includes: [],
                explores: [],
                properties: new Map(),
            };
            result.models.set(result.modelName, modelInfo);
            result.modelNames.push(result.modelName);
        }
        // Set up tracking for the current parsing state
        const blockStack = [];
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i].trim();
            // Skip empty lines and comments
            if (line === "" || line.startsWith("#")) {
                continue;
            }
            // Track top-level property assignments (for model files)
            const topLevelPropertyMatch = line.match(/^\s*([a-zA-Z0-9_]+):\s+(.+?)\s*(?:;;|$)/);
            if (result.isModelFile && topLevelPropertyMatch && blockStack.length === 0) {
                const propertyName = topLevelPropertyMatch[1];
                const propertyValue = topLevelPropertyMatch[2]
                    .replace(/;;$/, "")
                    .trim()
                    .replace(/^["']|["']$/g, "");
                // Create property location
                const location = node_1.Location.create(uri, node_1.Range.create(node_1.Position.create(i, 0), node_1.Position.create(i, lines[i].length)));
                const propertyInfo = {
                    name: propertyName,
                    value: propertyValue,
                    location: location,
                };
                // Add to the model
                const modelInfo = result.modelName ? result.models.get(result.modelName) : undefined;
                if (modelInfo) {
                    modelInfo.properties.set(propertyName, propertyInfo);
                    // Handle special properties
                    if (propertyName === "connection") {
                        modelInfo.connection = propertyValue;
                    }
                    else if (propertyName === "include") {
                        modelInfo.includes.push(propertyValue);
                    }
                    else if (propertyName === "explore") {
                        // Handle top-level explore declarations
                        modelInfo.explores.push(propertyValue);
                        // Create a basic explore entry
                        const exploreInfo = {
                            name: propertyValue,
                            location: location,
                            joins: new Map(),
                            properties: new Map(),
                        };
                        result.explores.set(propertyValue, exploreInfo);
                        result.exploreNames.push(propertyValue);
                    }
                }
                // Continue to next line since we've handled this property
                continue;
            }
            // Track block openings
            const blockMatch = line.match(/^\s*([a-zA-Z0-9_]+):\s+([a-zA-Z0-9_]+)\s*\{/);
            if (blockMatch) {
                const blockType = blockMatch[1];
                const blockName = blockMatch[2];
                const indentLevel = lines[i].length - lines[i].trimLeft().length;
                blockStack.push({
                    type: blockType,
                    name: blockName,
                    level: indentLevel,
                    startLine: i,
                });
                // Create location info
                const location = node_1.Location.create(uri, node_1.Range.create(node_1.Position.create(i, 0), node_1.Position.create(i, lines[i].length)));
                // Register different block types
                if (blockType === "view") {
                    const viewInfo = {
                        name: blockName,
                        location: location,
                        fields: new Map(),
                        properties: new Map(),
                    };
                    result.views.set(blockName, viewInfo);
                    result.viewNames.push(blockName);
                }
                else if (blockType === "explore") {
                    const exploreInfo = {
                        name: blockName,
                        location: location,
                        joins: new Map(),
                        properties: new Map(),
                    };
                    result.explores.set(blockName, exploreInfo);
                    result.exploreNames.push(blockName);
                }
                else if (blockType === "model") {
                    const modelInfo = {
                        name: blockName,
                        location: location,
                        includes: [],
                        explores: [],
                        properties: new Map(),
                    };
                    result.models.set(blockName, modelInfo);
                    result.modelNames.push(blockName);
                }
                else if (["dimension", "measure", "parameter", "filter"].includes(blockType)) {
                    // We're inside a view, add this field to the current view
                    if (blockStack.length >= 2) {
                        const parentBlock = blockStack[blockStack.length - 2];
                        if (parentBlock.type === "view") {
                            const viewInfo = result.views.get(parentBlock.name);
                            if (viewInfo) {
                                const fieldInfo = {
                                    name: blockName,
                                    type: blockType,
                                    location: location,
                                    properties: new Map(),
                                };
                                viewInfo.fields.set(blockName, fieldInfo);
                            }
                        }
                    }
                }
                else if (blockType === "join") {
                    // Add join to an explore
                    if (blockStack.length >= 2) {
                        const parentBlock = blockStack[blockStack.length - 2];
                        if (parentBlock.type === "explore") {
                            const exploreInfo = result.explores.get(parentBlock.name);
                            if (exploreInfo) {
                                const joinInfo = {
                                    name: blockName,
                                    location: location,
                                    properties: new Map(),
                                };
                                exploreInfo.joins.set(blockName, joinInfo);
                            }
                        }
                    }
                }
            }
            // Track property assignments inside blocks
            const propertyMatch = line.match(/^\s*([a-zA-Z0-9_]+):\s+(.+?)\s*(?:;;|$)/);
            if (propertyMatch && blockStack.length > 0) {
                const propertyName = propertyMatch[1];
                const propertyValue = propertyMatch[2].replace(/;;$/, "").trim();
                const location = node_1.Location.create(uri, node_1.Range.create(node_1.Position.create(i, 0), node_1.Position.create(i, lines[i].length)));
                const propertyInfo = {
                    name: propertyName,
                    value: propertyValue,
                    location: location,
                };
                // Add to the appropriate parent
                const currentBlock = blockStack[blockStack.length - 1];
                if (currentBlock.type === "view") {
                    const viewInfo = result.views.get(currentBlock.name);
                    if (viewInfo) {
                        viewInfo.properties.set(propertyName, propertyInfo);
                        // Handle special properties
                        if (propertyName === "extends") {
                            viewInfo.extends = propertyValue;
                        }
                    }
                }
                else if (currentBlock.type === "explore") {
                    const exploreInfo = result.explores.get(currentBlock.name);
                    if (exploreInfo) {
                        exploreInfo.properties.set(propertyName, propertyInfo);
                        // Handle special properties
                        if (propertyName === "view_name" || propertyName === "from") {
                            exploreInfo.viewName = propertyValue;
                        }
                    }
                }
                else if (currentBlock.type === "model") {
                    const modelInfo = result.models.get(currentBlock.name);
                    if (modelInfo) {
                        modelInfo.properties.set(propertyName, propertyInfo);
                        // Handle special properties
                        if (propertyName === "connection") {
                            modelInfo.connection = propertyValue;
                        }
                        else if (propertyName === "include") {
                            modelInfo.includes.push(propertyValue);
                        }
                    }
                }
                else if (["dimension", "measure", "parameter", "filter"].includes(currentBlock.type)) {
                    // Find parent view
                    for (let j = blockStack.length - 2; j >= 0; j--) {
                        if (blockStack[j].type === "view") {
                            const viewInfo = result.views.get(blockStack[j].name);
                            if (viewInfo) {
                                const fieldInfo = viewInfo.fields.get(currentBlock.name);
                                if (fieldInfo) {
                                    fieldInfo.properties.set(propertyName, propertyInfo);
                                }
                            }
                            break;
                        }
                    }
                }
                else if (currentBlock.type === "join") {
                    // Find parent explore
                    for (let j = blockStack.length - 2; j >= 0; j--) {
                        if (blockStack[j].type === "explore") {
                            const exploreInfo = result.explores.get(blockStack[j].name);
                            if (exploreInfo) {
                                const joinInfo = exploreInfo.joins.get(currentBlock.name);
                                if (joinInfo) {
                                    joinInfo.properties.set(propertyName, propertyInfo);
                                    // Handle special properties
                                    if (propertyName === "view_name" || propertyName === "from") {
                                        joinInfo.viewName = propertyValue;
                                    }
                                    else if (propertyName === "sql_on") {
                                        joinInfo.sqlOn = propertyValue;
                                    }
                                    else if (propertyName === "relationship") {
                                        joinInfo.relationship = propertyValue;
                                    }
                                }
                            }
                            break;
                        }
                    }
                }
            }
            // Track block closings
            if (line.match(/^\s*\}/)) {
                // Remove blocks that have ended
                const indentLevel = lines[i].length - lines[i].trimLeft().length;
                while (blockStack.length > 0 &&
                    blockStack[blockStack.length - 1].level >= indentLevel) {
                    blockStack.pop();
                }
            }
        }
    }
    /**
     * Enhance the parse result with lookml-parser information
     */
    enhanceWithLookMLParser(document, result) {
        return __awaiter(this, void 0, void 0, function* () {
            if (!this.tempFilesDir) {
                console.error('Temp directory not initialized');
                return;
            }
            try {
                const uri = document.uri;
                const content = document.getText();
                const fileUri = vscode_uri_1.URI.parse(uri);
                const fileName = path.basename(fileUri.fsPath);
                // Write document content to temp file for lookml-parser to read
                const tempFilePath = path.join(this.tempFilesDir, fileName);
                yield fs.writeFile(tempFilePath, content);
                // Parse the file using lookml-parser
                const parsedProject = yield (0, lookml_parser_1.parseFiles)({
                    source: tempFilePath,
                });
            }
            catch (error) {
                console.error(`Error using lookml-parser for ${document.uri}:`, error);
                // Continue with existing parser results if lookml-parser fails
            }
        });
    }
    /**
     * Generate diagnostics for a document using lookml-parser
     */
    getDiagnostics(document) {
        // This would use lookml-parser's validation capabilities
        // The actual implementation will depend on what lookml-parser provides
        const diagnostics = [];
        return diagnostics;
    }
    /**
     * Get completions for a position using lookml-parser knowledge
     */
    getCompletions(document, position) {
        // Implementation would use lookml-parser knowledge to provide smart completions
        const completions = [];
        // Example implementation - would be enhanced with lookml-parser knowledge
        return completions;
    }
    /**
     * Get hover info for a position using lookml-parser knowledge
     */
    getHoverInfo(document, position) {
        // Implementation would use lookml-parser knowledge to provide rich hover info
        // Example implementation - would be enhanced with lookml-parser knowledge
        return null;
    }
    /**
     * Clean up temporary files
     */
    cleanup() {
        return __awaiter(this, void 0, void 0, function* () {
            if (this.tempFilesDir) {
                try {
                    yield fs.rm(this.tempFilesDir, { recursive: true, force: true });
                }
                catch (error) {
                    console.error('Failed to clean up temp directory:', error);
                }
            }
        });
    }
}
exports.LookMLParser = LookMLParser;
