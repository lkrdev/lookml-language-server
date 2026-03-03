import { Connection, Diagnostic } from 'vscode-languageserver/node';
import { WorkspaceModel } from '../models/workspace';

export function createMockConnection(): Connection {
  return {
    sendDiagnostics: jest.fn(),
    listen: jest.fn(),
    onRequest: jest.fn(),
    sendRequest: jest.fn(),
    onNotification: jest.fn(),
    sendNotification: jest.fn(),
    onProgress: jest.fn(),
    sendProgress: jest.fn(),
    onUnhandledProgress: jest.fn(),
    onUnhandledRequest: jest.fn(),
    onUnhandledNotification: jest.fn(),
    dispose: jest.fn(),
  } as unknown as Connection;
}


export const getDiagnosticsForView = (workspaceModel: WorkspaceModel, sharedDiagnostics: Diagnostic[], viewName: string) => {
    const view = workspaceModel.getView(viewName);
    if (!view) {
        throw new Error(`View ${viewName} not found`);
    }
    const viewLine = view!.positions;
    return sharedDiagnostics.filter((d) => {
        const diagnosticLine = d.range.start.line;
        return (
            diagnosticLine >= viewLine.$p[0] &&
            diagnosticLine <= viewLine.$p[2]
        );
    });
};
