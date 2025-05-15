import { TextDocument } from 'vscode-languageserver-textdocument';
import { DiagnosticsProvider } from '../diagnostics';
import { Diagnostic } from 'vscode-languageserver/node';
import { LookmlViewWithFileInfo, LookmlDimension, LookmlMeasure } from 'lookml-parser';
import { jest, describe, test, expect, beforeEach } from '@jest/globals';

// Extend DiagnosticsProvider to expose protected methods for testing
class TestDiagnosticsProvider extends DiagnosticsProvider {
  public validatePropertiesForTest(document: TextDocument): Diagnostic[] {
    return this.validateProperties(document);
  }
}

const createMockDimension = (name: string): LookmlDimension => ({
    $name: name,
    type: 'string',
  });

const createMockMeasure = (name: string): LookmlMeasure => ({
    $name: name,
    type: 'count',
  });

const createMockViewWithFileInfo = (view: any): LookmlViewWithFileInfo => ({
    file: {
      $file_name: 'test.view.lkml',
      $file_path: '/test/test.view.lkml',
      $file_type: 'view',
      $file_rel: '',
      $strings: [""]
    },
    uri: 'file:///test/test.view.lkml',
    view,
    positions: {
      $p: [0, 0, 0, 0],
    },
  });

describe('DiagnosticsProvider', () => {
  let diagnosticsProvider: TestDiagnosticsProvider;
  let mockWorkspaceModel: any;

  beforeEach(() => {
    // Create a fresh mock workspace model for each test
    mockWorkspaceModel = {
      isViewFile: jest.fn().mockReturnValue(true),
      getView: jest.fn().mockImplementation((viewName: unknown) => {
        if (typeof viewName === 'string') {
          if (viewName === 'test_view') {
            return createMockViewWithFileInfo({
              dimension: {
                'id': createMockDimension('id'),
                'name': createMockDimension('name'),
              },
              measure: {
                'count': createMockMeasure('count'),
              },
            });
          }
          if (viewName === 'other_view') {
            return createMockViewWithFileInfo({
              dimension: {
                'field_name': createMockDimension('field_name'),
              },
            });
          }
        }
        return undefined;
      }),
      getViewNameFromFile: jest.fn().mockReturnValue('test_view'),
      getViewsByFile: jest.fn().mockReturnValue(['test_view']),
      getExploresByFile: jest.fn().mockReturnValue([]),
      getModelsByFile: jest.fn().mockReturnValue([]),
      getIncludedViewsForModel: jest.fn().mockReturnValue(new Set(['test_view'])),
      getErrorsByFileName: jest.fn().mockReturnValue([]),
      getModelNameFromUri: jest.fn().mockReturnValue('test_model'),
      getModel: jest.fn().mockReturnValue({
        model: {
          $file_name: 'test.model.lkml',
          include: ['test.view.lkml'],
        },
        positions: {},
      }),
    };

    diagnosticsProvider = new TestDiagnosticsProvider(mockWorkspaceModel);
  });

  describe('drill_fields validation', () => {
    const createDocument = (content: string): TextDocument => {
      return TextDocument.create('file:///test.view.lkml', 'lookml', 1, content);
    };

    test('valid single-line drill_fields', () => {
      const doc = createDocument(`
        view: test_view {
          dimension: test {
            drill_fields: [id, name, count]
          }
        }
      `);
      const diagnostics = diagnosticsProvider.validatePropertiesForTest(doc);
      console.log(103, JSON.stringify(diagnostics, null, 2));
      expect(diagnostics.length).toBe(0);
    });

    test('valid multi-line drill_fields', () => {
      const doc = createDocument(`
        view: test_view {
          dimension: test {
            drill_fields: [
              id,
              name,
              count
            ]
          }
        }
      `);
      const diagnostics = diagnosticsProvider.validatePropertiesForTest(doc);
      expect(diagnostics.length).toBe(0);
    });

    test('missing opening bracket', () => {
      const doc = createDocument(`
        dimension: test {
          drill_fields: id, name, count]
        }
      `);
      const diagnostics = diagnosticsProvider.validatePropertiesForTest(doc);
      expect(diagnostics.some(d => d.message.includes('must start with [')));
    });

    test('missing closing bracket - single line', () => {
      const doc = createDocument(`
        dimension: test {
          drill_fields: [id, name, count
        }
      `);
      const diagnostics = diagnosticsProvider.validatePropertiesForTest(doc);
      expect(diagnostics.some(d => d.message.includes('must end with ]')));
    });

    test('missing closing bracket - multi line', () => {
      const doc = createDocument(`
        dimension: test {
          drill_fields: [
            id,
            name,
            count
        }
      `);
      const diagnostics = diagnosticsProvider.validatePropertiesForTest(doc);
      expect(diagnostics.some(d => d.message.includes('must end with ]')));
    });

    test('empty fields between commas - single line', () => {
      const doc = createDocument(`
        dimension: test {
          drill_fields: [id,, name, count]
        }
      `);
      const diagnostics = diagnosticsProvider.validatePropertiesForTest(doc);
      expect(diagnostics.some(d => d.message.includes('must be separated by commas')));
    });

    test('reference to non-existent field', () => {
      const doc = createDocument(`
        dimension: test {
          drill_fields: [id, nonexistent_field, count]
        }
      `);
      const diagnostics = diagnosticsProvider.validatePropertiesForTest(doc);
      expect(diagnostics.some(d => d.message.includes('not found in view')));
    });

    test('reference to field in another view', () => {
      const doc = createDocument(`
        view: test_view {
          dimension: test {
            drill_fields: [id, other_view.field_name, count]
          }
        }
      `);
      // Mock the other view to not exist
      mockWorkspaceModel.getView.mockImplementation((viewName: string): LookmlViewWithFileInfo | undefined => {
        if (viewName === 'test_view') {
          return createMockViewWithFileInfo({
            dimension: {
              'id': createMockDimension('id'),
            },
            measure: {
              'count': createMockMeasure('count'),
            }
          });
        }
        return undefined;
      });
      
      const diagnostics = diagnosticsProvider.validatePropertiesForTest(doc);
      expect(diagnostics.some(d => d.message.includes('not found in workspace')));
    });

    test('valid reference to field in another view', () => {
      const doc = createDocument(`
        view: test_view {
          dimension: test {
            drill_fields: [id, other_view.field_name, count]
          }
        }
      `);
      // Mock both views to exist
      mockWorkspaceModel.getView.mockImplementation((viewName: string): LookmlViewWithFileInfo | undefined => {
        if (viewName === 'test_view') {
          return createMockViewWithFileInfo({
            dimension: {
              'id': createMockDimension('id'),
            },
            measure: {
              'count': createMockMeasure('count'),
            }
          });
        }
        if (viewName === 'other_view') {
          return createMockViewWithFileInfo({
            dimension: {
              'field_name': createMockDimension('field_name'),
            }
          });
        }
        return undefined;
      });
      
      const diagnostics = diagnosticsProvider.validatePropertiesForTest(doc);
      expect(diagnostics.length).toBe(0);
    });

    test('drill_fields with set reference', () => {
      const doc = createDocument(`
        view: test_view {
          dimension: test {
            drill_fields: [id, my_set*, count]
          }
        }
      `);
      // Mock view with a set
      mockWorkspaceModel.getView.mockImplementation((viewName: string): LookmlViewWithFileInfo | undefined => {
        if (viewName === 'test_view') {
          return createMockViewWithFileInfo({
            dimension: {
              'id': createMockDimension('id'),
            },
            measure: {
              'count': createMockMeasure('count'),
            },
            set: {
              'my_set': {
                fields: ['id', 'count']
              }
            }
          });
        }
        return undefined;
      });
      
      const diagnostics = diagnosticsProvider.validatePropertiesForTest(doc);
      expect(diagnostics.length).toBe(0);
    });

    test('drill_fields with non-existent set reference', () => {
      const doc = createDocument(`
        dimension: test {
          drill_fields: [nonexistent_set*, count]
        }
      `);
      
      const diagnostics = diagnosticsProvider.validatePropertiesForTest(doc);
      expect(diagnostics.some(d => d.message.includes('Set "nonexistent_set" not found')));
    });
  });
}); 