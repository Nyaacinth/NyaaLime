--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 6,["6"] = 6,["7"] = 6,["9"] = 8,["10"] = 42,["11"] = 42,["12"] = 42,["13"] = 42,["14"] = 42,["15"] = 42,["16"] = 42,["17"] = 42,["18"] = 42,["19"] = 42,["20"] = 42,["21"] = 42,["22"] = 42,["23"] = 42,["24"] = 42,["25"] = 42,["26"] = 42,["27"] = 42,["28"] = 42,["29"] = 42,["30"] = 42,["31"] = 42,["32"] = 42,["33"] = 42,["34"] = 42,["35"] = 42,["36"] = 42,["37"] = 42,["38"] = 42,["39"] = 42,["40"] = 42,["41"] = 42,["42"] = 51,["43"] = 69,["44"] = 69,["45"] = 69,["46"] = 69,["47"] = 69,["48"] = 69,["49"] = 69,["50"] = 69,["51"] = 69,["52"] = 69,["53"] = 72,["54"] = 87,["55"] = 90,["56"] = 107,["57"] = 107,["58"] = 107,["59"] = 107,["60"] = 107,["61"] = 107,["62"] = 107,["63"] = 107,["64"] = 110,["65"] = 6,["66"] = 11,["67"] = 12,["68"] = 11,["69"] = 19,["70"] = 20,["71"] = 19,["72"] = 31,["73"] = 32,["74"] = 33,["75"] = 34,["76"] = 35,["80"] = 38,["83"] = 31,["84"] = 59,["85"] = 60,["86"] = 61,["87"] = 62,["89"] = 64,["90"] = 64,["91"] = 64,["92"] = 64,["93"] = 65,["94"] = 59,["95"] = 78,["96"] = 79,["97"] = 80,["99"] = 82,["100"] = 83,["101"] = 78,["102"] = 97,["103"] = 97,["104"] = 97,["106"] = 98,["107"] = 99,["108"] = 100,["110"] = 102,["111"] = 102,["112"] = 102,["113"] = 102,["114"] = 102,["115"] = 103,["116"] = 97,["117"] = 118,["118"] = 119,["119"] = 120,["121"] = 122,["122"] = 123,["123"] = 118});
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
