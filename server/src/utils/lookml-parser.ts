import { Position, Range } from "vscode-languageserver/node";

/**
 * Utility function to parse multi-line property values that use array or block syntax
 * @param lines All lines of the document
 * @param startLine The line number where the property starts
 * @param propertyName The name of the property being parsed
 * @param openChar Opening character ('[' for arrays, '{' for blocks)
 * @param closeChar Closing character (']' for arrays, '}' for blocks)
 * @returns Object containing the parsed content and line information
 */
export function parseMultiLineProperty(
  lines: string[],
  startLine: number,
  propertyName: string,
  openChar: string = '[',
  closeChar: string = ']'
): {
  content: string[];
  startLineNumber: number;
  endLineNumber: number;
  isMultiLine: boolean;
} {
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
  let content: string[] = [];

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
      } else {
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
export function findFieldPosition(
  lines: string[],
  startLine: number,
  endLine: number,
  field: string
): { line: number; character: number } | null {
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
export function getWordRange(line: string, lineNumber: number, word: string): Range {
  const start = line.indexOf(word);
  if (start === -1) {
    // Fallback if we can't find the word
    return Range.create(
      Position.create(lineNumber, 0),
      Position.create(lineNumber, line.length)
    );
  }

  return Range.create(
    Position.create(lineNumber, start),
    Position.create(lineNumber, start + word.length)
  );
} 