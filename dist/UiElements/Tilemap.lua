--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Tilemap = __TS__Class()
local Tilemap = ____exports.Tilemap
Tilemap.name = "Tilemap"
function Tilemap.prototype.____constructor(self, tileset_image, tile_width, tile_height, tilemap, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self.tileset = {}
    self.x = x
    self.y = y
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
__TS__SetDescriptor(
    Tilemap.prototype,
    "width",
    {get = function(self)
        local max_width = 0
        do
            local height_index = 0
            while height_index < #self.tilemap do
                max_width = math.max(max_width, #self.tilemap[height_index + 1] * self.tile_width)
                height_index = height_index + 1
            end
        end
        return max_width
    end},
    true
)
__TS__SetDescriptor(
    Tilemap.prototype,
    "height",
    {get = function(self)
        return #self.tilemap * self.tile_height
    end},
    true
)
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
                    love.graphics.draw(self.tileset_image, self.tileset[current + 1], self.x + width_index * self.tile_width, self.y + height_index * self.tile_height)
                    width_index = width_index + 1
                end
            end
            height_index = height_index + 1
        end
    end
end
return ____exports
