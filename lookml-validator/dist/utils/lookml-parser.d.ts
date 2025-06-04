import { Range } from "vscode-languageserver-types";
/**
 * Utility function to parse multi-line property values that use array or block syntax
 * @param lines All lines of the document
 * @param startLine The line number where the property starts
 * @param propertyName The name of the property being parsed
 * @param openChar Opening character ('[' for arrays, '{' for blocks)
 * @param closeChar Closing character (']' for arrays, '}' for blocks)
 * @returns Object containing the parsed content and line information
 */
export declare function parseMultiLineProperty(lines: string[], startLine: number, propertyName: string, openChar?: string, closeChar?: string): {
    content: string[];
    startLineNumber: number;
    endLineNumber: number;
    isMultiLine: boolean;
};
/**
 * Find the line and character position of a field in a range of lines
 */
export declare function findFieldPosition(lines: string[], startLine: number, endLine: number, field: string): {
    line: number;
    character: number;
} | null;
/**
 * Get a range for a specific word in a line
 */
export declare function getWordRange(line: string, lineNumber: number, word: string): Range;
