declare module "lookml-parser" {
    export type LookmlValue = string | number | boolean | LookmlObject | LookmlValue[];

    export interface LookmlObject {
        $file_name?: string;
        $file_path?: string;
        $file_rel?: string;
        $file_type?: string;
        $strings?: any;
        [key: string]: LookmlValue;
    }

    export interface LookmlDimensionGroup extends LookmlObject {
        type?: 'time' | 'duration' | string;
        sql?: string;
        timeframes?: string[];
        datatype?: string;
        convert_tz?: boolean;
        label?: string;
        description?: string;
        hidden?: boolean;
        group_label?: string;
        value_format_name?: string;
        tags?: string[];
    }

    export interface LookmlDimension extends LookmlObject {
        type?: string;
        sql?: string;
        label?: string;
        description?: string;
        group_label?: string;
        hidden?: boolean;
        primary_key?: boolean;
        value_format_name?: string;
        tier?: string;
        drill_fields?: string[];
        tags?: string[];
    }

    export interface LookmlMeasure extends LookmlObject {
        type?: string;
        sql?: string;
        label?: string;
        description?: string;
        value_format_name?: string;
        hidden?: boolean;
        group_label?: string;
        filters?: Record<string, string>;
        drill_fields?: string[];
        tags?: string[];
    }

    export interface LookmlJoin extends LookmlObject {
        type?: 'left_outer' | 'inner' | 'full_outer' | string;
        sql_on?: string;
        relationship?: 'one_to_one' | 'one_to_many' | 'many_to_one' | string;
        sql_where?: string;
        sql_having?: string;
        required_joins?: string[];
        fields?: string[];
        foreign_key?: string;
        from?: string;
        view?: string;
        outer_only?: boolean;
        relationship_type?: string;
        tags?: string[];
    }

    export interface LookmlView extends LookmlObject {
        sql_table_name?: string;
        label?: string;
        description?: string;
        dimension?: Record<string, LookmlDimension>;
        dimension_group?: Record<string, LookmlObject>;
        measure?: Record<string, LookmlMeasure>;
        filter?: Record<string, LookmlObject>;
        set?: Record<string, LookmlObject>;
        derived_table?: Record<string, LookmlObject>;
        extension?: boolean;
        extends?: string | string[];
        tags?: string[];
        access_filter?: Record<string, LookmlObject>;
    }

    export interface LookmlExplore extends LookmlObject {
        label?: string;
        description?: string;
        hidden?: boolean;
        from?: string;
        extends?: string | string[];
        extension?: boolean;
        sql_always_where?: string;
        sql_always_having?: string;
        access_filter?: Record<string, LookmlObject>;
        always_filter?: Record<string, LookmlObject>;
        join?: Record<string, LookmlJoin>;
        set?: Record<string, LookmlObject>;
        tags?: string[];
        group_label?: string;
    }

    export interface LookmlModel extends LookmlObject {
        label?: string;
        include?: string | string[];
        explore?: Record<string, LookmlExplore>;
        access_filter?: Record<string, LookmlObject>;
        extension?: boolean;
        sets?: Record<string, LookmlObject>;
        parameters?: Record<string, LookmlObject>;
        tags?: string[];
    }

    export interface LookmlManifest extends LookmlObject {
        project_name?: string;
        application?: string;
        includes?: string[];
        timezone?: string;
        localization_settings?: LookmlObject;
        parameter?: Record<string, LookmlObject>;
    }

    export interface LookmlDashboard extends LookmlObject {
        title?: string;
        layout?: LookmlObject;
        element?: Record<string, LookmlObject>;
        filter?: Record<string, LookmlObject>;
        alert?: Record<string, LookmlObject>;
        label?: string;
        description?: string;
        tags?: string[];
    }

    export interface LookmlViewFile extends LookmlObject {
        view: Record<string, LookmlView>;
    }

    export interface LookmlModelFile extends LookmlObject {
        model: Record<string, LookmlModel>;
    }

    export interface LookmlExploreFile extends LookmlObject {
        explore: Record<string, LookmlExplore>;
    }

    export interface LookmlManifestFile extends LookmlObject {
        manifest: Record<string, LookmlManifest>;
    }

    export interface LookmlDashboardFile extends LookmlObject {
        dashboard: Record<string, LookmlDashboard>;
    }

    export type LookmlFile =
        | LookmlViewFile
        | LookmlModelFile
        | LookmlExploreFile
        | LookmlManifestFile
        | LookmlDashboardFile
        | LookmlObject;

    export interface LookmlCollectionByType {
        model?: Record<string, LookmlModelFile>;
        view?: Record<string, LookmlViewFile>;
        explore?: Record<string, LookmlExploreFile>;
        manifest?: Record<string, LookmlManifestFile>;
        dashboard?: Record<string, LookmlDashboardFile>;
        [fileType: string]: Record<string, LookmlFile> | undefined;
    }

    export interface TransformOptions {
        s?: boolean;
        x?: boolean;
        f?: boolean;
        [flag: string]: boolean | undefined;
    }

    export interface ParseFilesOptions {
        source: string;
        fileOutput?: 'by-type' | 'by-name' | 'array';
        transformations?: TransformOptions;
        globOptions?: object;
        readFileOptions?: object;
        readFileConcurrency?: number;
        console?: Console;
        conditionalComment?: string;
    }

    export function parse(lkml: string): LookmlObject;

    export function parseFiles(options: ParseFilesOptions & { fileOutput?: 'by-type' }): Promise<LookmlCollectionByType>;
    export function parseFiles(options: ParseFilesOptions & { fileOutput: 'by-name' }): Promise<Record<string, LookmlFile>>;
    export function parseFiles(options: ParseFilesOptions & { fileOutput: 'array' }): Promise<LookmlFile[]>;
    export function parseFiles(options: ParseFilesOptions): Promise<LookmlCollectionByType | Record<string, LookmlFile> | LookmlFile[]>;
}