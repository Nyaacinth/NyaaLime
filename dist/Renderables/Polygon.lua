--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 4,["8"] = 16,["9"] = 17,["10"] = 18,["11"] = 16,["12"] = 22,["13"] = 22,["14"] = 25,["15"] = 26,["16"] = 27,["18"] = 29,["19"] = 30,["20"] = 31,["23"] = 25});
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
