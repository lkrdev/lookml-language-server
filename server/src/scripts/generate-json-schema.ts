#!/usr/bin/env node

import { writeFileSync } from "fs";
import { join } from "path";
import { zodToJsonSchema } from "zod-to-json-schema";
import {
  LookMLDashboardDocumentSchema,
  LookMLDashboardDocumentsSchema,
  LookMLDashboardSchema,
} from "../schemas/lookml_dashboards";

// Generate JSON schemas from Zod schemas
const dashboardSchema = zodToJsonSchema(LookMLDashboardSchema, {
  name: "LookMLDashboard",
});

const dashboardDocumentSchema = zodToJsonSchema(LookMLDashboardDocumentSchema, {
  name: "LookMLDashboardDocument",
});

const dashboardDocumentsSchema = zodToJsonSchema(
  LookMLDashboardDocumentsSchema,
  {
    name: "LookMLDashboardDocuments",
  }
);

// Create the output directory if it doesn't exist
const outputDir = join(__dirname, "../../generated");
try {
  require("fs").mkdirSync(outputDir, { recursive: true });
} catch (error) {
  // Directory might already exist
}

// Write individual schema files
writeFileSync(
  join(outputDir, "lookml-dashboard-schema.json"),
  JSON.stringify(dashboardSchema, null, 2)
);

writeFileSync(
  join(outputDir, "lookml-dashboard-document-schema.json"),
  JSON.stringify(dashboardDocumentSchema, null, 2)
);

writeFileSync(
  join(outputDir, "lookml-dashboard-documents-schema.json"),
  JSON.stringify(dashboardDocumentsSchema, null, 2)
);

// Create a combined schema file
const combinedSchema = {
  $schema: "http://json-schema.org/draft-07/schema#",
  title: "LookML Dashboard Schemas",
  description: "JSON schemas for LookML dashboard validation",
  definitions: {
    dashboard: dashboardSchema,
    dashboardDocument: dashboardDocumentSchema,
    dashboardDocuments: dashboardDocumentsSchema,
  },
  oneOf: [
    { $ref: "#/definitions/dashboard" },
    { $ref: "#/definitions/dashboardDocument" },
    { $ref: "#/definitions/dashboardDocuments" },
  ],
};

writeFileSync(
  join(outputDir, "lookml-dashboards-combined-schema.json"),
  JSON.stringify(combinedSchema, null, 2)
);

console.log("✅ JSON schemas generated successfully!");
console.log("📁 Output directory:", outputDir);
console.log("📄 Generated files:");
console.log("  - lookml-dashboard-schema.json");
console.log("  - lookml-dashboard-document-schema.json");
console.log("  - lookml-dashboard-documents-schema.json");
console.log("  - lookml-dashboards-combined-schema.json");
