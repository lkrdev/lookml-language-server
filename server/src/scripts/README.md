# JSON Schema Generation Script

This directory contains scripts for generating JSON schemas from Zod schemas.

## generate-json-schema.ts

This script converts Zod schemas from `../schemas/lookml_dashboards.ts` into JSON Schema format.

### Usage

```bash
# Generate schemas once
npm run generate-schema

# Watch for changes and auto-regenerate (from root directory)
npm run watch

# Watch only schemas (from root directory)
npm run watch:schemas

# Watch schemas from server directory
cd server && npm run watch:schemas
```

### Auto-Reload Setup

The schema generation is integrated into the development workflow:

1. **Watch Mode**: When you run `npm run watch`, it automatically watches both TypeScript compilation and schema files
2. **Schema Changes**: Any changes to files in `server/src/schemas/` will trigger automatic regeneration
3. **VS Code Integration**: The watch task is configured in `.vscode/tasks.json` and runs automatically with the extension

### Output

The script generates the following files in the `../../generated/` directory:

- `lookml-dashboard-schema.json` - JSON schema for LookML dashboard configuration
- `lookml-dashboard-document-schema.json` - JSON schema for LookML dashboard document wrapper
- `lookml-dashboard-documents-schema.json` - JSON schema for multiple LookML dashboard documents
- `lookml-dashboards-combined-schema.json` - Combined schema with all definitions

### Dependencies

- `zod-to-json-schema` - Converts Zod schemas to JSON Schema format
- `ts-node` - Runs TypeScript files directly
- `concurrently` - Runs multiple watch processes simultaneously
- `nodemon` - Watches for file changes and triggers regeneration

### Notes

- The generated files are automatically added to `.gitignore`
- The script uses JSON Schema Draft-07 format
- Each schema includes proper type definitions and validation rules
- Auto-reload has a 1-second delay to prevent excessive regeneration
- Schema watching is optimized to ignore generated files 