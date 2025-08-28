---Image API documentation
---Functions for creating image objects.
---@class image
image = {}
---Load image (PNG or JPEG) from buffer.
---@param buffer string image data buffer
---@param options table An optional table containing parameters for loading the image. Supported entries:
---@return table|nil object or nil if loading fails. The object is a table with the following fields:
function image.load(buffer, options) end

---Load image (PNG or JPEG) from a string buffer.
---@param buffer string image data buffer
---@param options table An optional table containing parameters for loading the image. Supported entries:
---@return table|nil object or nil if loading fails. The object is a table with the following fields:
function image.load_buffer(buffer, options) end




return image