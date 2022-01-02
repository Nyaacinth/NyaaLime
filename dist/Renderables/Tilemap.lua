--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 5,["6"] = 5,["7"] = 5,["8"] = 28,["9"] = 10,["10"] = 29,["11"] = 30,["12"] = 31,["13"] = 32,["14"] = 33,["15"] = 34,["16"] = 35,["17"] = 36,["18"] = 37,["19"] = 37,["20"] = 37,["21"] = 37,["22"] = 37,["23"] = 37,["24"] = 37,["25"] = 37,["26"] = 37,["27"] = 37,["28"] = 37,["30"] = 38,["31"] = 38,["33"] = 39,["34"] = 39,["35"] = 40,["36"] = 40,["37"] = 40,["38"] = 40,["39"] = 40,["40"] = 40,["41"] = 40,["42"] = 40,["43"] = 40,["44"] = 40,["45"] = 40,["46"] = 39,["49"] = 38,["52"] = 28,["53"] = 46,["54"] = 46,["55"] = 49,["57"] = 50,["58"] = 50,["59"] = 51,["61"] = 52,["62"] = 52,["63"] = 53,["64"] = 54,["65"] = 52,["68"] = 50,["71"] = 49});
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
