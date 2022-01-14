--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Layer = require("Layer")
local Layer = ____Layer.Layer
____exports.SpriteBase = __TS__Class()
local SpriteBase = ____exports.SpriteBase
SpriteBase.name = "SpriteBase"
function SpriteBase.prototype.____constructor(self, x, y, scale, rotation, graphic)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if scale == nil then
        scale = 1
    end
    if rotation == nil then
        rotation = 0
    end
    self.graphic = graphic
    self.x = x
    self.y = y
    self.scale = scale
    self.rotation = rotation
end
function SpriteBase.prototype.useGraphic(self, graphic)
    self.graphic = graphic
end
function SpriteBase.prototype.update(self, dt)
    local ____table_graphic_update_result_0 = self.graphic
    if ____table_graphic_update_result_0 ~= nil then
        ____table_graphic_update_result_0 = ____table_graphic_update_result_0:update(dt)
    end
    local ____ = ____table_graphic_update_result_0
end
function SpriteBase.prototype.draw(self)
    love.graphics.push("transform")
    love.graphics.translate(self.x, self.y)
    love.graphics.scale(self.scale)
    love.graphics.rotate(self.rotation)
    local ____table_graphic_draw_result_2 = self.graphic
    if ____table_graphic_draw_result_2 ~= nil then
        ____table_graphic_draw_result_2 = ____table_graphic_draw_result_2:draw()
    end
    local ____ = ____table_graphic_draw_result_2
    love.graphics.pop()
end
____exports.Sprite = __TS__Class()
local Sprite = ____exports.Sprite
Sprite.name = "Sprite"
__TS__ClassExtends(Sprite, ____exports.SpriteBase)
function Sprite.prototype.____constructor(self, x, y, scale, rotation)
    Sprite.____super.prototype.____constructor(
        self,
        x,
        y,
        scale,
        rotation
    )
    self.graphic = __TS__New(Layer)
end
return ____exports
