--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Polygon = __TS__Class()
local Polygon = ____exports.Polygon
Polygon.name = "Polygon"
function Polygon.prototype.____constructor(self, mode, points)
    self.color = {1, 1, 1}
    self.border_thickness = 0
    self.border_color = {1, 1, 1}
    self.mode = mode
    self.points = points
end
function Polygon.prototype.update(self)
end
function Polygon.prototype.draw(self)
    love.graphics.push("all")
    love.graphics.setLineWidth(self.border_thickness)
    love.graphics.setColor(self.border_color)
    love.graphics.polygon("line", self.points)
    if self.mode == "fill" then
        love.graphics.setColor(self.color)
        local triangles = love.math.triangulate(self.points)
        for ____, triangle in ipairs(triangles) do
            love.graphics.polygon("fill", triangle)
        end
    end
    love.graphics.pop()
end
return ____exports
