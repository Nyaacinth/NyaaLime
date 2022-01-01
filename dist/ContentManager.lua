--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["163"] = 6,["164"] = 6,["165"] = 6,["167"] = 8,["168"] = 42,["169"] = 42,["170"] = 42,["171"] = 42,["172"] = 42,["173"] = 42,["174"] = 42,["175"] = 42,["176"] = 42,["177"] = 42,["178"] = 42,["179"] = 42,["180"] = 42,["181"] = 42,["182"] = 42,["183"] = 42,["184"] = 42,["185"] = 42,["186"] = 42,["187"] = 42,["188"] = 42,["189"] = 42,["190"] = 42,["191"] = 42,["192"] = 42,["193"] = 42,["194"] = 42,["195"] = 42,["196"] = 42,["197"] = 42,["198"] = 42,["199"] = 42,["200"] = 51,["201"] = 69,["202"] = 69,["203"] = 69,["204"] = 69,["205"] = 69,["206"] = 69,["207"] = 69,["208"] = 69,["209"] = 69,["210"] = 69,["211"] = 72,["212"] = 87,["213"] = 90,["214"] = 107,["215"] = 107,["216"] = 107,["217"] = 107,["218"] = 107,["219"] = 107,["220"] = 107,["221"] = 107,["222"] = 110,["223"] = 6,["224"] = 11,["225"] = 12,["226"] = 11,["227"] = 19,["228"] = 20,["229"] = 19,["230"] = 31,["231"] = 32,["232"] = 33,["233"] = 34,["234"] = 35,["238"] = 38,["241"] = 31,["242"] = 59,["243"] = 60,["244"] = 61,["245"] = 62,["247"] = 64,["248"] = 64,["249"] = 64,["250"] = 64,["251"] = 65,["252"] = 59,["253"] = 78,["254"] = 79,["255"] = 80,["257"] = 82,["258"] = 83,["259"] = 78,["260"] = 97,["261"] = 97,["262"] = 97,["264"] = 98,["265"] = 99,["266"] = 100,["268"] = 102,["269"] = 102,["270"] = 102,["271"] = 102,["272"] = 102,["273"] = 103,["274"] = 97,["275"] = 118,["276"] = 119,["277"] = 120,["279"] = 122,["280"] = 123,["281"] = 118});
local ____exports = {}
____exports.ContentManager = __TS__Class()
local ContentManager = ____exports.ContentManager
ContentManager.name = "ContentManager"
function ContentManager.prototype.____constructor(self)
    self.base_url = "assets"
    self.audio_formats = {
        "wav",
        "mp3",
        "ogg",
        "oga",
        "ogv",
        "699",
        "amf",
        "ams",
        "dbm",
        "dmf",
        "dsm",
        "far",
        "it",
        "j2b",
        "mdl",
        "med",
        "mod",
        "mt2",
        "mtm",
        "okt",
        "psm",
        "s3m",
        "stm",
        "ult",
        "umx",
        "xm",
        "abc",
        "mid",
        "pat",
        "flac"
    }
    self.audio_cache = {}
    self.image_formats = {
        "jpg",
        "jpeg",
        "png",
        "bmp",
        "tga",
        "hdr",
        "pic",
        "exr"
    }
    self.image_cache = {}
    self.font_formats = {"ttf", "otf", "ttc"}
    self.font_cache = {}
    self.shader_formats = {
        "vert",
        "tesc",
        "tese",
        "geom",
        "frag",
        "comp"
    }
    self.shader_cache = {}
end
function ContentManager.prototype.getBaseURL(self)
    return self.base_url
end
function ContentManager.prototype.setBaseURL(self, base_url)
    self.base_url = base_url
end
function ContentManager.prototype.resolveAssetsPath(self, domain, filename, valid_formats, domain_displayname)
    for ____, format in ipairs(valid_formats) do
        local filepath = (((((self.base_url .. "/") .. domain) .. "/") .. filename) .. ".") .. format
        if love.filesystem.getInfo(filepath, "file") then
            return filepath
        end
    end
    error(
        __TS__New(Error, ((((((("Could not find " .. (domain_displayname or domain)) .. " file with filename \"") .. filename) .. "\" in ") .. self.base_url) .. "/") .. domain) .. " folder"),
        0
    )
end
function ContentManager.prototype.getSource(self, filename, ____type)
    local filaname_and_type = (filename .. "?type=") .. ____type
    if self.audio_cache[filaname_and_type] then
        return self.audio_cache[filaname_and_type]
    end
    self.audio_cache[filaname_and_type] = love.audio.newSource(
        self:resolveAssetsPath("audio", filename, self.audio_formats),
        ____type
    )
    return self.audio_cache[filaname_and_type]
end
function ContentManager.prototype.getImage(self, filename)
    if self.image_cache[filename] then
        return self.image_cache[filename]
    end
    self.image_cache[filename] = love.graphics.newImage(self:resolveAssetsPath("images", filename, self.image_formats, "image"))
    return self.image_cache[filename]
end
function ContentManager.prototype.getFont(self, filename, size, hint)
    if hint == nil then
        hint = "normal"
    end
    local filename_and_size_hint = (((filename .. "?size=") .. tostring(size)) .. "&hint=") .. hint
    if self.font_cache[filename_and_size_hint] then
        return self.font_cache[filename_and_size_hint]
    end
    self.font_cache[filename_and_size_hint] = love.graphics.newFont(
        self:resolveAssetsPath("fonts", filename, self.font_formats, "font"),
        size,
        hint
    )
    return self.font_cache[filename_and_size_hint]
end
function ContentManager.prototype.getShader(self, filename)
    if self.shader_cache[filename] then
        return self.shader_cache[filename]
    end
    self.shader_cache[filename] = love.graphics.newShader(self:resolveAssetsPath("shaders", filename, self.shader_formats, "shader"))
    return self.shader_cache[filename]
end
return ____exports
