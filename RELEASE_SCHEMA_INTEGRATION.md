# Release Workflow Schema Integration

This document explains how JSON schemas are integrated into the release workflow to ensure YAML validation works in published extensions.

## Overview

The release workflow has been updated to generate and bundle JSON schemas so that YAML validation for `.dashboard.lkml` files works in the published VS Code extension.

## Changes Made

### 1. GitHub Actions Workflow (.github/workflows/release.yaml)

**Added Schema Generation Steps:**
- Added `npm run generate-schema` step before VS Code extension packaging
- Added `npm run generate-schema` step before npm package publishing
- Added verification steps to confirm schemas are generated

**Build Process:**
```yaml
- name: Generate JSON schemas
  run: npm run generate-schema
- name: Verify schemas were generated
  run: ls -la server/generated/
```

### 2. VS Code Extension Packaging

**Files Included:**
- Updated `.vscodeignore` to include `server/generated/` directory
- Generated schemas are now bundled with the VS Code extension

**Schema Files Bundled:**
- `lookml-dashboard-schema.json`
- `lookml-dashboard-document-schema.json`
- `lookml-dashboard-documents-schema.json`
- `lookml-dashboards-combined-schema.json`

### 3. NPM Package Publishing

**Server Package:**
- Updated `server/package.json` to include `generated/` in the `files` array
- Schemas are now published with the npm package

## Release Process Flow

1. **Version Update**: Release workflow updates version numbers in package.json files
2. **Dependencies**: Installs all npm dependencies
3. **Schema Generation**: Runs `npm run generate-schema` to create JSON schemas
4. **Verification**: Confirms schemas were generated successfully
5. **VS Code Extension**: Packages extension with schemas included
6. **NPM Publishing**: Publishes packages with schemas included

## Verification

### Local Testing
```bash
# Generate schemas
npm run generate-schema

# Verify schemas exist
ls -la server/generated/

# Build extension locally
npm run vscode:prepublish
```

### Release Testing
1. Create a new release on GitHub
2. Check GitHub Actions logs for schema generation steps
3. Download published VS Code extension
4. Verify schemas are included in the extension package
5. Test YAML validation in a `.dashboard.lkml` file

## Schema File Locations

### Development
- **Source**: `server/src/schemas/lookml_dashboards.ts`
- **Generated**: `server/generated/`

### Published Extension
- **VS Code Extension**: Schemas bundled in extension package
- **NPM Package**: Schemas included in `@lkr-dev/lookml-language-server` package

### Runtime
- **Extension Activation**: Schemas loaded from bundled location
- **YAML Validation**: VS Code uses bundled schemas for validation

## Troubleshooting

### Schemas Not Generated
1. Check GitHub Actions logs for schema generation step
2. Verify `npm run generate-schema` script exists
3. Check for TypeScript compilation errors

### Schemas Not Bundled
1. Verify `.vscodeignore` includes `!server/generated/`
2. Check `server/package.json` includes `generated/` in files array
3. Confirm schemas exist before packaging

### YAML Validation Not Working
1. Verify schemas are included in published extension
2. Check VS Code settings for YAML schema configuration
3. Ensure `.dashboard.lkml` files are recognized as YAML

## Files Modified

- `.github/workflows/release.yaml` - Added schema generation steps
- `.vscodeignore` - Included generated schemas
- `server/package.json` - Added generated directory to files array
- `package.json` - Already had generate-schema script

## Benefits

- **Published Extension**: YAML validation works out of the box
- **Consistent Experience**: Same validation in development and production
- **Auto-Reload**: Schemas stay in sync with Zod definitions
- **Type Safety**: Ensures dashboard files follow correct schema structure 