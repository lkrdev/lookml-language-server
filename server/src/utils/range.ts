export function ensureMinRangeLength(range: { start: { line: number, character: number }, end: { line: number, character: number } }, minLength = 1) {
    if (range.start.line === range.end.line && (range.end.character - range.start.character) < minLength) {
      range.end.character = range.start.character + minLength;
    }
    return range;
  }