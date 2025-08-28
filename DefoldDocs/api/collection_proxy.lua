---Collection proxy API documentation
---Messages for controlling and interacting with collection proxies
---which are used to dynamically load collections into the runtime.
---@class collectionproxy
collectionproxy = {}
---return an indexed table of resources for a collection proxy where the
---referenced collection has been excluded using LiveUpdate. Each entry is a
---hexadecimal string that represents the data of the specific resource.
---This representation corresponds with the filename for each individual
---resource that is exported when you bundle an application with LiveUpdate
---functionality.
---@param collectionproxy url the collectionproxy to check for resources.
---@return table the resources, or an empty list if the collection was not excluded.
function collectionproxy.get_resources(collectionproxy) end

---return an array of missing resources for a collection proxy. Each
---entry is a hexadecimal string that represents the data of the specific
---resource. This representation corresponds with the filename for each
---individual resource that is exported when you bundle an application with
---LiveUpdate functionality. It should be considered good practise to always
---check whether or not there are any missing resources in a collection proxy
---before attempting to load the collection proxy.
---@param collectionproxy url the collectionproxy to check for missing resources.
---@return table the missing resources
function collectionproxy.missing_resources(collectionproxy) end

---The collection should be loaded by the collection proxy.
---Setting the collection to "nil" will revert it back to the original collection.
---The collection proxy shouldn't be loaded and should have the 'Exclude' checkbox checked.
---This functionality is designed to simplify the management of Live Update resources.
---@param url string|hash|url the collection proxy component
---@param prototype string|nil the path to the new collection, or nil
---@return boolean collection change was successful
---@return number one of the collectionproxy.RESULT_* codes if unsuccessful
function collectionproxy.set_collection(url, prototype) end




return collectionproxy