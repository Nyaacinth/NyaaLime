--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.ContentManager = __TS__Class()
local ContentManager = ____exports.ContentManager
ContentManager.name = "ContentManager"
function ContentManager.prototype.____constructor(self, base_url)
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
