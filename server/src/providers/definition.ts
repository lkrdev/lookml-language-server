import {
    Definition,
    Position,
    Range,
    TextDocument
} from 'vscode-languageserver/node';
import { WorkspaceModel } from '../models/workspace';


export class DefinitionProvider {
    private workspaceModel: WorkspaceModel;

    constructor(workspaceModel: WorkspaceModel) {
        this.workspaceModel = workspaceModel;
    }

    private getWordAtPosition(document: TextDocument, position: Position): string | undefined {
        const text = document.getText();
        const lines = text.split("\n");

        if (position.line >= lines.length) {
            return;
        }

        const line = lines[position.line];
        const character = position.character;

        // Find word boundaries
        let start = character;
        let end = character;

        // Find end position first
        while (end < line.length) {
            const char = line.charAt(end);
            if (!/[a-zA-Z0-9_]/.test(char)) {
                break;
            }
            end++;
        }

        // Find start position
        while (start > 0) {
            const char = line.charAt(start - 1);
            if (!/[a-zA-Z0-9_]/.test(char)) {
                // If we hit a dot, continue to include the word before it
                if (char === '.') {
                    let dotStart = start - 1;
                    // Look for the start of the word before the dot
                    while (dotStart > 0) {
                        const prevChar = line.charAt(dotStart - 1);
                        if (!/[a-zA-Z0-9_]/.test(prevChar)) {
                            break;
                        }
                        dotStart--;
                    }
                    start = dotStart;
                }
                break;
            }
            start--;
        }

        // No word found
        if (start === end) {
            return undefined;
        }

        return line.substring(start, end);
    }

    private isBetweenBrackets(line: string, word: string, lines: string[], currentLineNum: number): boolean {
        // Check for ${...} pattern (SQL context)
        const braceRegex = /\${([^}]+)}/g;
        let match;
        while ((match = braceRegex.exec(line)) !== null) {
            if (match[1].trim() === word) {
                return true;
            }
        }

        // Check for [...] pattern (array context)
        const bracketRegex = /\[([^\]]+)\]/g;
        while ((match = bracketRegex.exec(line)) !== null) {
            const content = match[1].trim();
            // Split by commas and trim each item
            const items = content.split(',').map(item => item.trim());
            if (items.includes(word)) {
                return true;
            }
        }

        // Check for multi-line bracket context
        let bracketCount = 0;
        let foundOpeningBracket = false;
        
        // Search backwards from current line to find opening bracket
        for (let i = currentLineNum; i >= 0; i--) {
            const currentLine = lines[i];
            
            // Count closing brackets we pass
            const closingBrackets = (currentLine.match(/\]/g) || []).length;
            bracketCount -= closingBrackets;
            
            // Count opening brackets
            const openingBrackets = (currentLine.match(/\[/g) || []).length;
            bracketCount += openingBrackets;
            
            // If we find an opening bracket and it's not closed yet
            if (openingBrackets > 0 && bracketCount > 0) {
                foundOpeningBracket = true;
                break;
            }
            
            // If we hit a closing bracket that's not matched, we're not in a bracket context
            if (bracketCount < 0) {
                return false;
            }
        }

        // If we found an opening bracket, check if the word exists in the multi-line content
        if (foundOpeningBracket) {
            // Search forward from the opening bracket to find the word
            for (let i = currentLineNum; i < lines.length; i++) {
                const currentLine = lines[i];
                // Split by commas and trim each item
                const items = currentLine.split(',').map(item => item.trim());
                if (items.some(item => item === word)) {
                    return true;
                }
                // If we hit a closing bracket, stop searching
                if (currentLine.includes(']')) {
                    break;
                }
            }
        }

        return false;
    }

    /**
     * Provide definition locations for LookML elements
     */
    public getDefinition(
        document: TextDocument,
        position: Position
    ): Definition | undefined {
        const word = this.getWordAtPosition(document, position);
        if (!word) return;

        const text = document.getText();
        const lines = text.split("\n");
        const line = lines[position.line];

        const isBetweenBrackets = this.isBetweenBrackets(line, word, lines, position.line);

        // If the word contains a dot and we're in a valid context, it's a field reference
        if (isBetweenBrackets && word.includes('.')) {
            const [viewName, fieldName] = word.split('.');
            const viewDetails = this.workspaceModel.getView(viewName);

            if (viewDetails) {
                const fieldPosition = viewDetails?.positions?.dimension?.[fieldName]?.$name?.$p ||
                    viewDetails?.positions?.measure?.[fieldName]?.$name?.$p ||
                    viewDetails?.positions?.dimension_group?.[fieldName]?.$name?.$p;

                if (fieldPosition) {
                    return {
                        uri: viewDetails.uri,
                        range: {
                            start: {
                                line: fieldPosition[0],
                                character: fieldPosition[1]
                            },
                            end: {
                                line: fieldPosition[2],
                                character: fieldPosition[3]
                            }
                        }
                    };
                }
            }
            return;
        }

        // If not a dotted reference, check if it's a view reference
        const viewDetails = this.workspaceModel.getView(word);
        if (!viewDetails?.positions?.$name?.$p) return;

        // For view references in model files, verify the view is included
        if (this.workspaceModel.isModelFile(document)) {
            const modelName = this.workspaceModel.getModelNameFromUri(document.uri);
            if (!modelName) return;

            const includedViewsForModel = this.workspaceModel.getIncludedViewsForModel(modelName);
            if (!includedViewsForModel?.has(word || '')) return;
        }

        const viewNamePosition = viewDetails.positions.$name.$p;
        return {
            uri: viewDetails.uri,
            range: {
                start: {
                    line: viewNamePosition[0],
                    character: viewNamePosition[1]
                },
                end: {
                    line: viewNamePosition[2],
                    character: viewNamePosition[3]
                }
            }
        };
    }
}