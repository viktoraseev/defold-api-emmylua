---Resource
---Functions for managing resource types.
---@class dmResource
dmResource = {}
---Adds a file to the resource system
---Any request for this path will go through any existing mounts first.
---If you wish to provide file overrides, please use the LiveUpdate feature for that.
---The file isn't persisted between sessions.
---@param factory HResourceFactory Factory handle
---@param path const char* The path of the resource
---@param size uint32_t The size of the resource (in bytes)
---@param resource const void* The resource payload
---@return ResourceResult RESULT_OK on success
function AddFile(factory, path, size, resource) end

---Function called when a resource has been reloaded.
function FReloadedCallback() end

---Function called when a resource has been reloaded.
function FResourceReloadedCallback() end

---Get a resource from factory
---@param factory HResourceFactory Factory handle
---@param name const char* Resource name
---@param resource void** Created resource
---@return ResourceResult RESULT_OK on success
function Get(factory, name, resource) end

---Get a resource from factory
---@param factory HResourceFactory Factory handle
---@param name dmhash_t Resource name
---@param resource void** Created resource
---@return ResourceResult RESULT_OK on success
function GetByHash(factory, name, resource) end

---Get resource descriptor from resource (name)
---@param factory HResourceFactory Factory handle
---@param path dmhash_t Resource path
---@param descriptor HResourceDescriptor* Returned resource descriptor
---@return ResourceResult RESULT_OK on success
function GetDescriptor(factory, path, descriptor) end

---Get resource descriptor from resource (name)
---@param factory HResourceFactory Factory handle
---@param path_hash dmhash_t Resource path hash
---@param descriptor HResourceDescriptor* Returned resource descriptor
---@return ResourceResult RESULT_OK on success
function GetDescriptorByHash(factory, path_hash, descriptor) end

---Returns the canonical path hash of a resource
---@param factory HResourceFactory Factory handle
---@param resource void* The resource pointer
---@param hash dmhash_t* (out) The path hash of the resource
---@return ResourceResult RESULT_OK on success
function GetPath(factory, resource, hash) end

---Get raw resource data. Unregistered resources can be loaded with this function.
---If successful, the returned resource data must be deallocated with free()
---@param factory HResourceFactory Factory handle
---@param name dmhash_t Resource name
---@param resource void** Created resource
---@param resource_size uint32_t* Resource size
---@return ResourceResult RESULT_OK on success
function GetRaw(factory, name, resource, resource_size) end

---Hint the preloader what to load before Create is called on the resource.
---The resources are not guaranteed to be loaded before Create is called.
---This function can be called from a worker thread.
---@param preloader dmResource::HResourcePreloadHintInfo Preloader handle
---@param path const char* Resource path
---@return bool if successfully invoking preloader.
function PreloadHint(preloader, path) end

---Release resource
---@param factory HResourceFactory Factory handle
---@param resource void* Resource pointer
function Release(factory, resource) end

---Removes a previously registered file from the resource system
---@param factory HResourceFactory Factory handle
---@param path const char* The path of the resource
---@return ResourceResult RESULT_OK on success
function RemoveFile(factory, path) end

---Adds a file to the resource system
---Any request for this path will go through any existing mounts first.
---If you wish to provide file overrides, please use the LiveUpdate feature for that.
---The file isn't persisted between sessions.
---@param factory HResourceFactory Factory handle
---@param path const char* The path of the resource
---@param size uint32_t The size of the resource (in bytes)
---@param resource const void* The resource payload
---@return ResourceResult RESULT_OK on success
function ResourceAddFile(factory, path, size, resource) end

---Parameters to ResourceCreate function of the resource type
function ResourceCreateParams() end

---Parameters to ResourceDestroy function of the resource type
function ResourceDestroyParams() end

---Get a resource from factory
---@param factory HResourceFactory Factory handle
---@param name const char* Resource name
---@param resource void** Created resource
---@return ResourceResult RESULT_OK on success
function ResourceGet(factory, name, resource) end

---Get a resource from factory
---@param factory HResourceFactory Factory handle
---@param name dmhash_t Resource name
---@param resource void** Created resource
---@return ResourceResult RESULT_OK on success
function ResourceGetByHash(factory, name, resource) end

---Returns the canonical path hash of a resource
---@param factory HResourceFactory Factory handle
---@param resource void* The resource pointer
---@param hash dmhash_t* (out) The path hash of the resource
---@return ResourceResult RESULT_OK on success
function ResourceGetPath(factory, resource, hash) end

---Get raw resource data. Unregistered resources can be loaded with this function.
---If successful, the returned resource data must be deallocated with free()
---@param factory HResourceFactory Factory handle
---@param name dmhash_t Resource name
---@param resource void** Created resource
---@param resource_size uint32_t* Resource size
---@return ResourceResult RESULT_OK on success
function ResourceGetRaw(factory, name, resource, resource_size) end

---Parameters to ResourcePostCreate function of the resource type
function ResourcePostCreateParams() end

---Hint the preloader what to load before Create is called on the resource.
---The resources are not guaranteed to be loaded before Create is called.
---This function can be called from a worker thread.
---@param preloader dmResource::HResourcePreloadHintInfo Preloader handle
---@param path const char* Resource path
---@return bool if successfully invoking preloader.
function ResourcePreloadHint(preloader, path) end

---Parameters to ResourcePreload function of the resource type
function ResourcePreloadParams() end

---Parameters to ResourceRecreate function of the resource type
function ResourceRecreateParams() end

---Registers a custom resource decryption function
---@param decrypt_resource dmResource::FDecryptResource The decryption function
function ResourceRegisterDecryptionFunction(decrypt_resource) end

---Release resource
---@param factory HResourceFactory Factory handle
---@param resource void* Resource pointer
function ResourceRelease(factory, resource) end

---Parameters to ResourceReloaded function of the resource type
function ResourceReloadedParams() end

---Parameters to ResourceReloaded function of the resource type
function ResourceReloadedParams() end

---Removes a previously registered file from the resource system
---@param factory HResourceFactory Factory handle
---@param path const char* The path of the resource
---@return ResourceResult RESULT_OK on success
function ResourceRemoveFile(factory, path) end

---Resource type creator desc byte size declaration.
---The registered description data passeed to ResourceRegisterTypeCreatorDesc must be of at least this size.
function ResourceTypeCreatorDescBufferSize() end




return dmResource