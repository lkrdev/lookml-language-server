import { WorkspaceModel } from '../models/workspace';
import * as path from 'path';
import * as fs from 'fs';
import { TextDocument } from 'vscode-languageserver-textdocument';
import { Diagnostic, Connection } from 'vscode-languageserver/node';

const TEST_PROJECTS_DIR = path.join(__dirname, './test-projects');

interface ProjectDiagnostics {
  projectName: string;
  files: {
    [fileName: string]: {
      diagnostics: Diagnostic[];
      content: string;
    };
  };
}

// Create a mock connection for testing
const mockConnection = {
  onInitialize: jest.fn().mockReturnValue({ capabilities: {}, dispose: jest.fn() }),
  onInitialized: jest.fn().mockReturnValue({ dispose: jest.fn() }),
  onDidChangeConfiguration: jest.fn().mockReturnValue({ dispose: jest.fn() }),
  onDidChangeWatchedFiles: jest.fn().mockReturnValue({ dispose: jest.fn() }),
  onDidOpenTextDocument: jest.fn().mockReturnValue({ dispose: jest.fn() }),
  onDidChangeTextDocument: jest.fn().mockReturnValue({ dispose: jest.fn() }),
  onDidCloseTextDocument: jest.fn().mockReturnValue({ dispose: jest.fn() }),
  onDidSaveTextDocument: jest.fn().mockReturnValue({ dispose: jest.fn() }),
  onShutdown: jest.fn().mockReturnValue({ dispose: jest.fn() }),
  onExit: jest.fn().mockReturnValue({ dispose: jest.fn() }),
  sendDiagnostics: jest.fn().mockResolvedValue(undefined),
  sendNotification: jest.fn().mockResolvedValue(undefined),
  sendRequest: jest.fn().mockResolvedValue(undefined),
  listen: jest.fn(),
  dispose: jest.fn(),
  onRequest: jest.fn().mockReturnValue({ dispose: jest.fn() }),
  onNotification: jest.fn().mockReturnValue({ dispose: jest.fn() }),
  trace: jest.fn(),
  window: {
    showMessage: jest.fn().mockResolvedValue(undefined),
    showErrorMessage: jest.fn().mockResolvedValue(undefined),
    showWarningMessage: jest.fn().mockResolvedValue(undefined),
    showInformationMessage: jest.fn().mockResolvedValue(undefined),
    logMessage: jest.fn(),
    createProgress: jest.fn().mockReturnValue({
      report: jest.fn(),
      done: jest.fn(),
    }),
  },
  workspace: {
    getConfiguration: jest.fn().mockResolvedValue({}),
    onDidChangeConfiguration: jest.fn().mockReturnValue({ dispose: jest.fn() }),
    onDidChangeWorkspaceFolders: jest.fn().mockReturnValue({ dispose: jest.fn() }),
    onDidChangeTextDocument: jest.fn().mockReturnValue({ dispose: jest.fn() }),
    onDidOpenTextDocument: jest.fn().mockReturnValue({ dispose: jest.fn() }),
    onDidCloseTextDocument: jest.fn().mockReturnValue({ dispose: jest.fn() }),
    onDidSaveTextDocument: jest.fn().mockReturnValue({ dispose: jest.fn() }),
    onDidDeleteFiles: jest.fn().mockReturnValue({ dispose: jest.fn() }),
    onDidRenameFiles: jest.fn().mockReturnValue({ dispose: jest.fn() }),
    onWillCreateFiles: jest.fn().mockReturnValue({ dispose: jest.fn() }),
    onWillDeleteFiles: jest.fn().mockReturnValue({ dispose: jest.fn() }),
    onWillRenameFiles: jest.fn().mockReturnValue({ dispose: jest.fn() }),
    applyEdit: jest.fn().mockResolvedValue({ applied: true }),
    getWorkspaceFolders: jest.fn().mockResolvedValue([]),
  },
} as unknown as Connection;

async function getProjectDiagnostics(projectDir: string): Promise<ProjectDiagnostics> {
    console.log("getProjectDiagnostics", projectDir);
  const projectName = path.basename(projectDir);
  
  // Initialize workspace model with mock connection
  const workspaceModel = new WorkspaceModel({ connection: mockConnection });
  
  const diagnostics: ProjectDiagnostics = {
    projectName,
    files: {}
  };
  
  try {
    // Initialize the workspace
    await workspaceModel.parseFiles({
        reset: true,
        source: `${projectDir}/**/*.lkml`,
    });
    
    // Get all files in the project
    const files = fs.readdirSync(projectDir)
      .filter(f => f.endsWith('.lkml'));
    
    // Process each LookML file
    for (const file of files) {
      const filePath = path.join(projectDir, file);
      const content = fs.readFileSync(filePath, 'utf-8');
      
      const document = TextDocument.create(
        `file://${filePath}`,
        'lookml',
        1,
        content
      );
      
      // Get diagnostics for the file
      const fileDiagnostics = workspaceModel.getDiagnostics(document);
      
      // Save file diagnostics and content
      diagnostics.files[file] = {
        diagnostics: fileDiagnostics,
        content
      };
    }
    
    expect(workspaceModel.getViews()).toMatchSnapshot("getViews");
    expect(workspaceModel.getExplores()).toMatchSnapshot("getExplores");
    expect(workspaceModel.getModels()).toMatchSnapshot("getModels");
    expect(workspaceModel.getErrors()).toMatchSnapshot("getErrors");
    // Clean up
    await workspaceModel.cleanup();
  } catch (error) {
    console.error(`Error testing project ${projectDir}:`, error);
  }
  
  return diagnostics;
}

describe('LookML Test Projects', () => {
  // Get all test project directories
  const projectDirs = fs.readdirSync(TEST_PROJECTS_DIR)
    .filter(dir => !dir.startsWith('.')) // Skip hidden directories
    .map(dir => path.join(TEST_PROJECTS_DIR, dir))
    .filter(dir => fs.statSync(dir).isDirectory());
  
  // Create a test for each project
  projectDirs.forEach(projectDir => {
    const projectName = path.basename(projectDir);
    
    test(`Project ${projectName} diagnostics`, async () => {
      const diagnostics = await getProjectDiagnostics(projectDir);
      
      // Create a formatted string for the snapshot
      const snapshotContent = Object.entries(diagnostics.files)
        .map(([fileName, { diagnostics: fileDiagnostics, content }]) => {
          const diagnosticsText = fileDiagnostics
            .map(d => {
              const severity = d.severity === 1 ? 'Error' : d.severity === 2 ? 'Warning' : 'Info';
              return `  ${severity}: ${d.message} (Line ${d.range.start.line + 1})`;
            })
            .join('\n');
          
          return `File: ${fileName}\n${diagnosticsText}\n`;
        })
        .join('\n');
      
      // Compare with snapshot
      expect(snapshotContent).toMatchSnapshot(`diagnostics-${projectName}`);
    });
  });
}); 