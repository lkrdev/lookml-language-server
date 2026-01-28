# LookML Validator Test Setup

## Overview

Successfully set up Jest testing infrastructure for the `lookml-validator` package with tests for validating LookML dimension types.

## What Was Created

### 1. Jest Configuration

- **File**: `jest.config.js`
- Configured ts-jest preset for TypeScript support
- Set up test matching pattern for `__tests__` directories

### 2. Test Fixtures

Created two test fixtures in `src/__tests__/fixtures/`:

#### Invalid Type Fixture (`invalid_type.view.lkml`)

```lookml
view: order_items {
  dimension: sale_price {
    type: numba
    sql: ${TABLE}.sale_price ;;
  }
}
```

This fixture contains an invalid dimension type `numba` which should trigger a validation error.

#### Valid Type Fixture (`valid_type.view.lkml`)

```lookml
view: order_items {
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
}
```

This fixture contains a valid dimension type `number` which should pass validation.

### 3. Test Suite

- **File**: `src/__tests__/type-validation.test.ts`
- Two test cases:
    1. **Invalid type detection**: Verifies that `type: numba` is detected as invalid
    2. **Valid type acceptance**: Verifies that `type: number` passes validation

### 4. Package Configuration Updates

Updated `package.json`:

- Added `@types/jest` to devDependencies
- Added `test` script to run Jest

## Test Results

✅ **All tests passing!**

```
Test Suites: 1 passed, 1 total
Tests:       2 passed, 2 total
```

### Validation Output

The invalid type test correctly detected the error:

```
Invalid enum value. Expected 'bin' | 'date' | 'date_time' | 'date_raw' |
'distance' | 'duration' | 'location' | 'number' | 'string' | 'tier' |
'time' | 'unquoted' | 'yesno' | 'zipcode' | 'duration_day' |
'duration_hour' | 'duration_minute' | 'duration_month' |
'duration_quarter' | 'duration_second' | 'duration_week' |
'duration_year', received 'numba'
```

## Running Tests

From the validator package directory:

```bash
cd packages/lookml-validator
npm test
```

Or from the root:

```bash
npm run test:validator
```

## Next Steps

You can now:

1. Add more test cases for other validation scenarios
2. Test other invalid field types or properties
3. Create integration tests with multiple files
4. Add tests for SQL reference validation
5. Test field reference validation

## Example: Adding More Tests

To add more tests, create new fixture files in `src/__tests__/fixtures/` and add test cases to the test suite following the existing pattern.
