# lookml-validator

Validate LookML workspaces and return diagnostics programmatically from Node.js or via the CLI.

## Features

- Exposes a single `validate` method for programmatic use
- Provides a CLI for easy integration into CI/CD pipelines
- Validates all LookML files in a workspace folder
- Returns a list of diagnostics for each file

## CLI Usage

You can run the validator directly using `npx`:

```bash
npx @lkr-dev/lookml-validator validate ./path/to/your/lookml/project
```

The CLI will exit with a non-zero exit code if any errors are found, making it ideal for CI linting.

## Programmatic Usage

### Validation

```ts
import validate from "@lkr-dev/lookml-validator";

(async () => {
    // Optionally provide a path to your LookML project root
    const results = await validate("/path/to/your/lookml/project");

    for (const { file, diagnostics } of results) {
        if (diagnostics.length === 0) continue;
        console.log(`Diagnostics for ${file}:`);
        for (const diag of diagnostics) {
            console.log(`- [${diag.severity}] ${diag.message}`);
        }
    }
})();
```

## Types

The package provides full TypeScript support. All internal types (including `LookmlError`, `Diagnostic`, `Range`, `Position`, etc.) are exported via a dedicated `/types` subpath to keep the main entry point clean:

```ts
import {
    LookmlError,
    Diagnostic,
    Range,
} from "@lkr-dev/lookml-validator/types";
```

## API

### `validate(folderPath?: string): Promise<{ file: string, diagnostics: Diagnostic[] }[]>`

- `folderPath` (optional): Path to the LookML workspace folder. Defaults to `process.cwd()`.
- Returns: An array of objects, each with a `file` and its [`diagnostics`](https://github.com/microsoft/vscode-languageserver-types) array.
