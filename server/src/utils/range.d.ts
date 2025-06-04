export declare function ensureMinRangeLength(range: {
    start: {
        line: number;
        character: number;
    };
    end: {
        line: number;
        character: number;
    };
}, minLength?: number): {
    start: {
        line: number;
        character: number;
    };
    end: {
        line: number;
        character: number;
    };
};
