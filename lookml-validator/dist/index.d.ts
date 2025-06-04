import { Diagnostic } from 'vscode-languageserver-types';
export declare class LookMLValidator {
    private workspaceModel;
    private diagnosticsProvider;
    constructor();
    validate(folderPath?: string): Promise<Diagnostic[]>;
}
export declare function Validate(folderPath?: string): Promise<Diagnostic[]>;
