# Dashboard Schema Integration

This document explains how the LookML Language Server extension integrates YAML schema validation for `.dashboard.lkml` files.

## Overview

The extension automatically generates JSON schemas from Zod schemas and applies them to dashboard files for YAML validation, autocomplete, and IntelliSense support.

## How It Works

### 1. Schema Generation
- Zod schemas in `server/src/schemas/lookml_dashboards.ts` are automatically converted to JSON Schema format
- Generated schemas are saved to `server/generated/` directory
- Auto-reload is enabled - schemas regenerate when source files change

### 2. File Association
- `.dashboard.lkml` files are associated with the `lookml` language
- Files are also treated as YAML for schema validation purposes

### 3. Schema Validation
- VS Code automatically validates `.dashboard.lkml` files against the generated schemas
- Provides real-time error checking and IntelliSense support
- Supports both dashboard and dashboard document schemas

## Configuration

### Extension Configuration
The extension automatically:
- Registers `.dashboard.lkml` as a LookML file type
- Generates schemas on activation
- Configures YAML schema validation

### VS Code Settings
Settings in `.vscode/settings.json`:
```json
{
  "files.associations": {
    "*.dashboard.lkml": "yaml"
  },
  "yaml.schemas": {
    "./server/generated/lookml-dashboard-schema.json": "**/*.dashboard.lkml",
    "./server/generated/lookml-dashboard-document-schema.json": "**/*.dashboard.lkml"
  }
}
```

## Usage

### Creating Dashboard Files
1. Create a file with `.dashboard.lkml` extension
2. VS Code will automatically provide:
   - YAML validation
   - Autocomplete suggestions
   - Error highlighting
   - IntelliSense support

### Example Dashboard File
```yaml
dashboard: my_dashboard
title: My Dashboard
layout: grid
elements:
  - type: looker_grid
    title: Sample Grid
    row: 0
    col: 0
    width: 6
    height: 4
    model: my_model
    explore: my_explore
    fields:
      - my_field
    limit: 100
```

## Development

### Schema Updates
1. Modify Zod schemas in `server/src/schemas/lookml_dashboards.ts`
2. Schemas auto-regenerate when files change
3. VS Code picks up new schemas automatically

### Manual Schema Generation
```bash
# Generate schemas once
npm run generate-schema

# Watch for changes
npm run watch:schemas
```

### Testing
1. Create a `.dashboard.lkml` file
2. Add invalid YAML or schema violations
3. VS Code should show validation errors
4. Fix errors and see them disappear

## Troubleshooting

### Schemas Not Loading
1. Check that schemas are generated: `ls server/generated/`
2. Verify file associations in VS Code settings
3. Reload VS Code window

### Validation Not Working
1. Ensure YAML validation is enabled in VS Code
2. Check that `.dashboard.lkml` files are recognized as YAML
3. Verify schema file paths are correct

### Auto-Reload Issues
1. Check nodemon configuration in `nodemon.json`
2. Verify file watching is working
3. Check for file permission issues

## Files Involved

- `server/src/schemas/lookml_dashboards.ts` - Zod schema definitions
- `server/src/scripts/generate-json-schema.ts` - Schema generation script
- `server/generated/` - Generated JSON schemas
- `client/src/extension.ts` - Extension activation and schema registration
- `.vscode/settings.json` - VS Code configuration
- `package.json` - Extension manifest and file associations 