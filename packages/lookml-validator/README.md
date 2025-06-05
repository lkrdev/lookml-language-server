# lookml-validator

Validate LookML workspaces and return diagnostics programmatically from Node.js.

## Features
- Exposes a single `Validate` method
- Validates all LookML files in a workspace folder
- Returns a list of diagnostics for each file


## Usage

```ts
import validate from 'lookml-validator';

(async () => {
  // Optionally provide a path to your LookML project root
  const results = await validate('/path/to/your/lookml/project');

  for (const { file, diagnostics } of results) {
    console.log(`Diagnostics for ${file}:`);
    for (const diag of diagnostics) {
      console.log(`- ${diag.message}`);
    }
  }
})();
```

If you do not provide a path, it will use the current working directory.

## API

### `validate(folderPath?: string): Promise<{ file: string, diagnostics: Diagnostic[] }[]>`
- `folderPath` (optional): Path to the LookML workspace folder. Defaults to `process.cwd()`.
- Returns: An array of objects, each with a `file` and its [`diagnostics`](https://github.com/AArnott/vscode-languageserver-protocol/blob/master/README.md#diagnostic) array.

