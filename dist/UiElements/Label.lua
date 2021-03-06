--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Rectangle = require("UiElements.Rectangle")
local Rectangle = ____Rectangle.Rectangle
____exports.Label = __TS__Class()
local Label = ____exports.Label
Label.name = "Label"
__TS__ClassExtends(Label, Rectangle)
function Label.prototype.____constructor(self, text, width, height, font, x, y)
    if font == nil then
        font = love.graphics.getFont() or love.graphics.newFont()
    end
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    Rectangle.prototype.____constructor(
        self,
        "line",
        width,
        height,
        x,
        y
    )
    self.text = text
    self.font = font
end
function Label.prototype.draw(self)
    love.graphics.push("all")
    love.graphics.setFont(self.font)
    love.graphics.printf(self.text, self.x + self.roundness, self.y + self.roundness, self.width)
    love.graphics.pop()
    Rectangle.prototype.draw(self)
end
return ____exports
