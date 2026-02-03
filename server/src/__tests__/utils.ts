import { Connection } from 'vscode-languageserver/node';

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
