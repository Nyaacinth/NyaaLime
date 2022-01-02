--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 29,["6"] = 29,["7"] = 29,["8"] = 45,["9"] = 46,["10"] = 47,["11"] = 48,["12"] = 45,["13"] = 55,["14"] = 56,["15"] = 55,["16"] = 60,["17"] = 61,["18"] = 62,["19"] = 63,["20"] = 64,["21"] = 60,["22"] = 69,["23"] = 69,["24"] = 69,["25"] = 69});
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
