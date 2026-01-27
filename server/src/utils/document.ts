import { TextDocument } from "vscode-languageserver-textdocument";

/**
 * Splits a document's text into lines in a way that is robust across different
 * operating systems (handles both LF and CRLF).
 */
export function getLines(document: TextDocument): string[] {
  return document.getText().split(/\r?\n/);
}

/**
 * Splits any string into lines in a way that is robust across different
 * operating systems.
 */
export function splitIntoLines(text: string): string[] {
  return text.split(/\r?\n/);
}
