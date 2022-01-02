--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Polygon = __TS__Class()
local Polygon = ____exports.Polygon
Polygon.name = "Polygon"
function Polygon.prototype.____constructor(self, mode, points)
    self.mode = mode
    self.points = points
end
function Polygon.prototype.update(self)
end
function Polygon.prototype.draw(self)
    if self.mode == "line" then
        love.graphics.polygon("line", self.points)
    else
        local triangles = love.math.triangulate(self.points)
        for ____, triangle in ipairs(triangles) do
            love.graphics.polygon("fill", triangle)
        end
    end
end
return ____exports
