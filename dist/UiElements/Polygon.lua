--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Polygon = __TS__Class()
local Polygon = ____exports.Polygon
Polygon.name = "Polygon"
function Polygon.prototype.____constructor(self, mode, points, x, y)
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
    self.points = points
end
__TS__SetDescriptor(
    Polygon.prototype,
    "width",
    {get = function(self)
        local max_x = 0
        for ____, index in ipairs(self.points) do
            local coordinate = self.points[index + 1]
            if index % 2 > 0 then
                max_x = math.max(max_x, coordinate)
            end
        end
        return max_x
    end},
    true
)
__TS__SetDescriptor(
    Polygon.prototype,
    "height",
    {get = function(self)
        local max_y = 0
        for ____, index in ipairs(self.points) do
            local coordinate = self.points[index + 1]
            if index % 2 == 0 then
                max_y = math.max(max_y, coordinate)
            end
        end
        return max_y
    end},
    true
)
function Polygon.prototype.update(self)
end
function Polygon.prototype.draw(self)
    love.graphics.push("all")
    love.graphics.translate(self.x, self.y)
    if self.mode == "fill" then
        love.graphics.setColor(self.color)
        local triangles = love.math.triangulate(self.points)
        for ____, triangle in ipairs(triangles) do
            love.graphics.polygon("fill", triangle)
        end
    end
    love.graphics.setLineWidth(self.border_thickness)
    love.graphics.setColor(self.border_color)
    love.graphics.polygon("line", self.points)
    love.graphics.pop()
end
return ____exports
