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

  test('should indent comments correctly', () => {
    const content = `
view: test {
  # This is a comment
  label: "Test"
}
`;
    // The current bug causes the comment to be moved to char 0
    const document = createDocument(content);
    const options: FormattingOptions = {
      tabSize: 2,
      insertSpaces: true,
    };

    const edits = formattingProvider.formatDocument(document, options);

    // Apply edits (simplified for test)
    // In a real scenario, we would apply edits to the document.
    // Here we can just inspect the edits.

    // We expect the comment to be indented by 2 spaces.
    // However, since we are testing the edits, we need to check if there is an edit that produces the correct indentation.
    // Or simpler: check if the logic produces the correct result.

    // Let's manually apply edits to see the result string
    const lines = content.split('\n');
    // The provider returns edits. If the code thinks the comment should be at char 0, it will return an edit to move it there.

    // Let's look for the edit affecting line 2 (the comment)
    // The comment is on the 3rd line (index 2)
    const commentEdit = edits.find(e => e.range.start.line === 2);

    // If the bug exists, the newText will be '# This is a comment' (no spaces)
    // If fixed, it should be '  # This is a comment'

    if (commentEdit) {
       // Check if the new text starts with 2 spaces
       expect(commentEdit.newText).toMatch(/^  #/);
    } else {
       // If no edit, it means the formatter thinks it's already correct.
       // The input has 2 spaces.
       // So if no edit, it passes?
       // Wait, if the input is already correct, and the formatter is buggy, it MIGHT try to "fix" it by removing spaces.

       // Let's make sure the input HAS spaces.
       // `  # This is a comment`
       // If the formatter says "comments should be at 0", it will produce an edit to remove spaces.
       // So we want NO edit that removes spaces, OR an edit that ADDS spaces if we provide unindented input.
    }
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
