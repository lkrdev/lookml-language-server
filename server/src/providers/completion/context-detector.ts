import { TextDocument } from "vscode-languageserver-textdocument";
import {
  Position,
  TextDocumentPositionParams,
} from "vscode-languageserver/node";
import { WorkspaceModel } from "../../models/workspace";

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
    | "table_reference"
    | "dimension_reference";
  blockType?: string;
  propertyName?: string;
  viewName?: string;
  exploreName?: string;
  joinName?: string;
  linePrefix: string;
  lineSuffix: string;
  word?: string;
  inString?: boolean;
  dimensionName?: string;
}

export class ContextDetector {
  private workspaceModel: WorkspaceModel;

  constructor(workspaceModel: WorkspaceModel) {
    this.workspaceModel = workspaceModel;
  }

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
    const lineSuffix = line.substring(position.character);

    if (this.workspaceModel.isViewFile(document)) {
      const sqlFieldMatch = linePrefix.match(/.*sql:.*\$\{\s*([a-zA-Z0-9_]*)$/);
      if (sqlFieldMatch) {
        return {
          dimensionName: sqlFieldMatch[1],
          linePrefix,
          lineSuffix,
          type: "field_reference",
          viewName: this.getCurrentViewName(document, position),
        };
      }
    }
    // Check if we're at the beginning of a line (suggesting block types)
    if (linePrefix.trim() === "") {
      return { type: "empty", linePrefix, lineSuffix };
    }

    const sqlOnTableAfterEqual = linePrefix.match(/.*sql_on:.*=\s*\$\{\s*$/);
    if (sqlOnTableAfterEqual) {
      const joinContext = this.getJoinContext(document, position);
      return {
        exploreName: joinContext?.exploreName,
        joinName: joinContext?.joinName,
        linePrefix,
        lineSuffix,
        type: "table_reference",
      };
    }

    // Check if we're typing fields for a specific table after an equal sign
    const sqlOnFieldAfterEqual = linePrefix.match(
      /.*sql_on:.*=\s*\$\{([a-zA-Z0-9_]+)\.\s*$/
    );

    if (sqlOnFieldAfterEqual) {
      const joinContext = this.getJoinContext(document, position);
      return {
        blockType: this.getCurrentBlockType(document, position),
        joinName: joinContext?.joinName,
        linePrefix,
        lineSuffix,
        type: "field_reference",
        viewName: sqlOnFieldAfterEqual[1], // The table name captured from regex
      };
    }

    const sqlOnTableStart = linePrefix.match(/.*sql_on:\s*\$\{\s*$/);
    if (sqlOnTableStart) {
      const joinContext = this.getJoinContext(document, position);
      return {
        exploreName: joinContext?.exploreName,
        joinName: joinContext?.joinName,
        linePrefix,
        lineSuffix,
        type: "table_reference",
      };
    }

    // Check if we're typing fields for a specific table in sql_on
    const sqlOnTableField = linePrefix.match(
      /.*sql_on:.*\$\{([a-zA-Z0-9_]+)\.\s*$/
    );

    if (sqlOnTableField) {
      return {
        blockType: this.getCurrentBlockType(document, position),
        linePrefix,
        lineSuffix,
        type: "field_reference",
        viewName: sqlOnTableField[1], // The table name captured from regex
      };
    }    

    // Check if we're providing a value to the "type:" property
    if (linePrefix.match(/^\s+type:\s*$/)) {
      return {
        blockType: this.getCurrentBlockType(document, position),
        linePrefix,
        lineSuffix,
        type: "type",
      };
    }

     // Check if we're in a relationship context
     if (linePrefix.match(/.*relationship:\s*$/)) {
      return {
        blockType: this.getCurrentBlockType(document, position),
        linePrefix,
        lineSuffix,
        propertyName: "relationship",
        type: "value",
      };
    }

    // Check if we're inside a block and providing a property
    const propertyColonMatch = linePrefix.match(/^\s+([a-zA-Z0-9_]+):$/);
    if (propertyColonMatch) {
      return {
        blockType: this.getCurrentBlockType(document, position),
        linePrefix,
        lineSuffix,
        propertyName: propertyColonMatch[1],
        type: "value",
      };
    }

    // Check if we're declaring a new block
    const blockDeclaration = linePrefix.match(/^\s*([a-zA-Z0-9_]+):\s*$/);
    if (blockDeclaration) {
      return {
        blockType: blockDeclaration[1],
        linePrefix,
        lineSuffix,
        type: "block",
      };
    }

    // Check if we're in SQL context
    if (linePrefix.match(/.*sql:\s*$/)) {
      return {
        linePrefix,
        lineSuffix,
        type: "sql",
        viewName: this.getCurrentViewName(document, position),
      };
    }

    // Check if we're in SQL_ON context
    if (linePrefix.match(/.*sql_on:\s*$/)) {
      const joinContext = this.getJoinContext(document, position);
      return {
        exploreName: joinContext?.exploreName,
        joinName: joinContext?.joinName,
        linePrefix,
        lineSuffix,
        type: "sql_on",
        viewName: joinContext?.viewName,
      };
    }

    const valueMatch = linePrefix.match(/^\s+([a-zA-Z0-9_]+):\s+(.*)$/);
    if (valueMatch) {
      const inString = this.isInString(linePrefix);
      return {
        blockType: this.getCurrentBlockType(document, position),
        inString,
        linePrefix,
        lineSuffix,
        propertyName: valueMatch[1],
        type: "value",
      };
    }     

    // Default context
    return {
      blockType: this.getCurrentBlockType(document, position),
      linePrefix, 
      lineSuffix,
      type: "empty",
      viewName: this.getCurrentViewName(document, position),
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

    // Scan backwards from current line to find the block type
    for (let i = position.line; i >= 0; i--) {
      const line = lines[i].trim();
      
      // Look for block start
      const blockMatch = line.match(/^([a-zA-Z0-9_]+):\s+[a-zA-Z0-9_]+\s*\{/);
      if (blockMatch) {
        return blockMatch[1];
      }
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

    // Scan backwards from current line
    for (let i = position.line; i >= 0; i--) {
      const line = lines[i].trim();
      
      // Look for view definition
      const viewMatch = line.match(/^view:\s+([a-zA-Z0-9_]+)\s*\{/);
      if (viewMatch) {
        return viewMatch[1];
      }
    }

    return undefined;
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
    let exploreName: string | undefined;
    let joinName: string | undefined;
    let viewName: string | undefined;

    // Scan backwards to find join and explore
    for (let i = position.line; i >= 0; i--) {
      const line = lines[i].trim();

      // Look for join definition
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

      // Look for explore definition
      const exploreMatch = line.match(/^explore:\s+([a-zA-Z0-9_]+)\s*\{/);
      if (exploreMatch) {
        exploreName = exploreMatch[1];
        break;
      }
    }

    if (exploreName && joinName && viewName) {
      return { exploreName, joinName, viewName };
    }

    return undefined;
  }
}
 