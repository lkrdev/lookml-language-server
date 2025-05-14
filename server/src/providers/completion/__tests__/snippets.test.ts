import { CompletionItemKind, InsertTextFormat, MarkupKind } from "vscode-languageserver/node";
import { SNIPPETS, createSnippet, getAllSnippets, getSnippetsForContext } from "../snippets";

describe("snippets", () => {
  describe("SNIPPETS constant", () => {
    it("should contain all expected snippet definitions", () => {
      const expectedSnippets = [
        "dimension",
        "measure",
        "view",
        "dimension_group",
        "explore",
        "join",
        "filter"
      ];

      expect(Object.keys(SNIPPETS)).toEqual(expect.arrayContaining(expectedSnippets));
    });

    it("should have correct structure for each snippet", () => {
      Object.values(SNIPPETS).forEach(snippet => {
        expect(snippet).toHaveProperty("prefix");
        expect(snippet).toHaveProperty("body");
        expect(snippet).toHaveProperty("description");
        expect(typeof snippet.prefix).toBe("string");
        expect(typeof snippet.body).toBe("string");
        expect(typeof snippet.description).toBe("string");
      });
    });
  });

  describe("createSnippet", () => {
    it("should create a valid completion item for a dimension snippet", () => {
      const completionItem = createSnippet("dimension");
      
      expect(completionItem).toEqual({
        label: "dimension",
        kind: CompletionItemKind.Snippet,
        insertText: expect.stringContaining("dimension:"),
        insertTextFormat: InsertTextFormat.Snippet,
        documentation: {
          kind: MarkupKind.Markdown,
          value: expect.stringContaining("**dimension**")
        },
        data: { type: "snippet", name: "dimension" }
      });
    });

    it("should throw an error for non-existent snippet key", () => {
      expect(() => createSnippet("nonexistent")).toThrow();
    });
  });

  describe("getAllSnippets", () => {
    it("should return an array of completion items for all snippets", () => {
      const allSnippets = getAllSnippets();
      
      expect(Array.isArray(allSnippets)).toBe(true);
      expect(allSnippets.length).toBe(Object.keys(SNIPPETS).length);
      
      allSnippets.forEach(item => {
        expect(item).toHaveProperty("label");
        expect(item).toHaveProperty("kind", CompletionItemKind.Snippet);
        expect(item).toHaveProperty("insertTextFormat", InsertTextFormat.Snippet);
        expect(item).toHaveProperty("documentation");
        expect(item).toHaveProperty("data");
      });
    });
  });

  describe("getSnippetsForContext", () => {
    it("should return an array of completion items for the given context", () => {
      const snippets = getSnippetsForContext("view");
      const allSnippets = getAllSnippets();
      expect(snippets.map(s=>s.label)).toEqual(allSnippets.filter(s=>SNIPPETS[s.data.name].where.includes("view")).map(s=>s.label));
    });
  });
}); 