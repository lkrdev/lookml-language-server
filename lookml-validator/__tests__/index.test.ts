import { Validate } from '../src/index';
import * as path from 'path';
import { DiagnosticSeverity } from 'vscode-languageserver-types';

// Helper function to resolve project paths
const getProjectPath = (projectName: string) => path.resolve(__dirname, 'projects', projectName);

describe('LookMLValidator', () => {
  it('should return no diagnostics for a valid project', async () => {
    const projectPath = getProjectPath('valid_project');
    // Temporarily change CWD for this test to simulate running from the project root
    const originalCwd = process.cwd();
    process.chdir(projectPath);

    const diagnostics = await Validate(); // Validate with no path, should use CWD

    process.chdir(originalCwd); // Restore CWD
    expect(diagnostics).toEqual([]);
  });

  it('should return diagnostics for a project with errors', async () => {
    const projectPath = getProjectPath('project_with_errors');
    const originalCwd = process.cwd();
    process.chdir(projectPath);

    const diagnostics = await Validate();

    process.chdir(originalCwd);
    expect(diagnostics.length).toBeGreaterThan(0);
    // Check for a syntax error (e.g., unclosed brace)
    const syntaxError = diagnostics.find(d => d.message.toLowerCase().includes('unclosed brace') || d.message.toLowerCase().includes('syntax error'));
    // Check for a reference error (e.g., view not found)
    const refError = diagnostics.find(d => d.message.toLowerCase().includes('view not found') || d.message.toLowerCase().includes('non_existent_view'));

    // Due to the way lookml-parser creates errors, we expect at least one of these to be caught.
    // The exact number and type of errors can be refined if needed.
    expect(syntaxError || refError).toBeDefined();
  });

  it('should validate a specific folder path correctly', async () => {
    const projectPath = getProjectPath('specific_folder_project');
    const diagnostics = await Validate(projectPath);
    expect(diagnostics).toEqual([]);
  });

  it('should return diagnostics when a specific folder path has errors', async () => {
    const projectPath = getProjectPath('project_with_errors');
    const diagnostics = await Validate(projectPath);
    expect(diagnostics.length).toBeGreaterThan(0);
  });

  // Test for a non-existent folder
  it('should handle non-existent folder path gracefully', async () => {
    const nonExistentPath = path.resolve(__dirname, 'non_existent_project');
    const diagnostics = await Validate(nonExistentPath);
    // Expect no diagnostics or a specific warning/error for path not found,
    // depending on implementation of file system interactions.
    // For now, assuming it might return empty if no files are found.
    // This could be refined based on how WorkspaceModel handles empty sources.
    expect(diagnostics).toEqual([]);
  });
});
