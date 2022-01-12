--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Rectangle = require("Renderables.Rectangle")
local Rectangle = ____Rectangle.Rectangle
____exports.Textbox = __TS__Class()
local Textbox = ____exports.Textbox
Textbox.name = "Textbox"
__TS__ClassExtends(Textbox, Rectangle)
function Textbox.prototype.____constructor(self, text, width, height, font)
    if font == nil then
        font = love.graphics.getFont() or love.graphics.newFont()
    end
    Rectangle.prototype.____constructor(self, "line", width, height)
    self.text = text
    self.font = font
end
function Textbox.prototype.draw(self)
    love.graphics.push("all")
    love.graphics.setFont(self.font)
    love.graphics.printf(self.text, self.roundness, self.roundness, self.width)
    love.graphics.pop()
    Rectangle.prototype.draw(self)
end
return ____exports
