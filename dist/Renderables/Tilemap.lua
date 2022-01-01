--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

function __TS__ArrayPush(arr, ...)
    local items = {...}
    for ____, item in ipairs(items) do
        arr[#arr + 1] = item
    end
    return #arr
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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["61"] = 5,["62"] = 5,["63"] = 5,["64"] = 28,["65"] = 10,["66"] = 29,["67"] = 30,["68"] = 31,["69"] = 32,["70"] = 33,["71"] = 34,["72"] = 35,["73"] = 36,["74"] = 37,["75"] = 37,["76"] = 37,["77"] = 37,["78"] = 37,["79"] = 37,["80"] = 37,["81"] = 37,["82"] = 37,["83"] = 37,["84"] = 37,["86"] = 38,["87"] = 38,["89"] = 39,["90"] = 39,["91"] = 40,["92"] = 40,["93"] = 40,["94"] = 40,["95"] = 40,["96"] = 40,["97"] = 40,["98"] = 40,["99"] = 40,["100"] = 40,["101"] = 40,["102"] = 39,["105"] = 38,["108"] = 28,["109"] = 46,["110"] = 46,["111"] = 49,["113"] = 50,["114"] = 50,["115"] = 51,["117"] = 52,["118"] = 52,["119"] = 53,["120"] = 54,["121"] = 52,["124"] = 50,["127"] = 49});
local ____exports = {}
____exports.Tilemap = __TS__Class()
local Tilemap = ____exports.Tilemap
Tilemap.name = "Tilemap"
function Tilemap.prototype.____constructor(self, tileset_image, tile_width, tile_height, tilemap)
    self.tileset = {}
    self.tileset_image = tileset_image
    self.tile_width = tile_width
    self.tile_height = tile_height
    self.tilemap = tilemap
    local image_width = tileset_image:getWidth()
    local image_height = tileset_image:getHeight()
    local width_frames = math.floor(image_width / tile_width)
    local height_frames = math.floor(image_height / tile_height)
    __TS__ArrayPush(
        self.tileset,
        love.graphics.newQuad(
            0,
            0,
            0,
            0,
            image_width,
            image_height
        )
    )
    do
        local width_index = 0
        while width_index < width_frames do
            do
                local height_index = 0
                while height_index < height_frames do
                    __TS__ArrayPush(
                        self.tileset,
                        love.graphics.newQuad(
                            width_index * tile_width,
                            height_index * tile_height,
                            tile_width,
                            tile_height,
                            image_width,
                            image_height
                        )
                    )
                    height_index = height_index + 1
                end
            end
            width_index = width_index + 1
        end
    end
end
function Tilemap.prototype.update(self)
end
function Tilemap.prototype.draw(self)
    do
        local height_index = 0
        while height_index < #self.tilemap do
            local current_column = self.tilemap[height_index + 1]
            do
                local width_index = 0
                while width_index < #current_column do
                    local current = current_column[width_index + 1]
                    love.graphics.draw(self.tileset_image, self.tileset[current + 1], width_index * self.tile_width, height_index * self.tile_height)
                    width_index = width_index + 1
                end
            end
            height_index = height_index + 1
        end
    end
end
return ____exports
