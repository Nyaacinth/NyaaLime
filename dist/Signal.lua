--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

function __TS__ArrayForEach(arr, callbackFn)
    do
        local i = 0
        while i < #arr do
            callbackFn(_G, arr[i + 1], i, arr)
            i = i + 1
        end
    end
end

function __TS__ArrayIncludes(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    local k = fromIndex
    if fromIndex < 0 then
        k = len + fromIndex
    end
    if k < 0 then
        k = 0
    end
    for i = k, len do
        if self[i + 1] == searchElement then
            return true
        end
    end
    return false
end

function __TS__ArrayPush(arr, ...)
    local items = {...}
    for ____, item in ipairs(items) do
        arr[#arr + 1] = item
    end
    return #arr
end

function __TS__ArrayIndexOf(arr, searchElement, fromIndex)
    local len = #arr
    if len == 0 then
        return -1
    end
    local n = 0
    if fromIndex then
        n = fromIndex
    end
    if n >= len then
        return -1
    end
    local k
    if n >= 0 then
        k = n
    else
        k = len + n
        if k < 0 then
            k = 0
        end
    end
    do
        local i = k
        while i < len do
            if arr[i + 1] == searchElement then
                return i
            end
            i = i + 1
        end
    end
    return -1
end

function __TS__ArraySplice(list, ...)
    local len = #list
    local actualArgumentCount = select("#", ...)
    local start = select(1, ...)
    local deleteCount = select(2, ...)
    local actualStart
    if start < 0 then
        actualStart = math.max(len + start, 0)
    else
        actualStart = math.min(start, len)
    end
    local itemCount = math.max(actualArgumentCount - 2, 0)
    local actualDeleteCount
    if actualArgumentCount == 0 then
        actualDeleteCount = 0
    elseif actualArgumentCount == 1 then
        actualDeleteCount = len - actualStart
    else
        actualDeleteCount = math.min(
            math.max(deleteCount or 0, 0),
            len - actualStart
        )
    end
    local out = {}
    do
        local k = 0
        while k < actualDeleteCount do
            local from = actualStart + k
            if list[from + 1] then
                out[k + 1] = list[from + 1]
            end
            k = k + 1
        end
    end
    if itemCount < actualDeleteCount then
        do
            local k = actualStart
            while k < len - actualDeleteCount do
                local from = k + actualDeleteCount
                local to = k + itemCount
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k + 1
            end
        end
        do
            local k = len
            while k > len - actualDeleteCount + itemCount do
                list[k] = nil
                k = k - 1
            end
        end
    elseif itemCount > actualDeleteCount then
        do
            local k = len - actualDeleteCount
            while k > actualStart do
                local from = k + actualDeleteCount - 1
                local to = k + itemCount - 1
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k - 1
            end
        end
    end
    local j = actualStart
    for i = 3, actualArgumentCount do
        list[j + 1] = select(i, ...)
        j = j + 1
    end
    do
        local k = #list - 1
        while k >= len - actualDeleteCount + itemCount do
            list[k + 1] = nil
            k = k - 1
        end
    end
    return out
end

function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

function __TS__GetErrorStack(self, constructor)
    local level = 1
    while true do
        local info = debug.getinfo(level, "f")
        level = level + 1
        if not info then
            level = 1
            break
        elseif info.func == constructor then
            break
        end
    end
    return debug.traceback(nil, level)
end
function __TS__WrapErrorToString(self, getDescription)
    return function(self)
        local description = getDescription(self)
        local caller = debug.getinfo(3, "f")
        if _VERSION == "Lua 5.1" or caller and caller.func ~= error then
            return description
        else
            return (tostring(description) .. "\n") .. self.stack
        end
    end
end
function __TS__InitErrorClass(self, Type, name)
    Type.name = name
    return setmetatable(
        Type,
        {__call = function(____, _self, message) return __TS__New(Type, message) end}
    )
end
local ____TS__InitErrorClass_3 = __TS__InitErrorClass
local ____G_2 = _G
____class_0 = __TS__Class()
____class_0.name = ""
function ____class_0.prototype.____constructor(self, message)
    if message == nil then
        message = ""
    end
    self.message = message
    self.name = "Error"
    self.stack = __TS__GetErrorStack(_G, self.constructor.new)
    local metatable = getmetatable(self)
    if not metatable.__errorToStringPatched then
        metatable.__errorToStringPatched = true
        metatable.__tostring = __TS__WrapErrorToString(_G, metatable.__tostring)
    end
end
function ____class_0.prototype.__tostring(self)
    local ____temp_1
    if self.message ~= "" then
        ____temp_1 = (self.name .. ": ") .. self.message
    else
        ____temp_1 = self.name
    end
    return ____temp_1
end
Error = ____TS__InitErrorClass_3(____G_2, ____class_0, "Error")
for ____, errorName in ipairs({
    "RangeError",
    "ReferenceError",
    "SyntaxError",
    "TypeError",
    "URIError"
}) do
    local ____G_7 = _G
    local ____TS__InitErrorClass_6 = __TS__InitErrorClass
    local ____G_5 = _G
    local ____class_4 = __TS__Class()
    ____class_4.name = ____class_4.name
    __TS__ClassExtends(____class_4, Error)
    function ____class_4.prototype.____constructor(self, ...)
        Error.prototype.____constructor(self, ...)
        self.name = errorName
    end
    ____G_7[errorName] = ____TS__InitErrorClass_6(____G_5, ____class_4, errorName)
end

function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                __TS__New(
                    TypeError,
                    ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. "."
                ),
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    target[key] = nil
    return true
end

function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        _G.__TS__originalTraceback = debug.traceback
        debug.traceback = function(thread, message, level)
            local trace
            if thread == nil and message == nil and level == nil then
                trace = _G.__TS__originalTraceback()
            else
                trace = _G.__TS__originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local function replacer(____, file, srcFile, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap and fileSourceMap[line] then
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (srcFile .. ":") .. tostring(data)
                    end
                    return (tostring(data.file) .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            local result = string.gsub(
                trace,
                "(%S+)%.lua:(%d+)",
                function(file, line) return replacer(_G, file .. ".lua", file .. ".ts", line) end
            )
            result = string.gsub(
                result,
                "(%[string \"[^\"]+\"%]):(%d+)",
                function(file, line) return replacer(_G, file, "unknown", line) end
            )
            return result
        end
    end
end

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["347"] = 1,["348"] = 1,["349"] = 1,["351"] = 3,["352"] = 1,["353"] = 10,["354"] = 10,["355"] = 11,["356"] = 12,["357"] = 12,["358"] = 12,["359"] = 12,["360"] = 12,["361"] = 12,["362"] = 12,["364"] = 10,["365"] = 21,["366"] = 22,["367"] = 23,["369"] = 25,["370"] = 26,["373"] = 27,["374"] = 21,["375"] = 35,["376"] = 36,["379"] = 37,["380"] = 38,["381"] = 39,["382"] = 40,["384"] = 42,["385"] = 43,["387"] = 35,["388"] = 55,["389"] = 56,["390"] = 57,["392"] = 59,["394"] = 55});
local ____exports = {}
____exports.Signal = __TS__Class()
local Signal = ____exports.Signal
Signal.name = "Signal"
function Signal.prototype.____constructor(self)
    self.connected_signals = {}
end
function Signal.prototype.emit(self, signal_name, ...)
    local varargs = {...}
    if self.connected_signals[signal_name] then
        __TS__ArrayForEach(
            self.connected_signals[signal_name],
            function(____, callback) return callback(
                nil,
                unpack(varargs)
            ) end
        )
    end
end
function Signal.prototype.connect(self, signal_name, callback)
    if not self.connected_signals[signal_name] then
        self.connected_signals[signal_name] = {}
    end
    local connections = self.connected_signals[signal_name]
    if __TS__ArrayIncludes(connections, callback) then
        return
    end
    __TS__ArrayPush(connections, callback)
end
function Signal.prototype.disconnect(self, signal_name, callback)
    if not self.connected_signals[signal_name] then
        return
    end
    local connections = self.connected_signals[signal_name]
    local callback_index = __TS__ArrayIndexOf(connections, callback)
    if callback_index > -1 then
        __TS__ArraySplice(connections, callback_index, 1)
    end
    if #connections == 0 then
        __TS__Delete(self.connected_signals, signal_name)
    end
end
function Signal.prototype.clear(self, signal_name)
    if signal_name then
        __TS__Delete(self.connected_signals, signal_name)
    else
        self.connected_signals = {}
    end
end
return ____exports
