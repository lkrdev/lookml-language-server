import { TextDocument } from "vscode-languageserver-textdocument";
import {
  FormattingOptions,
  Position,
  Range,
  TextEdit,
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
    const text = document.getText();
    const lines = text.split("\n");
    const enhancedEdits: TextEdit[] = [];

    // Format settings
    const tabSize = options.tabSize || 2;
    const insertSpaces = options.insertSpaces !== false;
    const indentStr = insertSpaces ? " ".repeat(tabSize) : "\t";

    // Process each line
    for (let i = 0; i < lines.length; i++) {
      const originalLine = lines[i];
      const trimmedLine = originalLine.trim();
      const indentLevel = this.getIndentLevel(originalLine, tabSize);

      // Skip empty lines and comments
      if (trimmedLine === "" || trimmedLine.startsWith("#")) {
        continue;
      }

      // Handle array formatting
      if (trimmedLine.includes("[")) {
        const arrayStartIndex = trimmedLine.indexOf("[");
        const arrayEndIndex = trimmedLine.indexOf("]");
        
        if (arrayStartIndex !== -1) {
          // If the array is on a single line, check if it needs to be split
          if (arrayEndIndex !== -1 && arrayEndIndex > arrayStartIndex) {
            const beforeArray = trimmedLine.substring(0, arrayStartIndex).trim();
            const arrayContent = trimmedLine.substring(arrayStartIndex + 1, arrayEndIndex).trim();
            const afterArray = trimmedLine.substring(arrayEndIndex + 1).trim();
            
            // Calculate the total length including indentation
            const totalLength = indentStr.repeat(indentLevel).length + 
              beforeArray.length + 2 + // 2 for ": " after property name
              arrayContent.length + 2 + // 2 for " [" and "]"
              afterArray.length;

            // If total length exceeds 80 characters, convert to multi-line
            if (totalLength > 80) {
              const formattedLine = indentStr.repeat(indentLevel) + beforeArray + " [";
              
              if (formattedLine !== originalLine) {
                enhancedEdits.push(
                  TextEdit.replace(
                    this.createRange(i, 0, i, originalLine.length),
                    formattedLine
                  )
                );
              }

              // Process array elements
              let j = i + 1;
              let inArray = true;
              const arrayItems = arrayContent.split(",").map(item => item.trim());
              
              // Add each array item on its own line
              for (let k = 0; k < arrayItems.length; k++) {
                const arrayLine = indentStr.repeat(indentLevel + 1) + arrayItems[k] + 
                  (k < arrayItems.length - 1 ? "," : "");
                
                if (j < lines.length) {
                  if (arrayLine !== lines[j]) {
                    enhancedEdits.push(
                      TextEdit.replace(
                        this.createRange(j, 0, j, lines[j].length),
                        arrayLine
                      )
                    );
                  }
                }
                j++;
              }

              // Add closing bracket
              const closingLine = indentStr.repeat(indentLevel) + "]" + afterArray;
              if (j < lines.length && closingLine !== lines[j]) {
                enhancedEdits.push(
                  TextEdit.replace(
                    this.createRange(j, 0, j, lines[j].length),
                    closingLine
                  )
                );
              }
            } else {
              // Keep single-line format if under 80 characters
              const formattedArrayContent = arrayContent
                .split(",")
                .map(item => item.trim())
                .join(", ");
              
              const formattedLine = indentStr.repeat(indentLevel) + 
                beforeArray + " [" + formattedArrayContent + "]" + afterArray;
              
              if (formattedLine !== originalLine) {
                enhancedEdits.push(
                  TextEdit.replace(
                    this.createRange(i, 0, i, originalLine.length),
                    formattedLine
                  )
                );
              }
            }
          } else {
            // Multi-line array formatting
            const beforeArray = trimmedLine.substring(0, arrayStartIndex).trim();
            const formattedLine = indentStr.repeat(indentLevel) + beforeArray + " [";
            
            if (formattedLine !== originalLine) {
              enhancedEdits.push(
                TextEdit.replace(
                  this.createRange(i, 0, i, originalLine.length),
                  formattedLine
                )
              );
            }

            // Process array elements
            let j = i + 1;
            let inArray = true;
            while (j < lines.length && inArray) {
              const currentLine = lines[j];
              const trimmedCurrentLine = currentLine.trim();
              
              if (trimmedCurrentLine.includes("]")) {
                // Found closing bracket
                const formattedClosingLine = indentStr.repeat(indentLevel) + "]";
                if (formattedClosingLine !== currentLine) {
                  enhancedEdits.push(
                    TextEdit.replace(
                      this.createRange(j, 0, j, currentLine.length),
                      formattedClosingLine
                    )
                  );
                }
                inArray = false;
              } else if (trimmedCurrentLine) {
                // Array element
                const formattedArrayLine = indentStr.repeat(indentLevel + 1) + trimmedCurrentLine;
                if (formattedArrayLine !== currentLine) {
                  enhancedEdits.push(
                    TextEdit.replace(
                      this.createRange(j, 0, j, currentLine.length),
                      formattedArrayLine
                    )
                  );
                }
              }
              j++;
            }
          }
        }
        continue;
      }

      // Handle property assignments
      const colonIndex = trimmedLine.indexOf(":");
      if (colonIndex !== -1) {
        const name = trimmedLine.substring(0, colonIndex).trim();
        const value = trimmedLine.substring(colonIndex + 1).trim();
        
        // Remove any extra spaces before the colon
        const formattedLine = indentStr.repeat(indentLevel) + 
          name + ": " + value;
        
        if (formattedLine !== originalLine) {
          enhancedEdits.push(
            TextEdit.replace(
              this.createRange(i, 0, i, originalLine.length),
              formattedLine
            )
          );
        }
        continue;
      }

      // Handle SQL blocks
      if (trimmedLine.startsWith("sql:")) {
        const sqlContent = trimmedLine.substring(4).trim();
        if (sqlContent.startsWith("(")) {
          // Multi-line SQL
          const formattedLine = indentStr.repeat(indentLevel) + "sql:";
          if (formattedLine !== originalLine) {
            enhancedEdits.push(
              TextEdit.replace(
                this.createRange(i, 0, i, originalLine.length),
                formattedLine
              )
            );
          }
        } else {
          // Single-line SQL
          const formattedLine = indentStr.repeat(indentLevel) + "sql: " + sqlContent;
          if (formattedLine !== originalLine) {
            enhancedEdits.push(
              TextEdit.replace(
                this.createRange(i, 0, i, originalLine.length),
                formattedLine
              )
            );
          }
        }
        continue;
      }

      // Handle closing braces
      if (trimmedLine === "}") {
        const formattedLine = indentStr.repeat(indentLevel) + "}";
        if (formattedLine !== originalLine) {
          enhancedEdits.push(
            TextEdit.replace(
              this.createRange(i, 0, i, originalLine.length),
              formattedLine
            )
          );
        }
        continue;
      }

      // Handle opening braces
      if (trimmedLine.endsWith("{")) {
        const beforeBrace = trimmedLine.substring(0, trimmedLine.length - 1).trim();
        const formattedLine = indentStr.repeat(indentLevel) + beforeBrace + " {";
        if (formattedLine !== originalLine) {
          enhancedEdits.push(
            TextEdit.replace(
              this.createRange(i, 0, i, originalLine.length),
              formattedLine
            )
          );
        }
        continue;
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
