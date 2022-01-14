--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Rectangle = __TS__Class()
local Rectangle = ____exports.Rectangle
Rectangle.name = "Rectangle"
function Rectangle.prototype.____constructor(self, mode, width, height, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self.roundness = 0
    self.color = {1, 1, 1}
    self.border_thickness = 0
    self.border_color = {1, 1, 1}
    self.x = x
    self.y = y
    self.mode = mode
    self.width = width
    self.height = height
end
function Rectangle.prototype.update(self)
end
function Rectangle.prototype.draw(self)
    love.graphics.push("all")
    if self.mode == "fill" then
        love.graphics.setColor(self.color)
        love.graphics.rectangle(
            "fill",
            self.x,
            self.y,
            self.width,
            self.height,
            self.roundness
        )
    end
    love.graphics.setLineWidth(self.border_thickness)
    love.graphics.setColor(self.border_color)
    love.graphics.rectangle(
        "line",
        self.x,
        self.y,
        self.width,
        self.height,
        self.roundness
    )
    love.graphics.pop()
end
return ____exports
