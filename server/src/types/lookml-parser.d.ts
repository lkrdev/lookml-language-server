declare module "lookml-parser" {
    export type LookmlValue = string | number | boolean | LookmlObject | LookmlValue[];

    export interface LookmlFile extends LookmlFileAttributes {
        view?: Record<string, LookmlView>;
        model?: Record<string, LookmlModel>;
        explore?: Record<string, LookmlExplore>;
        manifest?: Record<string, LookmlManifest>;
        dashboard?: Record<string, LookmlDashboard>;
    }

    export interface LookmlProject extends LookmlFileAttributes {
        file: Record<string, LookmlFile>;
    }

    export interface LookmlFileAttributes {
        $file_name?: string;
        $file_path?: string;
        $file_rel?: string;
        $file_type?: 'view' | 'model' | 'explore' | 'manifest' | 'dashboard';
        $strings?: any;
    }

    export interface LookmlDimensionGroup {
        $name?: string;
        convert_tz?: boolean;
        datatype?: string;
        description?: string;
        group_label?: string;
        hidden?: boolean;
        label?: string;
        sql?: string;
        tags?: string[];
        timeframes?: string[];
        type: 'time' | 'duration';
        value_format_name?: string;
    }

    export interface LookmlDimension {
        $name?: string;
        description?: string;
        drill_fields?: string[];
        group_label?: string;
        hidden?: boolean;
        label?: string;
        primary_key?: boolean;
        sql?: string;
        tags?: string[];
        tier?: string;
        type: string;
        value_format_name?: string;
    }

    export interface LookmlMeasure {
        $name?: string;
        description?: string;
        drill_fields?: string[];
        filters?: Record<string, string>;
        group_label?: string;
        hidden?: boolean;
        label?: string;
        sql?: string;
        tags?: string[];
        type: string;
        value_format_name?: string;
    }

    export interface LookmlJoin {
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

    export interface LookmlView {
        $name?: string;
        sql_table_name?: string;
        label?: string;
        description?: string;
        dimension?: Record<string, LookmlDimension>;
        dimension_group?: Record<string, LookmlDimensionGroup>;
        measure?: Record<string, LookmlMeasure>;
        filter?: Record<string, LookmlObject>;
        set?: Record<string, LookmlObject>;
        derived_table?: Record<string, LookmlObject>;
        extension?: boolean;
        extends?: string | string[];
        tags?: string[];
        access_filter?: Record<string, LookmlObject>;
    }

    export interface LookmlViewWithFileInfo {
        view: LookmlView;
        file: LookmlFileAttributes;
    }

    export interface LookmlExploreWithFileInfo {
        explore: LookmlExplore;
        file: LookmlFileAttributes;
    }

    export interface LookmlModelWithFileInfo {
        model: LookmlModel;
        file: LookmlFileAttributes;
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

    export type LookmlViewFile = LookmlFile["view"];

    export type LookmlModelFile = LookmlFile["model"];

    export type LookmlExploreFile = LookmlFile["explore"];

    export type LookmlManifestFile = LookmlFile["manifest"];

    export type LookmlDashboardFile = LookmlFile["dashboard"];

    export type LookmlFile =
        | LookmlViewFile
        | LookmlModelFile
        | LookmlExploreFile
        | LookmlManifestFile
        | LookmlDashboardFile
        | LookmlObject;

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

    export function parseFiles(options: ParseFilesOptions & { fileOutput?: 'by-type' }): Promise<LookmlProject>;
    export function parseFiles(options: ParseFilesOptions & { fileOutput: 'by-name' }): Promise<LookmlProject>;
    export function parseFiles(options: ParseFilesOptions & { fileOutput: 'array' }): Promise<LookmlProject[]>;
    export function parseFiles(options: ParseFilesOptions): Promise<LookmlCollectionByType | Record<string, LookmlProject> | LookmlProject[]>;
}