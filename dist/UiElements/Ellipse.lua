--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Ellipse = __TS__Class()
local Ellipse = ____exports.Ellipse
Ellipse.name = "Ellipse"
function Ellipse.prototype.____constructor(self, mode, width, height, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self.color = {1, 1, 1}
    self.border_thickness = 0
    self.border_color = {1, 1, 1}
    self.x = x
    self.y = y
    self.mode = mode
    self.width = width
    self.height = height
end
function Ellipse.prototype.update(self)
end
function Ellipse.prototype.draw(self)
    love.graphics.push("all")
    if self.mode == "fill" then
        love.graphics.setColor(self.color)
        love.graphics.ellipse(
            "fill",
            self.x,
            self.y,
            self.width,
            self.height
        )
    end
    love.graphics.setLineWidth(self.border_thickness)
    love.graphics.setColor(self.border_color)
    love.graphics.ellipse(
        "line",
        self.x,
        self.y,
        self.width,
        self.height
    )
    love.graphics.pop()
end
return ____exports
