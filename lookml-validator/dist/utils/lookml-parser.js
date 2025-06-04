"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.parseMultiLineProperty = parseMultiLineProperty;
exports.findFieldPosition = findFieldPosition;
exports.getWordRange = getWordRange;
const vscode_languageserver_types_1 = require("vscode-languageserver-types");
/**
 * Utility function to parse multi-line property values that use array or block syntax
 * @param lines All lines of the document
 * @param startLine The line number where the property starts
 * @param propertyName The name of the property being parsed
 * @param openChar Opening character ('[' for arrays, '{' for blocks)
 * @param closeChar Closing character (']' for arrays, '}' for blocks)
 * @returns Object containing the parsed content and line information
 */
function parseMultiLineProperty(lines, startLine, propertyName, openChar = '[', closeChar = ']') {
    const firstLine = lines[startLine].trim();
    const propertyMatch = firstLine.match(new RegExp(`^\\s*${propertyName}:\\s*\\${openChar}(.*)$`));
    if (!propertyMatch) {
        return {
            content: [],
            startLineNumber: startLine,
            endLineNumber: startLine,
            isMultiLine: false
        };
    }
    let arrayContent = propertyMatch[1];
    let foundClosingChar = arrayContent.includes(closeChar);
    let currentLine = startLine;
    let content = [];
    // If it's a single line property
    if (foundClosingChar) {
        arrayContent = arrayContent.substring(0, arrayContent.indexOf(closeChar));
        content = arrayContent.split(",").map(f => f.trim()).filter(f => f);
        return {
            content,
            startLineNumber: startLine,
            endLineNumber: startLine,
            isMultiLine: false
        };
    }
    // Handle multi-line property
    while (currentLine < lines.length && !foundClosingChar) {
        if (currentLine > startLine) {
            const nextLine = lines[currentLine].trim();
            if (nextLine.includes(closeChar)) {
                arrayContent = nextLine.substring(0, nextLine.indexOf(closeChar));
                foundClosingChar = true;
            }
            else {
                arrayContent = nextLine;
            }
        }
        if (arrayContent) {
            const lineContent = arrayContent.split(",").map(f => f.trim()).filter(f => f);
            content.push(...lineContent);
        }
        currentLine++;
    }
    return {
        content,
        startLineNumber: startLine,
        endLineNumber: currentLine - 1,
        isMultiLine: true
    };
}
/**
 * Find the line and character position of a field in a range of lines
 */
function findFieldPosition(lines, startLine, endLine, field) {
    for (let searchLine = startLine; searchLine <= endLine; searchLine++) {
        const lineContent = lines[searchLine];
        const fieldPos = lineContent.indexOf(field);
        if (fieldPos !== -1) {
            return { line: searchLine, character: fieldPos };
        }
    }
    return null;
}
/**
 * Get a range for a specific word in a line
 */
function getWordRange(line, lineNumber, word) {
    const start = line.indexOf(word);
    if (start === -1) {
        // Fallback if we can't find the word
        return vscode_languageserver_types_1.Range.create(vscode_languageserver_types_1.Position.create(lineNumber, 0), vscode_languageserver_types_1.Position.create(lineNumber, line.length));
    }
    return vscode_languageserver_types_1.Range.create(vscode_languageserver_types_1.Position.create(lineNumber, start), vscode_languageserver_types_1.Position.create(lineNumber, start + word.length));
}
