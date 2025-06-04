"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ensureMinRangeLength = ensureMinRangeLength;
function ensureMinRangeLength(range, minLength = 1) {
    if (range.start.line === range.end.line && (range.end.character - range.start.character) < minLength) {
        range.end.character = range.start.character + minLength;
    }
    return range;
}
