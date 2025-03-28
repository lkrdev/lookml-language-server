declare module "lookml-parser" {
  /**
   * Parse LookML files into a structured Project object
   * @param filePaths Array of file paths to parse
   * @param options Parsing options
   */
  export function parseFiles(
    filePaths: string[] | string,
    options?: ParseOptions
  ): Promise<Project>;

  /**
   * Options for parsing LookML files
   */
  export interface ParseOptions {
    /** Models to include in the parse */
    includeModelNames?: string[];
    /** Whether to follow file includes */
    followIncludes?: boolean;
    /** Base path for resolving includes */
    basePath?: string;
    /** Whether to validate SQL in the LookML */
    validateSql?: boolean;
    /** Connection name to use for SQL validation */
    connectionName?: string;
    /** Custom parser settings */
    parserSettings?: Record<string, any>;
    /** Custom logger */
    logger?: any;
  }

  /**
   * The main Project structure containing all parsed LookML
   */
  export interface Project {
    /** Map of view name to View object */
    views?: Record<string, View>;
    /** Map of model name to Model object */
    models?: Record<string, Model>;
    /** Array of parsing errors */
    errors?: LookMLError[];
    /** Map of file paths to their parsed content */
    files?: Record<string, any>;
    /** Information about constants defined in the project */
    constants?: Record<string, any>;
    /** Map of view name to source file path */
    viewSources?: Record<string, string>;
    /** Project manifest data */
    manifest?: any;
  }

  /**
   * Represents a single parsing error
   */
  export interface LookMLError {
    /** Error message */
    message: string;
    /** File path where the error occurred */
    filePath?: string;
    /** Line number where the error occurred */
    line?: number;
    /** Character position where the error occurred */
    character?: number;
    /** Error code */
    code?: string;
    /** Error severity */
    severity?: 'error' | 'warning' | 'info';
    /** The source of the error */
    source?: string;
  }

  /**
   * Represents a LookML view
   */
  export interface View {
    /** Name of the view */
    name?: string;
    /** Source file path */
    _file_path?: string;
    /** Name of the view that this view extends */
    extends?: string;
    /** SQL table name */
    sql_table_name?: string;
    /** View label */
    label?: string;
    /** Whether the view is derived */
    derived_table?: DerivedTable;
    /** Map of dimension name to Dimension */
    dimensions?: Record<string, Dimension>;
    /** Map of measure name to Measure */
    measures?: Record<string, Measure>;
    /** Map of filter name to Filter */
    filters?: Record<string, Filter>;
    /** Map of parameter name to Parameter */
    parameters?: Record<string, Parameter>;
    /** Set of fields allowed in drill_fields */
    drill_fields?: string[];
    /** Description of the view */
    description?: string;
    /** Raw LookML document */
    _document?: any;
    /** Additional view properties */
    [key: string]: any;
  }

  /**
   * Definition for a derived table
   */
  export interface DerivedTable {
    /** SQL for the derived table */
    sql?: string;
    /** Materialization setting */
    materialization?: {
      /** Materialization type */
      datagroup_trigger?: string;
      sql_trigger_value?: string;
      increment_key?: string;
      increment_offset?: number;
      persist_for?: string;
    };
    /** Derived table type */
    derived_table_type?: string;
    /** Source for derived table */
    explore_source?: {
      name?: string;
      [key: string]: any;
    };
    /** Additional derived table properties */
    [key: string]: any;
  }

  /**
   * Represents a LookML dimension
   */
  export interface Dimension {
    /** Dimension name */
    name?: string;
    /** Data type */
    type?: string;
    /** SQL expression */
    sql?: string;
    /** Primary key flag */
    primary_key?: boolean;
    /** Dimension label */
    label?: string;
    /** Dimension group type */
    group?: string;
    /** Dimension description */
    description?: string;
    /** Drill fields */
    drill_fields?: string[];
    /** Hidden flag */
    hidden?: boolean;
    /** Value format */
    value_format?: string;
    /** Value format name */
    value_format_name?: string;
    /** Additional dimension properties */
    [key: string]: any;
  }

  /**
   * Represents a LookML measure
   */
  export interface Measure {
    /** Measure name */
    name?: string;
    /** Measure type */
    type?: string;
    /** SQL expression */
    sql?: string;
    /** Measure label */
    label?: string;
    /** Measure description */
    description?: string;
    /** Drill fields */
    drill_fields?: string[];
    /** Hidden flag */
    hidden?: boolean;
    /** Filters applied to the measure */
    filters?: Record<string, string>;
    /** Value format */
    value_format?: string;
    /** Value format name */
    value_format_name?: string;
    /** Additional measure properties */
    [key: string]: any;
  }

  /**
   * Represents a LookML filter
   */
  export interface Filter {
    /** Filter name */
    name?: string;
    /** Filter type */
    type?: string;
    /** SQL expression */
    sql?: string;
    /** Filter label */
    label?: string;
    /** Filter description */
    description?: string;
    /** Hidden flag */
    hidden?: boolean;
    /** Default value */
    default_value?: string;
    /** Allow multiple values */
    allow_multiple_values?: boolean;
    /** Required flag */
    required?: boolean;
    /** Additional filter properties */
    [key: string]: any;
  }

  /**
   * Represents a LookML parameter
   */
  export interface Parameter {
    /** Parameter name */
    name?: string;
    /** Parameter type */
    type?: string;
    /** Default value */
    default_value?: string;
    /** Parameter label */
    label?: string;
    /** Parameter description */
    description?: string;
    /** Hidden flag */
    hidden?: boolean;
    /** Required flag */
    required?: boolean;
    /** Allowed values */
    allowed_values?: {
      label: string;
      value: string;
    }[];
    /** Additional parameter properties */
    [key: string]: any;
  }

  /**
   * Represents a LookML model
   */
  export interface Model {
    /** Model name */
    name?: string;
    /** Source file path */
    _file_path?: string;
    /** Connection name */
    connection?: string;
    /** Files included in this model */
    includes?: string[];
    /** Map of explore name to Explore */
    explores?: Record<string, Explore>;
    /** Fiscal month offset */
    fiscal_month_offset?: number;
    /** Week start day */
    week_start_day?: string;
    /** Case sensitive flag */
    case_sensitive?: boolean;
    /** Additional model properties */
    [key: string]: any;
  }

  /**
   * Represents a LookML explore
   */
  export interface Explore {
    /** Explore name */
    name?: string;
    /** View name this explore is based on */
    from?: string;
    /** Explore label */
    label?: string;
    /** View name (older syntax) */
    view_name?: string;
    /** Explore description */
    description?: string;
    /** Fields to hide by default */
    fields?: {
      /** Fields to always include */
      always_include?: string[];
      /** Fields to exclude */
      exclude?: string[];
    };
    /** Map of join name to Join */
    joins?: Record<string, Join>;
    /** SQL always where condition */
    always_where?: string;
    /** SQL always filter */
    always_filter?: {
      filters: Record<string, string>;
    };
    /** Access filters */
    access_filter?: {
      field: string;
      user_attribute: string;
    }[];
    /** Conditionally filter */
    conditionally_filter?: {
      filters: Record<string, string>;
      unless?: string[];
    };
    /** Hidden flag */
    hidden?: boolean;
    /** Additional explore properties */
    [key: string]: any;
  }

  /**
   * Represents a LookML join
   */
  export interface Join {
    /** Join name */
    name?: string;
    /** View name being joined */
    from?: string;
    /** View name (older syntax) */
    view_name?: string;
    /** SQL ON clause */
    sql_on?: string;
    /** Relationship type */
    relationship?: 'one_to_one' | 'many_to_one' | 'one_to_many' | 'many_to_many';
    /** Fields to include */
    fields?: string[];
    /** Join type */
    type?: 'left_outer' | 'full_outer' | 'inner' | 'cross';
    /** Required access grants */
    required_access_grants?: string[];
    /** SQL foreign key */
    foreign_key?: string;
    /** SQL table name */
    sql_table_name?: string;
    /** Additional join properties */
    [key: string]: any;
  }
}