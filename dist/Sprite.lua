--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.SpriteBase = __TS__Class()
local SpriteBase = ____exports.SpriteBase
SpriteBase.name = "SpriteBase"
function SpriteBase.prototype.____constructor(self, x, y, graphic)
    self.graphic = graphic
    self.x = x
    self.y = y
end
function SpriteBase.prototype.update(self, dt)
    self.graphic:update(dt)
end
function SpriteBase.prototype.draw(self)
    love.graphics.push("transform")
    love.graphics.translate(self.x, self.y)
    self.graphic:draw()
    love.graphics.pop()
end
____exports.Sprite = __TS__Class()
local Sprite = ____exports.Sprite
Sprite.name = "Sprite"
__TS__ClassExtends(Sprite, ____exports.SpriteBase)
return ____exports
