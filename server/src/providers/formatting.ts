import {
  TextDocument,
  TextEdit,
  Range,
  Position,
  FormattingOptions,
} from "vscode-languageserver/node";

export class FormattingProvider {
  /**
   * Format a document according to specified options
   */
  public formatDocument(
    document: TextDocument,
    options: FormattingOptions
  ): TextEdit[] {
    const text = document.getText();
    const lines = text.split("\n");
    const edits: TextEdit[] = [];

    // Format settings
    const tabSize = options.tabSize || 2;
    const insertSpaces = options.insertSpaces !== false;
    const indentStr = insertSpaces ? " ".repeat(tabSize) : "\t";

    // Track current indentation level
    let indentLevel = 0;

    // Process each line
    for (let i = 0; i < lines.length; i++) {
      const originalLine = lines[i];
      const trimmedLine = originalLine.trim();

      // Skip empty lines and comments
      if (trimmedLine === "" || trimmedLine.startsWith("#")) {
        edits.push(
          TextEdit.replace(
            this.createRange(i, 0, i, originalLine.length),
            trimmedLine
          )
        );
        continue;
      }

      // Handle closing braces - decrease indent before the line
      if (trimmedLine === "}") {
        indentLevel = Math.max(0, indentLevel - 1);
      }

      // Create formatted line with correct indentation
      const formattedLine = indentStr.repeat(indentLevel) + trimmedLine;

      // Only create an edit if the line actually changed
      if (formattedLine !== originalLine) {
        edits.push(
          TextEdit.replace(
            this.createRange(i, 0, i, originalLine.length),
            formattedLine
          )
        );
      }

      // Handle opening braces - increase indent after the line
      if (trimmedLine.endsWith("{")) {
        indentLevel++;
      }
    }

    return edits;
  }

  /**
   * Format a specific range within a document
   */
  public formatRange(
    document: TextDocument,
    range: Range,
    options: FormattingOptions
  ): TextEdit[] {
    // Get the relevant line range
    const text = document.getText();
    const lines = text.split("\n");
    const startLine = range.start.line;
    const endLine = range.end.line;

    // Format settings
    const tabSize = options.tabSize || 2;
    const insertSpaces = options.insertSpaces !== false;
    const indentStr = insertSpaces ? " ".repeat(tabSize) : "\t";

    // Determine the initial indent level by analyzing prior lines
    let indentLevel = 0;
    for (let i = 0; i < startLine; i++) {
      const line = lines[i].trim();
      if (line.endsWith("{")) {
        indentLevel++;
      } else if (line === "}") {
        indentLevel = Math.max(0, indentLevel - 1);
      }
    }

    // Format the selected lines
    const edits: TextEdit[] = [];

    for (let i = startLine; i <= endLine; i++) {
      const originalLine = lines[i];
      const trimmedLine = originalLine.trim();

      // Skip empty lines and comments
      if (trimmedLine === "" || trimmedLine.startsWith("#")) {
        edits.push(
          TextEdit.replace(
            this.createRange(i, 0, i, originalLine.length),
            trimmedLine
          )
        );
        continue;
      }

      // Handle closing braces - decrease indent before the line
      if (trimmedLine === "}") {
        indentLevel = Math.max(0, indentLevel - 1);
      }

      // Create formatted line with correct indentation
      const formattedLine = indentStr.repeat(indentLevel) + trimmedLine;

      // Only create an edit if the line actually changed
      if (formattedLine !== originalLine) {
        edits.push(
          TextEdit.replace(
            this.createRange(i, 0, i, originalLine.length),
            formattedLine
          )
        );
      }

      // Handle opening braces - increase indent after the line
      if (trimmedLine.endsWith("{")) {
        indentLevel++;
      }
    }

    return edits;
  }

  /**
   * Format on-type (usually just handles automatic indentation)
   */
  public formatOnType(
    document: TextDocument,
    position: Position,
    ch: string,
    options: FormattingOptions
  ): TextEdit[] {
    // Only format after typing special characters
    if (ch !== "{" && ch !== "}" && ch !== "\n") {
      return [];
    }

    const text = document.getText();
    const lines = text.split("\n");
    const edits: TextEdit[] = [];

    // Format settings
    const tabSize = options.tabSize || 2;
    const insertSpaces = options.insertSpaces !== false;
    const indentStr = insertSpaces ? " ".repeat(tabSize) : "\t";

    // Handle newline - auto-indent the next line
    if (ch === "\n") {
      // Get the current line (after the newline)
      const currentLine = lines[position.line];
      const trimmedCurrentLine = currentLine.trim();

      // Get the previous line (before the newline)
      const previousLine = lines[position.line - 1];
      const trimmedPrevLine = previousLine.trim();

      // Calculate the indent level
      let indentLevel = this.getIndentLevel(previousLine, tabSize);

      // If the previous line ends with a brace, increase indentation
      if (trimmedPrevLine.endsWith("{")) {
        indentLevel++;
      }

      // If the current line is a closing brace, decrease indentation
      if (trimmedCurrentLine === "}") {
        indentLevel = Math.max(0, indentLevel - 1);
      }

      // Create the formatted line
      const formattedLine = indentStr.repeat(indentLevel) + trimmedCurrentLine;

      // Only create an edit if the line actually changed
      if (formattedLine !== currentLine) {
        edits.push(
          TextEdit.replace(
            this.createRange(
              position.line,
              0,
              position.line,
              currentLine.length
            ),
            formattedLine
          )
        );
      }
    }

    // Handle typing a closing brace - auto-correct indentation
    if (ch === "}") {
      const currentLine = lines[position.line];
      const trimmedCurrentLine = currentLine.trim();

      // If the line is just a closing brace, adjust its indentation
      if (trimmedCurrentLine === "}") {
        // Find matching opening brace to determine correct indentation
        let openBraces = 0;
        let matchingIndentLevel = 0;

        for (let i = position.line - 1; i >= 0; i--) {
          const line = lines[i].trim();

          if (line.endsWith("{")) {
            if (openBraces === 0) {
              // Found the matching opening brace
              matchingIndentLevel = this.getIndentLevel(lines[i], tabSize);
              break;
            }
            openBraces--;
          } else if (line === "}") {
            openBraces++;
          }
        }

        // Create the formatted line
        const formattedLine =
          indentStr.repeat(matchingIndentLevel) + trimmedCurrentLine;

        // Only create an edit if the line actually changed
        if (formattedLine !== currentLine) {
          edits.push(
            TextEdit.replace(
              this.createRange(
                position.line,
                0,
                position.line,
                currentLine.length
              ),
              formattedLine
            )
          );
        }
      }
    }

    return edits;
  }

  /**
   * Helper method to create a Range
   */
  private createRange(
    startLine: number,
    startChar: number,
    endLine: number,
    endChar: number
  ): Range {
    return Range.create(
      Position.create(startLine, startChar),
      Position.create(endLine, endChar)
    );
  }

  /**
   * Calculate indent level based on the indentation of a line
   */
  private getIndentLevel(line: string, tabSize: number): number {
    const leadingSpaces = line.length - line.trimLeft().length;

    // If using tabs
    if (line.startsWith("\t")) {
      return leadingSpaces; // Each tab is one indent level
    }

    // If using spaces
    return Math.floor(leadingSpaces / tabSize);
  }

  /**
   * Enhanced formatter that also aligns common LookML patterns
   */
  public enhancedFormatting(
    document: TextDocument,
    options: FormattingOptions
  ): TextEdit[] {
    // Start with basic formatting
    const basicEdits = this.formatDocument(document, options);

    // Apply enhanced formatting rules
    const text = document.getText();
    const lines = text.split("\n");
    const enhancedEdits: TextEdit[] = [];

    // Format settings
    const tabSize = options.tabSize || 2;
    const insertSpaces = options.insertSpaces !== false;
    const indentStr = insertSpaces ? " ".repeat(tabSize) : "\t";

    // Find blocks of property assignments to align
    let blockStart = -1;
    let blockEnd = -1;
    const propertyBlocks: { start: number; end: number }[] = [];

    for (let i = 0; i < lines.length; i++) {
      const trimmedLine = lines[i].trim();

      // Detect property assignments (name: value)
      const propertyMatch = trimmedLine.match(/^[a-zA-Z0-9_]+:\s+.+/);

      if (propertyMatch) {
        // Start a new block or extend the current one
        if (blockStart === -1) {
          blockStart = i;
        }
        blockEnd = i;
      } else if (
        blockStart !== -1 &&
        (trimmedLine === "" || trimmedLine === "}" || trimmedLine.endsWith("{"))
      ) {
        // End the current block if we hit a blank line, closing brace, or opening brace
        if (blockEnd - blockStart >= 2) {
          // Only consider blocks with at least 3 properties
          propertyBlocks.push({ start: blockStart, end: blockEnd });
        }
        blockStart = -1;
        blockEnd = -1;
      }
    }

    // Process each block to align the colons
    for (const block of propertyBlocks) {
      // Find the longest property name
      let maxNameLength = 0;

      for (let i = block.start; i <= block.end; i++) {
        const trimmedLine = lines[i].trim();
        const colonIndex = trimmedLine.indexOf(":");

        if (colonIndex > maxNameLength) {
          maxNameLength = colonIndex;
        }
      }

      // Format each line in the block
      for (let i = block.start; i <= block.end; i++) {
        const originalLine = lines[i];
        const trimmedLine = originalLine.trim();
        const indentLevel = this.getIndentLevel(originalLine, tabSize);

        // Split into name and value parts
        const colonIndex = trimmedLine.indexOf(":");
        const name = trimmedLine.substring(0, colonIndex);
        const value = trimmedLine.substring(colonIndex + 1).trimLeft();

        // Format with aligned colons
        const padding = " ".repeat(maxNameLength - colonIndex);
        const formattedLine =
          indentStr.repeat(indentLevel) + name + padding + ": " + value;

        if (formattedLine !== originalLine) {
          enhancedEdits.push(
            TextEdit.replace(
              this.createRange(i, 0, i, originalLine.length),
              formattedLine
            )
          );
        }
      }
    }

    // Combine basic edits with enhanced edits, giving priority to enhanced edits
    const lineToEdit = new Map<number, TextEdit>();

    // First add basic edits
    for (const edit of basicEdits) {
      const line = edit.range.start.line;
      lineToEdit.set(line, edit);
    }

    // Then override with enhanced edits
    for (const edit of enhancedEdits) {
      const line = edit.range.start.line;
      lineToEdit.set(line, edit);
    }

    return Array.from(lineToEdit.values());
  }
}
