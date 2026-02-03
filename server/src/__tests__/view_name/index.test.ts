import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { Diagnostic } from "vscode-languageserver/node";
import { WorkspaceModel } from "../../models/workspace";
import { DiagnosticsProvider } from "../../providers/diagnostics";
import { createMockConnection } from "../utils";

describe("Workspace Model and Diagnostics: view_name", () => {
    let workspaceModel: WorkspaceModel;
    let diagnosticsProvider: DiagnosticsProvider;
    let mockConnection: any;
    let sharedDiagnostics: Diagnostic[];

    interface TestCase {
        explore: string;
        shouldError: boolean;
        errorMatch?: string;
        shouldNotMatch?: string;
    }

    // Define expected results using explore names
    const testCases: TestCase[] = [
        { explore: "test1", shouldError: false },
        { explore: "test2", shouldError: false },
        {
            explore: "test3",
            shouldError: true,
            errorMatch: 'Could not find a field named "test3.foo"',
        },
        { explore: "test4", shouldError: false },
        {
            explore: "test5",
            shouldError: true,
            errorMatch: 'Could not find a field named "test5.foo"',
        },
        { explore: "test6", shouldError: false },
        {
            explore: "test7",
            shouldError: true,
            errorMatch:
                "Explore name \"test7\" must match a view name, or the explore must provide a 'from:' or 'view_name:' property",
            shouldNotMatch: 'Referenced view "test7" not found in workspace',
        },
    ];

    beforeAll(async () => {
        // Create a mock connection with all required methods
        mockConnection = createMockConnection();

        workspaceModel = new WorkspaceModel({ connection: mockConnection });
        diagnosticsProvider = new DiagnosticsProvider(workspaceModel);

        // Read the example file
        const examplePath = path.join(
            __dirname,
            "lkml",
            "view_name.model.lkml",
        );
        const content = fs.readFileSync(examplePath, "utf8");

        // Create a TextDocument from the file content
        const document = TextDocument.create(
            `file://${examplePath}`,
            "lookml",
            1,
            content,
        );

        // Parse the file into the workspace model
        await workspaceModel.parseFiles({
            source: examplePath,
            reset: true,
        });

        // Run diagnostics once for all tests
        sharedDiagnostics = diagnosticsProvider.validateDocument(document);
    });

    // Generate individual tests for each case
    testCases.forEach((testCase) => {
        const description = testCase.shouldError
            ? `should fail for explore "${testCase.explore}" with error matching "${testCase.errorMatch}"`
            : `should pass for explore "${testCase.explore}"`;

        test(description, () => {
            const exploreDef = workspaceModel.getExplore(testCase.explore);
            expect(exploreDef).toBeDefined();

            // The position of the explore definition
            const exploreLine = exploreDef!.positions;
            expect(exploreLine).toBeDefined();

            const errorsInBlock = sharedDiagnostics.filter((d) => {
                const diagnosticLine = d.range.start.line;
                // Check if diagnostic line is within the explore block
                return (
                    diagnosticLine >= exploreLine.$p[0] &&
                    diagnosticLine <= exploreLine.$p[2]
                );
            });

            if (testCase.shouldError) {
                // Check if any error matches the expected message
                const relevantError = errorsInBlock.find((d) =>
                    d.message
                        .toLowerCase()
                        .includes(testCase.errorMatch!.toLowerCase()),
                );

                expect(relevantError).toBeDefined();
            } else {
                expect(errorsInBlock.length).toBe(0);
            }

            if (testCase.shouldNotMatch) {
                // Check if any error matches the expected message
                const relevantError = errorsInBlock.find((d) =>
                    d.message
                        .toLowerCase()
                        .includes(testCase.shouldNotMatch!.toLowerCase()),
                );

                expect(relevantError).toBeUndefined();
            }
        });
    });
});
