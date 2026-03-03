---
name: LookML Language Server Tests
description: Overview of the folder structure and setup patterns for the LookML Language Server tests
---

# LookML Language Server Tests

This skill describes the structure, patterns, and conventions used for the integration tests in the `server/src/__tests__` directory of the `lookml-language-server` project.

## Directory Structure Pattern

The tests in `server/src/__tests__` are organized by feature or LookML concept (e.g., `dimension_group`, `extends_view`, `view_name`). 

A standard test suite directory typically contains:
1.  **`index.test.ts`**: The main Jest test file containing the test definitions (`describe`, `test`, `beforeAll`, etc.).
2.  **`lkml/`**: A subdirectory containing mock LookML files (`.model.lkml`, `.view.lkml`, or `.lkml`) that represent the test cases for the enclosing test suite.

*Note: Some complex test suites (like `includes`) may feature nested subdirectories, each of which then follows this same pattern with its own `index.test.ts` and `lkml/` folder.*

## Test Implementation Patterns

Most test suites follow this setup and execution pattern:

- **Initialization**: Tests initialize a `WorkspaceModel`, often using a mocked connection through the helper function `createMockConnection()` (imported from `../utils.ts` or similar).
- **Loading Mock Files**: The LookML files from the `lkml/` directory are loaded and parsed into the model using `workspaceModel.parseFiles({ source: examplePath, reset: true })`.
- **Diagnostics Testing (Optional)**: If the test focuses on tracking diagnostics (errors/warnings), a `DiagnosticsProvider` is instantiated. The contents of the LookML file are read into a `TextDocument` (from `vscode-languageserver-textdocument`) and validated via `diagnosticsProvider.validateDocument(document)`.
- **Assertions**: The tests use Jest's `expect` assertions to verify:
  - The correct structure of the parsed models, views, explores, and fields (e.g., `workspaceModel.getView()`, `workspaceModel.getTableFields()`).
  - The presence, absence, or line numbers of diagnostics specific to the feature being tested.
