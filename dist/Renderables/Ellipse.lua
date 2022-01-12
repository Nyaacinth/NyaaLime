--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Ellipse = __TS__Class()
local Ellipse = ____exports.Ellipse
Ellipse.name = "Ellipse"
function Ellipse.prototype.____constructor(self, mode, width, height)
    self.color = {1, 1, 1}
    self.border_thickness = 0
    self.border_color = {1, 1, 1}
    self.mode = mode
    self.width = width
    self.height = height
end
function Ellipse.prototype.update(self)
end
function Ellipse.prototype.draw(self)
    love.graphics.push("all")
    love.graphics.setLineWidth(self.border_thickness)
    love.graphics.setColor(self.border_color)
    love.graphics.ellipse(
        "line",
        0,
        0,
        self.width,
        self.height
    )
    if self.mode == "fill" then
        love.graphics.setColor(self.color)
        love.graphics.ellipse(
            "fill",
            0,
            0,
            self.width,
            self.height
        )
    end
    love.graphics.pop()
end
return ____exports
