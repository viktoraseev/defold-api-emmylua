---Editor scripting documentation
---Editor scripting documentation
---@class editor
editor = {}
---Run bob the builder program
---For the full documentation of the available commands and options, see the bob manual <https://defold.com/manuals/bob/>.
---@param options table table of command line options for bob, without the leading dashes (--). You can use snake_case instead of kebab-case for option keys. Only long option names are supported (i.e. output, not o). Supported value types are strings, integers and booleans. If an option takes no arguments, use a boolean (i.e. true). If an option may be repeated, you can use an array of values.
---@param ...commands string bob commands, e.g. "resolve" or "build"
function editor.bob(options, ...commands) end

---Open a URL in the default browser or a registered application
---@param url string http(s) or file URL
function editor.browse(url) end

---error message the signifies bundle abort that is not an error
editor.bundle.abort_message = nil
---Immutably set a key to value in a table
---@param table table the table
---@param key any the key
---@param value any the value
---@return table New table if it should be changed by assoc, or the input table otherwise
function editor.bundle.assoc(table, key, value) end

---Immutably set a value to a nested path in a table
---@param table table the table
---@param keys any[ ] the keys
---@param value any the value
---@return table New table if it should be changed by assoc_in, or the input table otherwise
function editor.bundle.assoc_in(table, keys, value) end

---Helper function for creating a check box component
---@param config table config table
---@param set_config function config setter
---@param key string config key for the selected value
---@param text string check box label text
---@param rest_props table extra props for editor.ui.check_box
---@return component UI component
function editor.bundle.check_box(config, set_config, key, text, rest_props) end

---Create a grid row for the common boolean settings
---@param config table config map with common boolean keys
---@param set_config function config setter
---@return component[ ] grid row
function editor.bundle.check_boxes_grid_row(config, set_config) end

---Create bundle command definition
---@param label string Command label, as presented in the UI
---@param id string Command id, e.g. "bundle-my-platform", used for re-bundling
---@param fn function bundle function, will receive a requested_dialog boolean argument
---@param rest table extra keys for the command definition, e.g. active
function editor.bundle.command(label, id, fn, rest) end

---Create a grid row for the common variant setting
---@param config table config map with variant key
---@param set_config function config setter
---@return component[ ] grid row
function editor.bundle.common_variant_grid_row(config, set_config) end

---prefs schema for common bundle variants
editor.bundle.common_variant_schema = nil
---Get bundle config, optionally showing a dialog to edit the config
---@param requested_dialog boolean whether the user explicitly requested a dialog
---@param prefs_key string preference key used for loading the bundle config
---@param dialog_component component UI component for the dialog, will receive config and (optional) errors props
---@param errors_fn function error checking predicate, takes config as an argument; if returns truthy value, it will be passed as a prop to dialog_component
---@return any 
function editor.bundle.config(requested_dialog, prefs_key, dialog_component, errors_fn) end

---Helper function for constructing prefs schema for new bundle dialogs
---@param variant_schema schema bundle variant schema
---@param properties table|nil extra config properties
---@return schema full bundle schema, defines a project-scoped object schema with the following keys:
function editor.bundle.config_schema(variant_schema, properties) end

---Create bob bundle
---@param config table bundle config
---@param output_directory string bundle output directory
---@param extra_bob_opts table extra bob opts, presumably produced from config
function editor.bundle.create(config, output_directory, extra_bob_opts) end

---Create a grid row for the desktop variant setting
---@param config table config table with variant key
---@param set_config function config setter
---@return component[ ] grid row
function editor.bundle.desktop_variant_grid_row(config, set_config) end

---prefs schema for desktop bundle variants
editor.bundle.desktop_variant_schema = nil
---Helper function for creating a bundle dialog component
---@param heading string dialog heading text
---@param config table config map with common boolean keys
---@param hint string|nil dialog hint text
---@param error string|nil dialog error text
---@param rows component[ []] grid rows of UI elements, dialog content
---@return component UI component
function editor.bundle.dialog(heading, config, hint, error, rows) end

---Helper function for creating an external file field component
---@param config table config map with common boolean keys
---@param set_config function config setter
---@param key string config key for the set
---@param error string error message
---@param rest_props table extra props for editor.ui.external_file_field
---@return component UI component
function editor.bundle.external_file_field(config, set_config, key, error, rest_props) end

---Return a 2-element array that represents a single grid row in a bundle dialog
---@param text string|nil optional string label
---@param content component|component[ ] either a single UI component, or an array of components (will be laid out vertically)
---@return component[ ] a single grid row
function editor.bundle.grid_row(text, content) end

---Make stringifier function that first performs the label lookup in a provided table
---@param table table table from values to their corresponding string representation
---@return function stringifier function
function editor.bundle.make_to_string_lookup(table) end

---Get bundle output directory, optionally showing a directory selection dialog
---@param requested_dialog boolean whether the user explicitly requested a dialog
---@param output_subdir string output subdir, usually a platform name
function editor.bundle.output_directory(requested_dialog, output_subdir) end

---Helper function for creating a select box component
---@param config table config table
---@param set_config function config setter
---@param key string config key for the selected value
---@param options any[ ] select box options
---@param to_string function option stringifier
---@param rest_props table extra props for editor.ui.select_box
---@return component UI component
function editor.bundle.select_box(config, set_config, key, options, to_string, rest_props) end

---Helper function for creating a check box for an enum value of set config key
---@param config table config map with common boolean keys
---@param set_config function config setter
---@param key string config key for the set
---@param element string enum value in the set
---@param text string check box label text
---@param error string error message
---@return component UI component
function editor.bundle.set_element_check_box(config, set_config, key, element, text, error) end

---Create a grid row for the texture compression setting
---@param config table config map with texture_compression key
---@param set_config function config setter
---@return component[ ] grid row
function editor.bundle.texture_compression_grid_row(config, set_config) end

---Check if editor.tx.add() (as well as editor.tx.clear() and editor.tx.remove()) transaction with this property won't throw an error
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@return boolean 
function editor.can_add(node, property) end

---Check if you can get this property so editor.get() won't throw an error
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@return boolean 
function editor.can_get(node, property) end

---Check if editor.tx.reorder() transaction with this property won't throw an error
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@return boolean 
function editor.can_reorder(node, property) end

---Check if editor.tx.reset() transaction with this property won't throw an error
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@return boolean 
function editor.can_reset(node, property) end

---Check if editor.tx.set() transaction with this property won't throw an error
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@return boolean 
function editor.can_set(node, property) end

---Create an editor command
---@param opts table A table with the following keys:
---@return command 
function editor.command(opts) end

---Create a directory if it does not exist, and all non-existent parent directories.
---Throws an error if the directory can't be created.
---@param resource_path string Resource path (starting with /)
function editor.create_directory(resource_path) end

---Create resources (including non-existent parent directories).
---Throws an error if any of the provided resource paths already exist
---@param resources string[ ] Array of resource paths (strings starting with /) or resource definitions, lua tables with the following keys:
function editor.create_resources(resources) end

---Delete a directory if it exists, and all existent child directories and files.
---Throws an error if the directory can't be deleted.
---@param resource_path string Resource path (starting with /)
function editor.delete_directory(resource_path) end

---a string, SHA1 of Defold editor
editor.editor_sha1 = nil
---a string, SHA1 of Defold engine
editor.engine_sha1 = nil
---Execute a shell command.
---Any shell command arguments should be provided as separate argument strings to this function. If the exit code of the process is not zero, this function throws error. By default, the function returns nil, but it can be configured to capture the output of the shell command as string and return it — set out option to "capture" to do it.By default, after this shell command is executed, the editor will reload resources from disk.
---@param command string Shell command name to execute
--- ... string Optional shell command arguments
---@param options table Optional options table. Supported entries:                                            
---@return nil|string If out option is set to "capture", returns the output as string with trimmed trailing newlines. Otherwise, returns nil.
function editor.execute(command, ..., options) end

---Query information about file system path
---@param path string External file path, resolved against project root if relative
---@return table A table with the following keys:
function editor.external_file_attributes(path) end

---Get a value of a node property inside the editor.
---Some properties might be read-only, and some might be unavailable in different contexts, so you should use editor.can_get() before reading them and editor.can_set() before making the editor set them.
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@return any property value
function editor.get(node, property) end

---Open a file in a registered application
---@param path string file path
function editor.open_external_file(path) end

---editor platform id.
editor.platform = nil
---"global"
editor.prefs.SCOPE.GLOBAL = nil
---"project"
editor.prefs.SCOPE.PROJECT = nil
---Get preference value
---The schema for the preference value should be defined beforehand.
---@param key string dot-separated preference key path
---@return any current pref value or default if a schema for the key path exists, nil otherwise
function editor.prefs.get(key) end

---Check if preference value is explicitly set
---The schema for the preference value should be defined beforehand.
---@param key string dot-separated preference key path
---@return boolean flag indicating if the value is explicitly set
function editor.prefs.is_set(key) end

---array schema
---@param opts table Required opts: 
---@return schema Prefs schema
function editor.prefs.schema.array(opts) end

---boolean schema
---@param opts table Optional opts: 
---@return schema Prefs schema
function editor.prefs.schema.boolean(opts) end

---enum value schema
---@param opts table Required opts: 
---@return schema Prefs schema
function editor.prefs.schema.enum(opts) end

---integer schema
---@param opts table Optional opts: 
---@return schema Prefs schema
function editor.prefs.schema.integer(opts) end

---keyword schema
---A keyword is a short string that is interned within the editor runtime, useful e.g. for identifiers
---@param opts table Optional opts: 
---@return schema Prefs schema
function editor.prefs.schema.keyword(opts) end

---floating-point number schema
---@param opts table Optional opts: 
---@return schema Prefs schema
function editor.prefs.schema.number(opts) end

---heterogeneous object schema
---@param opts table Required opts: 
---@return schema Prefs schema
function editor.prefs.schema.object(opts) end

---homogeneous object schema
---@param opts table Required opts: 
---@return schema Prefs schema
function editor.prefs.schema.object_of(opts) end

---password schema
---A password is a string that is encrypted when stored in a preference file
---@param opts table Optional opts: 
---@return schema Prefs schema
function editor.prefs.schema.password(opts) end

---set schema
---Set is represented as a lua table with true values
---@param opts table Required opts: 
---@return schema Prefs schema
function editor.prefs.schema.set(opts) end

---string schema
---@param opts table Optional opts: 
---@return schema Prefs schema
function editor.prefs.schema.string(opts) end

---tuple schema
---A tuple is a fixed-length array where each item has its own defined type
---@param opts table Required opts: 
---@return schema Prefs schema
function editor.prefs.schema.tuple(opts) end

---Set preference value
---The schema for the preference value should be defined beforehand.
---@param key string dot-separated preference key path
---@param value any new pref value to set
function editor.prefs.set(key, value) end

---Query information about a project resource
---@param resource_path string Resource path (starting with /)
---@return table A table with the following keys:
function editor.resource_attributes(resource_path) end

---Persist any unsaved changes to disk
function editor.save() end

---Change the editor state in a single, undoable transaction
---@param txs transaction_step[ ] An array of transaction steps created using editor.tx.* functions
function editor.transact(txs) end

---Create a transaction step that will add a child item to a node's list property when transacted with editor.transact().
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@param value any Added item for the property, a table from property key to either a valid editor.tx.set()-able value, or an array of valid editor.tx.add()-able values
function editor.tx.add(node, property, value) end

---Create a transaction step that will remove all items from node's list property when transacted with editor.transact().
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@return transaction_step A transaction step
function editor.tx.clear(node, property) end

---Create a transaction step that will remove a child node from the node's list property when transacted with editor.transact().
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@param child_node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@return transaction_step A transaction step
function editor.tx.remove(node, property, child_node) end

---Create a transaction step that reorders child nodes in a node list defined by the property if supported (see editor.can_reorder())
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@param child_nodes table array of child nodes (the same as returned by editor.get(node, property)) in new order
---@return transaction_step A transaction step
function editor.tx.reorder(node, property, child_nodes) end

---Create a transaction step that will reset an overridden property to its default value when transacted with editor.transact().
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@return transaction_step A transaction step
function editor.tx.reset(node, property) end

---Create transaction step that will set the node's property to a supplied value when transacted with editor.transact().
---@param node string|userdata Either resource path (e.g. "/main/game.script"), or internal node id passed to the script by the editor
---@param property string Either "path", "text", or a property from the Outline view (hover the label to see its editor script name)
---@param value any A new value for the property
---@return transaction_step A transaction step
function editor.tx.set(node, property, value) end

---"bottom"
editor.ui.ALIGNMENT.BOTTOM = nil
---"bottom-left"
editor.ui.ALIGNMENT.BOTTOM_LEFT = nil
---"bottom-right"
editor.ui.ALIGNMENT.BOTTOM_RIGHT = nil
---"center"
editor.ui.ALIGNMENT.CENTER = nil
---"left"
editor.ui.ALIGNMENT.LEFT = nil
---"right"
editor.ui.ALIGNMENT.RIGHT = nil
---"top"
editor.ui.ALIGNMENT.TOP = nil
---"top-left"
editor.ui.ALIGNMENT.TOP_LEFT = nil
---"top-right"
editor.ui.ALIGNMENT.TOP_RIGHT = nil
---"error"
editor.ui.COLOR.ERROR = nil
---"hint"
editor.ui.COLOR.HINT = nil
---"override"
editor.ui.COLOR.OVERRIDE = nil
---"text"
editor.ui.COLOR.TEXT = nil
---"warning"
editor.ui.COLOR.WARNING = nil
---"dialog"
editor.ui.HEADING_STYLE.DIALOG = nil
---"form"
editor.ui.HEADING_STYLE.FORM = nil
---"h1"
editor.ui.HEADING_STYLE.H1 = nil
---"h2"
editor.ui.HEADING_STYLE.H2 = nil
---"h3"
editor.ui.HEADING_STYLE.H3 = nil
---"h4"
editor.ui.HEADING_STYLE.H4 = nil
---"h5"
editor.ui.HEADING_STYLE.H5 = nil
---"h6"
editor.ui.HEADING_STYLE.H6 = nil
---"clear"
editor.ui.ICON.CLEAR = nil
---"minus"
editor.ui.ICON.MINUS = nil
---"open-resource"
editor.ui.ICON.OPEN_RESOURCE = nil
---"plus"
editor.ui.ICON.PLUS = nil
---"error"
editor.ui.ISSUE_SEVERITY.ERROR = nil
---"warning"
editor.ui.ISSUE_SEVERITY.WARNING = nil
---"horizontal"
editor.ui.ORIENTATION.HORIZONTAL = nil
---"vertical"
editor.ui.ORIENTATION.VERTICAL = nil
---"large"
editor.ui.PADDING.LARGE = nil
---"medium"
editor.ui.PADDING.MEDIUM = nil
---"none"
editor.ui.PADDING.NONE = nil
---"small"
editor.ui.PADDING.SMALL = nil
---"large"
editor.ui.SPACING.LARGE = nil
---"medium"
editor.ui.SPACING.MEDIUM = nil
---"none"
editor.ui.SPACING.NONE = nil
---"small"
editor.ui.SPACING.SMALL = nil
---"center"
editor.ui.TEXT_ALIGNMENT.CENTER = nil
---"justify"
editor.ui.TEXT_ALIGNMENT.JUSTIFY = nil
---"left"
editor.ui.TEXT_ALIGNMENT.LEFT = nil
---"right"
editor.ui.TEXT_ALIGNMENT.RIGHT = nil
---Button with a label and/or an icon
---@param props table Optional props: 
---@return component UI component
function editor.ui.button(props) end

---Check box with a label
---@param props table Optional props: 
---@return component UI component
function editor.ui.check_box(props) end

---Convert a function to a UI component.
---The wrapped function may call any hooks functions (editor.ui.use_*), but on any function invocation, the hooks calls must be the same, and in the same order. This means that hooks should not be used inside loops and conditions or after a conditional return statement.
---The following props are supported automatically:  grow booleandetermines if the component should grow to fill available space in a horizontal or vertical layout container  row_span integerhow many rows the component spans inside a grid container, must be positive. This prop is only useful for components inside a grid container.  column_span integerhow many columns the component spans inside a grid container, must be positive. This prop is only useful for components inside a grid container.
---@param fn function function, will receive a single table of props when called
---@return function decorated component function that may be invoked with a props table create component
function editor.ui.component(fn) end

---Dialog component, a top-level window component that can't be used as a child of other components
---@param props table Required props: 
---@return component UI component
function editor.ui.dialog(props) end

---Dialog button shown in the footer of a dialog
---@param props table Required props: 
---@return component UI component
function editor.ui.dialog_button(props) end

---Input component for selecting files from the file system
---@param props table Optional props: 
---@return component UI component
function editor.ui.external_file_field(props) end

---Layout container that places its children in a 2D grid
---@param props table Optional props: 
---@return component UI component
function editor.ui.grid(props) end

---A text heading
---@param props table Optional props: 
---@return component UI component
function editor.ui.heading(props) end

---Layout container that places its children in a horizontal row one after another
---@param props table Optional props: 
---@return component UI component
function editor.ui.horizontal(props) end

---An icon from a predefined set
---@param props table Required props: 
---@return component UI component
function editor.ui.icon(props) end

---Integer input component based on a text field, reports changes on commit (Enter or focus loss)
---@param props table Optional props: 
---@return component UI component
function editor.ui.integer_field(props) end

---Label intended for use with input components
---@param props table Optional props: 
---@return component UI component
function editor.ui.label(props) end

---Number input component based on a text field, reports changes on commit (Enter or focus loss)
---@param props table Optional props: 
---@return component UI component
function editor.ui.number_field(props) end

---Open a resource, either in the editor or in a third-party app
---@param resource_path string Resource path (starting with /)
function editor.ui.open_resource(resource_path) end

---A paragraph of text
---@param props table Optional props: 
---@return component UI component
function editor.ui.paragraph(props) end

---Input component for selecting project resources
---@param props table Optional props: 
---@return component UI component
function editor.ui.resource_field(props) end

---Layout container that optionally shows scroll bars if child contents overflow the assigned bounds
---@param props table Required props: 
---@return component UI component
function editor.ui.scroll(props) end

---Dropdown select box with an array of options
---@param props table Optional props: 
---@return component UI component
function editor.ui.select_box(props) end

---Thin line for visual content separation, by default horizontal and aligned to center
---@param props table Optional props: 
---@return component UI component
function editor.ui.separator(props) end

---Show a modal dialog and await a result
---@param dialog component a component that resolves to editor.ui.dialog(...)
---@return any dialog result, the value used as a result prop in a editor.ui.dialog_button({...}) selected by the user, or nil if the dialog was closed and there was no cancel = true dialog button with result prop set
function editor.ui.show_dialog(dialog) end

---Show a modal OS directory selection dialog and await a result
---@param opts table 
---@return string|nil either absolute directory path or nil if user canceled directory selection
function editor.ui.show_external_directory_dialog(opts) end

---Show a modal OS file selection dialog and await a result
---@param opts table 
---@return string|nil either absolute file path or nil if user canceled file selection
function editor.ui.show_external_file_dialog(opts) end

---Show a modal resource selection dialog and await a result
---@param opts table 
---@return string|string[ |nil] if user made no selection, returns nil. Otherwise, if selection mode is "single", returns selected resource path; otherwise returns a non-empty array of selected resource paths.
function editor.ui.show_resource_dialog(opts) end

---String input component based on a text field, reports changes on commit (Enter or focus loss)
---@param props table Optional props: 
---@return component UI component
function editor.ui.string_field(props) end

---A hook that caches the result of a computation between re-renders.
---See editor.ui.component for hooks caveats and rules. If any of the arguments to use_memo change during a component refresh (checked with ==), the value will be recomputed.
---@param compute function function that will be used to compute the cached value
--- ... ...any args to the computation function
---@return ...any all returned values of the compute function
function editor.ui.use_memo(compute, ...) end

---A hook that adds local state to the component.
---See editor.ui.component for hooks caveats and rules. If any of the arguments to use_state change during a component refresh (checked with ==), the current state will be reset to the initial one.
---@param init any|function local state initializer, either initial data structure or function that produces the data structure
--- ... ...any used when init is a function, the args are passed to the initializer function
---@return any current local state, starts with initial state, then may be changed using the returned set_state function
---@return function function that changes the local state and causes the component to refresh. The function may be used in 2 ways:                         
function editor.ui.use_state(init, ...) end

---Layout container that places its children in a vertical column one after another
---@param props table Optional props: 
---@return component UI component
function editor.ui.vertical(props) end

---a string, version name of Defold
editor.version = nil
---Perform an HTTP request
---@param url string request URL
---@param opts table Additional request options, a table with the following keys:
---@return table HTTP response, a table with the following keys:
function http.request(url, opts) end

---Create HTTP response that will stream the content of a file defined by the path
---@param path string External file path, resolved against project root if relative
---@param status integer HTTP status code, an integer, default 200
---@param headers table&lt;string,string&gt; HTTP response headers, a table from lower-case header names to header values
---@return response HTTP response value, userdata
function http.server.external_file_response(path, status, headers) end

---Create HTTP response with a JSON value
---@param value any Any Lua value that may be represented as JSON
---@param status integer HTTP status code, an integer, default 200
---@param headers table&lt;string,string&gt; HTTP response headers, a table from lower-case header names to header values
---@return response HTTP response value, userdata
function http.server.json_response(value, status, headers) end

---editor's HTTP server local url
http.server.local_url = nil
---editor's HTTP server port
http.server.port = nil
---Create HTTP response that will stream the content of a resource defined by the resource path
---@param resource_path string Resource path (starting with /)
---@param status integer HTTP status code, an integer, default 200
---@param headers table&lt;string,string&gt; HTTP response headers, a table from lower-case header names to header values
---@return response HTTP response value, userdata
function http.server.resource_response(resource_path, status, headers) end

---Create HTTP response
---@param status integer HTTP status code, an integer, default 200
---@param headers table&lt;string,string&gt; HTTP response headers, a table from lower-case header names to header values
---@param body string HTTP response body
---@return response HTTP response value, userdata
function http.server.response(status, headers, body) end

---Create route definition for the editor's HTTP server
---@param path string HTTP URI path, starts with /; may include path patterns ({name} for a single segment and {*name} for the rest of the request path) that will be extracted from the path and provided to the handler as a part of the request
---@param method string HTTP request method, default "GET"
---@param as string Request body converter, either "string" or "json"; the body will be discarded if not specified
---@param handler function Request handler function, will receive request argument, a table with the following keys:
---@return route HTTP server route
function http.server.route(path, method, as, handler) end

---editor's HTTP server url
http.server.url = nil
---Decode JSON string to Lua value
---@param json string json data
---@param options table A table with the following keys:
function json.decode(json, options) end

---Encode Lua value to JSON string
---@param value any any Lua value that may be represented as JSON
function json.encode(value) end

---Pretty-print a Lua value
---@param value any any Lua value to pretty-print
function pprint(value) end

---Remove all tiles
---@param tiles tiles unbounded 2d grid of tiles
---@return tiles unbounded 2d grid of tiles
function tilemap.tiles.clear(tiles) end

---Get full information from a tile at a particular coordinate
---@param tiles tiles unbounded 2d grid of tiles
---@param x integer x coordinate of a tile
---@param y integer y coordinate of a tile
---@return table full tile information table with the following keys:
function tilemap.tiles.get_info(tiles, x, y) end

---Get a tile index at a particular coordinate
---@param tiles tiles unbounded 2d grid of tiles
---@param x integer x coordinate of a tile
---@param y integer y coordinate of a tile
---@return integer 1-indexed tile index of a tilemap's tilesource
function tilemap.tiles.get_tile(tiles, x, y) end

---Create an iterator over all tiles in a tiles data structure
---When iterating using for loop, each iteration returns x, y and tile index of a tile in a tile map
---@param tiles tiles unbounded 2d grid of tiles
---@return function iterator
function tilemap.tiles.iterator(tiles) end

---Create a new unbounded 2d grid data structure for storing tilemap layer tiles
---@return tiles unbounded 2d grid of tiles
function tilemap.tiles.new() end

---Remove a tile at a particular coordinate
---@param tiles tiles unbounded 2d grid of tiles
---@param x integer x coordinate of a tile
---@param y integer y coordinate of a tile
---@return tiles unbounded 2d grid of tiles
function tilemap.tiles.remove(tiles, x, y) end

---Set a tile at a particular coordinate
---@param tiles tiles unbounded 2d grid of tiles
---@param x integer x coordinate of a tile
---@param y integer y coordinate of a tile
---@param tile_or_info integer|table Either 1-indexed tile index of a tilemap's tilesource or full tile information table with the following keys:
---@return tiles unbounded 2d grid of tiles
function tilemap.tiles.set(tiles, x, y, tile_or_info) end

---"deflated" compression method
zip.METHOD.DEFLATED = nil
---"stored" compression method, i.e. no compression
zip.METHOD.STORED = nil
---Create a ZIP archive
---@param output_path string output zip file path, resolved against project root if relative
---@param opts table compression options, a table with the following keys:
---@param entries string|table entries to compress, either a string (relative path to file or folder to include) or a table with the following keys:
function zip.pack(output_path, opts, entries) end




return editor