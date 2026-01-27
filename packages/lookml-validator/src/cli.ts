#!/usr/bin/env node
import * as path from "path";
import validate from "./index";

async function run() {
    const args = process.argv.slice(2);
    const command = args[0];

    if (command !== "validate") {
        console.log("Usage: lookml-validator validate <path>");
        console.log("\nCommands:");
        console.log(
            "  validate <path>  Validate LookML files in the specified directory",
        );
        process.exit(command ? 1 : 0);
    }

    const folderPath = args[1] ? path.resolve(args[1]) : process.cwd();

    console.log(`Validating LookML in: ${folderPath}...`);

    try {
        const results = await validate(folderPath);
        let errorCount = 0;
        let warningCount = 0;

        for (const { file, diagnostics } of results) {
            if (diagnostics.length === 0) continue;

            console.log(`\nFile: ${file}`);
            for (const diag of diagnostics) {
                const severity = diag.severity === 1 ? "Error" : "Warning";
                if (diag.severity === 1) errorCount++;
                else warningCount++;

                const line = diag.range.start.line + 1;
                const col = diag.range.start.character + 1;
                console.log(
                    `  [${severity}] Line ${line}, Col ${col}: ${diag.message}`,
                );
            }
        }

        console.log(`\nValidation complete.`);
        console.log(`Found ${errorCount} errors and ${warningCount} warnings.`);

        if (errorCount > 0) {
            process.exit(1);
        }
    } catch (error) {
        console.error("Fatal error during validation:", error);
        process.exit(1);
    }
}

run();
