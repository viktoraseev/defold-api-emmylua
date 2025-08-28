---
---
---@class 
 = {}
---Asynchronoously adds more glyphs to a .fontc resource
---@param path string|hash The path to the .fontc resource
---@param text string A string with unique unicode characters to be loaded
---@param callback function(self, request_id, result, errstring) (optional) A callback function that is called after the request is finished
---@return number Returns the asynchronous request id
function font.add_glyphs(path, text, callback) end

---Removes glyphs from the font
---@param path string|hash The path to the .fontc resource
---@param text string A string with unique unicode characters to be removed
function font.remove_glyphs(path, text) end




return 