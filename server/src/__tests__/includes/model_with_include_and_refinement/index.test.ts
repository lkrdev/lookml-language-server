import * as fs from "fs";
import * as path from "path";
import { TextDocument } from "vscode-languageserver-textdocument";
import { WorkspaceModel } from "../../../models/workspace";
import { DiagnosticsProvider } from "../../../providers/diagnostics";
import { createMockConnection } from "../../utils";

describe("Include Validation: model_with_include_and_refinement", () => {
    let workspaceModel: WorkspaceModel;
    let diagnosticsProvider: DiagnosticsProvider;
    let mockConnection: any;

    beforeEach(() => {
        // Create a mock connection with all required methods
        mockConnection = createMockConnection();
        mockConnection.sendRequest.mockImplementation(
            async (method: string, params: any) => {
                if (method === "lookml/findMatchingFiles") {
                    const { baseDir, pattern } = params;
                    const filePath = path.join(baseDir, pattern);
                    if (fs.existsSync(filePath)) {
                        return [`file://${filePath}`];
                    }
                    return [];
                }
            },
        );

        workspaceModel = new WorkspaceModel({ connection: mockConnection });
        diagnosticsProvider = new DiagnosticsProvider(workspaceModel);
    });

    const testCases = [
        {
            exploreName: "order_items",
            hasError: false,
        },
        {
            exploreName: "order_items2",
            hasError: false,
        },
        {
            exploreName: "order_items3",
            hasError: true,
            expectedError:
                'Could not find a field named "order_items.not_included"',
        },
        {
            exploreName: "order_items4",
            hasError: false,
        },
    ];

    testCases.forEach((testCase) => {
        test(`model with refinement should have refined field for ${testCase.exploreName}`, async () => {
            const modelPath = path.join(
                __dirname,
                "lkml",
                "model_with_include_and_refinement.model.lkml",
            );
            const content = fs.readFileSync(modelPath, "utf8");

            const document = TextDocument.create(
                `file://${modelPath}`,
                "lookml",
                1,
                content,
            );

            // Use recursive glob to ensure nested files are loaded
            await workspaceModel.parseFiles({
                source: path.join(__dirname, "lkml", "**", "*.lkml"),
                reset: true,
            });

            const diagnostics = diagnosticsProvider.validateDocument(document);
            const exploreDef = workspaceModel.getExplore(testCase.exploreName);

            expect(exploreDef).toBeDefined();
            const explorePositions = exploreDef!.positions;

            // Filter diagnostics that fall within this explore's range
            const relevantDiagnostics = diagnostics.filter((d) => {
                const diagLine = d.range.start.line;
                return (
                    diagLine >= explorePositions!.$p[0] &&
                    diagLine <= explorePositions!.$p[2]
                );
            });

            if (testCase.hasError) {
                if (relevantDiagnostics.length === 0) {
                    console.log(
                        `Expected errors for ${testCase.exploreName} but found none. All diagnostics:`,
                        JSON.stringify(diagnostics, null, 2),
                    );
                    console.log(
                        `Explore range:`,
                        JSON.stringify(explorePositions),
                    );
                }
                expect(relevantDiagnostics.length).toBeGreaterThan(0);
                if (testCase.expectedError) {
                    const found = relevantDiagnostics.some((d) =>
                        d.message.includes(testCase.expectedError!),
                    );
                    expect(found).toBe(true);
                }
            } else {
                if (relevantDiagnostics.length > 0) {
                    console.log(
                        `Unexpected diagnostics for ${testCase.exploreName}:`,
                        JSON.stringify(relevantDiagnostics, null, 2),
                    );
                }
                expect(relevantDiagnostics.length).toBe(0);
            }
        });
    });
});
