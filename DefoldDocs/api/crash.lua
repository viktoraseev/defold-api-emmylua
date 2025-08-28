---Crash API documentation
---Native crash logging functions and constants.
---@class crash
crash = {}
---A table is returned containing the addresses of the call stack.
---@param handle number crash dump handle
---@return table table containing the backtrace
function crash.get_backtrace(handle) end

---The format of read text blob is platform specific
---and not guaranteed
---but can be useful for manual inspection.
---@param handle number crash dump handle
---@return string string with the platform specific data
function crash.get_extra_data(handle) end

---The function returns a table containing entries with sub-tables that
---have fields 'name' and 'address' set for all loaded modules.
---@param handle number crash dump handle
---@return table module table
function crash.get_modules(handle) end

---read signal number from a crash report
---@param handle number crash dump handle
---@return number signal number
function crash.get_signum(handle) end

---reads a system field from a loaded crash dump
---@param handle number crash dump handle
---@param index number system field enum. Must be less than crash.SYSFIELD_MAX <>
---@return string|nil value recorded in the crash dump, or nil if it didn't exist
function crash.get_sys_field(handle, index) end

---reads user field from a loaded crash dump
---@param handle number crash dump handle
---@param index number user data slot index
---@return string user data value recorded in the crash dump
function crash.get_user_field(handle, index) end

---The crash dump will be removed from disk upon a successful
---load, so loading is one-shot.
---@return number|nil handle to the loaded dump, or nil if no dump was found
function crash.load_previous() end

---releases a previously loaded crash dump
---@param handle number handle to loaded crash dump
function crash.release(handle) end

---Crashes occuring before the path is set will be stored to a default engine location.
---@param path string file path to use
function crash.set_file_path(path) end

---Store a user value that will get written to a crash dump when
---a crash occurs. This can be user id:s, breadcrumb data etc.
---There are 32 slots indexed from 0. Each slot stores at most 255 characters.
---@param index number slot index. 0-indexed
---@param value string string value to store
function crash.set_user_field(index, value) end

---Performs the same steps as if a crash had just occured but
---allows the program to continue.
---The generated dump can be read by crash.load_previous
function crash.write_dump() end




return crash