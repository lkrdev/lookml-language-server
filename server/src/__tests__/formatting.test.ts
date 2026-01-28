import { TextDocument } from 'vscode-languageserver-textdocument';
import { FormattingOptions } from 'vscode-languageserver/node';
import { FormattingProvider } from '../providers/formatting';

describe('FormattingProvider', () => {
  let formattingProvider: FormattingProvider;

  beforeEach(() => {
    formattingProvider = new FormattingProvider();
  });

  function createDocument(content: string): TextDocument {
    return TextDocument.create('file://test.lkml', 'lookml', 1, content);
  }

  test('should not change already correct comment indentation', () => {
    const content = `
view: test {
  # This is a comment
  label: "Test"
}
`;
    const document = createDocument(content);
    const options: FormattingOptions = {
      tabSize: 2,
      insertSpaces: true,
    };

    const edits = formattingProvider.formatDocument(document, options);

    const commentEdit = edits.find(e => e.range.start.line === 2);

    // Expect no changes for an already correctly formatted line.
    // The buggy behavior was to remove indentation, which would create an edit.
    expect(commentEdit).toBeUndefined();
  });

  test('should indent comments correctly when input is unindented', () => {
     const content = `
view: test {
# This is a comment
  label: "Test"
}
`;
    const document = createDocument(content);
    const options: FormattingOptions = {
      tabSize: 2,
      insertSpaces: true,
    };

    const edits = formattingProvider.formatDocument(document, options);
    const commentEdit = edits.find(e => e.range.start.line === 2);

    // We expect it to add indentation
    expect(commentEdit).toBeDefined();
    expect(commentEdit?.newText).toBe('  # This is a comment');
  });

  test('should respect tabSize option', () => {
    const content = `
view: test {
label: "Test"
}
`;
    const document = createDocument(content);
    const options: FormattingOptions = {
      tabSize: 4,
      insertSpaces: true,
    };

    const edits = formattingProvider.formatDocument(document, options);
    const labelEdit = edits.find(e => e.range.start.line === 2);

    expect(labelEdit).toBeDefined();
    // Should have 4 spaces
    expect(labelEdit?.newText).toBe('    label: "Test"');
  });
});
