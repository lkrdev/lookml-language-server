import { TextDocument } from "vscode-languageserver-textdocument";
import {
  Position,
  TextDocumentPositionParams,
} from "vscode-languageserver/node";

export interface CompletionContext {
  type:
    | "empty"
    | "block"
    | "property"
    | "sql"
    | "sql_on"
    | "type"
    | "value"
    | "field_reference"
    | "table_reference";
  blockType?: string;
  propertyName?: string;
  viewName?: string;
  exploreName?: string;
  joinName?: string;
  linePrefix?: string;
  word?: string;
  inString?: boolean;
}

export class ContextDetector {
  /**
   * Analyze document to determine completion context
   */
  public getContext(
    document: TextDocument,
    params: TextDocumentPositionParams
  ): CompletionContext {
    const position = params.position;
    const text = document.getText();
    const lines = text.split("\n");
    const line = lines[position.line];
    const linePrefix = line.substring(0, position.character);

    // Check if we're at the beginning of a line (suggesting block types)
    if (linePrefix.trim() === "") {
      return { type: "empty", linePrefix };
    }

    const sqlOnTableAfterEqual = linePrefix.match(/.*sql_on:.*=\s*\$\{\s*$/);
    if (sqlOnTableAfterEqual) {
      const joinContext = this.getJoinContext(document, position);
      return {
        type: "table_reference",
        exploreName: joinContext?.exploreName,
        joinName: joinContext?.joinName,
        linePrefix,
      };
    }

    // Check if we're typing fields for a specific table after an equal sign
    const sqlOnFieldAfterEqual = linePrefix.match(
      /.*sql_on:.*=\s*\$\{([a-zA-Z0-9_]+)\.\s*$/
    );
    if (sqlOnFieldAfterEqual) {
      const joinContext = this.getJoinContext(document, position);
      return {
        type: "field_reference",
        joinName: joinContext?.joinName,
        viewName: sqlOnFieldAfterEqual[1], // The table name captured from regex
        blockType: this.getCurrentBlockType(document, position),
        linePrefix,
      };
    }

    const sqlOnTableStart = linePrefix.match(/.*sql_on:\s*\$\{\s*$/);
    if (sqlOnTableStart) {
      const joinContext = this.getJoinContext(document, position);
      return {
        type: "table_reference",
        exploreName: joinContext?.exploreName,
        joinName: joinContext?.joinName,
        linePrefix,
      };
    }

    // Check if we're typing fields for a specific table in sql_on
    const sqlOnTableField = linePrefix.match(
      /.*sql_on:.*\$\{([a-zA-Z0-9_]+)\.\s*$/
    );
    if (sqlOnTableField) {
      return {
        type: "field_reference",
        viewName: sqlOnTableField[1], // The table name captured from regex
        blockType: this.getCurrentBlockType(document, position),
        linePrefix,
      };
    }

    // Check if we're providing a value to a property
    const valueMatch = linePrefix.match(/^\s+([a-zA-Z0-9_]+):\s+(.*)$/);
    if (valueMatch) {
      const inString = this.isInString(linePrefix);
      return {
        type: "value",
        propertyName: valueMatch[1],
        blockType: this.getCurrentBlockType(document, position),
        inString,
        linePrefix,
      };
    }

    // Check if we're inside a block and providing a property
    const propertyColonMatch = linePrefix.match(/^\s+([a-zA-Z0-9_]+):$/);
    if (propertyColonMatch) {
      return {
        type: "value",
        propertyName: propertyColonMatch[1],
        blockType: this.getCurrentBlockType(document, position),
        linePrefix,
      };
    }

    // Check if we're declaring a new block
    const blockDeclaration = linePrefix.match(/^\s*([a-zA-Z0-9_]+):\s*$/);
    if (blockDeclaration) {
      return {
        type: "block",
        blockType: blockDeclaration[1],
        linePrefix,
      };
    }

    // Check if we're in SQL context
    if (linePrefix.match(/.*sql:\s*$/)) {
      return {
        type: "sql",
        viewName: this.getCurrentViewName(document, position),
        linePrefix,
      };
    }

    // Check if we're in SQL_ON context
    if (linePrefix.match(/.*sql_on:\s*$/)) {
      const joinContext = this.getJoinContext(document, position);
      return {
        type: "sql_on",
        exploreName: joinContext?.exploreName,
        joinName: joinContext?.joinName,
        viewName: joinContext?.viewName,
        linePrefix,
      };
    }

    // Check if we're providing a value to the "type:" property
    if (linePrefix.match(/^\s+type:\s*$/)) {
      return {
        type: "type",
        blockType: this.getCurrentBlockType(document, position),
        linePrefix,
      };
    }

    // Default context
    return {
      type: "empty",
      blockType: this.getCurrentBlockType(document, position),
      viewName: this.getCurrentViewName(document, position),
      linePrefix,
    };
  }

  /**
   * Determine if we're inside a string
   */
  private isInString(linePrefix: string): boolean {
    let inSingleQuote = false;
    let inDoubleQuote = false;

    for (let i = 0; i < linePrefix.length; i++) {
      const char = linePrefix[i];

      if (char === '"' && !inSingleQuote) {
        inDoubleQuote = !inDoubleQuote;
      } else if (char === "'" && !inDoubleQuote) {
        inSingleQuote = !inSingleQuote;
      }
    }

    return inSingleQuote || inDoubleQuote;
  }

  /**
   * Determine the current block type by scanning backwards
   */
  private getCurrentBlockType(
    document: TextDocument,
    position: Position
  ): string | undefined {
    const text = document.getText();
    const lines = text.split("\n");
    let bracketLevel = 0;

    // Scan backwards from current line to find the block type
    for (let i = position.line; i >= 0; i--) {
      const line = lines[i].trim();

      // Count closing brackets
      const closeBrackets = (line.match(/}/g) || []).length;
      bracketLevel -= closeBrackets;

      // Check for block start (if we're not inside a nested block)
      if (bracketLevel <= 0) {
        const blockMatch = line.match(/^([a-zA-Z0-9_]+):\s+[a-zA-Z0-9_]+\s*\{/);
        if (blockMatch) {
          bracketLevel++; // We found an opening bracket
          return blockMatch[1];
        }
      }

      // Count opening brackets
      const openBrackets = (line.match(/{/g) || []).length;
      bracketLevel += openBrackets;

      // If we've gone too far back
      if (bracketLevel < 0) break;
    }

    return undefined;
  }

  /**
   * Get the current view name by finding the view block containing the position
   */
  private getCurrentViewName(
    document: TextDocument,
    position: Position
  ): string | undefined {
    const text = document.getText();
    const lines = text.split("\n");
    let bracketLevel = 0;
    let viewName: string | undefined = undefined;

    // Scan backwards from current line
    for (let i = position.line; i >= 0; i--) {
      const line = lines[i].trim();

      // Count closing brackets
      const closeBrackets = (line.match(/}/g) || []).length;
      bracketLevel -= closeBrackets;

      // Look for view definition
      if (bracketLevel <= 0) {
        const viewMatch = line.match(/^view:\s+([a-zA-Z0-9_]+)\s*\{/);
        if (viewMatch) {
          viewName = viewMatch[1];
          break;
        }
      }

      // Count opening brackets
      const openBrackets = (line.match(/{/g) || []).length;
      bracketLevel += openBrackets;

      // If we've gone too far back
      if (bracketLevel < 0) break;
    }

    return viewName;
  }

  /**
   * Get join context for SQL_ON completions
   */
  private getJoinContext(
    document: TextDocument,
    position: Position
  ): { exploreName: string; joinName: string; viewName: string } | undefined {
    const text = document.getText();
    const lines = text.split("\n");
    let bracketLevel = 0;
    let exploreName: string | undefined;
    let joinName: string | undefined;
    let viewName: string | undefined;

    // Scan backwards to find join and explore
    for (let i = position.line; i >= 0; i--) {
      const line = lines[i].trim();

      // Count closing brackets
      const closeBrackets = (line.match(/}/g) || []).length;
      bracketLevel -= closeBrackets;

      // Look for join definition
      if (bracketLevel === 1) {
        const joinMatch = line.match(/^join:\s+([a-zA-Z0-9_]+)\s*\{/);
        if (joinMatch && !joinName) {
          joinName = joinMatch[1];
          viewName = joinName; // Typically join name is the view name
          continue;
        }

        // Check for view_name property
        const viewNameMatch = line.match(/^view_name:\s+([a-zA-Z0-9_]+)/);
        if (viewNameMatch && joinName && !viewName) {
          viewName = viewNameMatch[1];
          continue;
        }
      }

      // Look for explore definition
      if (bracketLevel === 0) {
        const exploreMatch = line.match(/^explore:\s+([a-zA-Z0-9_]+)\s*\{/);
        if (exploreMatch) {
          exploreName = exploreMatch[1];
          break;
        }
      }

      // Count opening brackets
      const openBrackets = (line.match(/{/g) || []).length;
      bracketLevel += openBrackets;

      // If we've gone too far back
      if (bracketLevel < 0) break;
    }

    if (exploreName && joinName && viewName) {
      return { exploreName, joinName, viewName };
    }

    return undefined;
  }
}
