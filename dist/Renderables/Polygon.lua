--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        _G.__TS__originalTraceback = debug.traceback
        debug.traceback = function(thread, message, level)
            local trace
            if thread == nil and message == nil and level == nil then
                trace = _G.__TS__originalTraceback()
            else
                trace = _G.__TS__originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local function replacer(____, file, srcFile, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap and fileSourceMap[line] then
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (srcFile .. ":") .. tostring(data)
                    end
                    return (tostring(data.file) .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            local result = string.gsub(
                trace,
                "(%S+)%.lua:(%d+)",
                function(file, line) return replacer(_G, file .. ".lua", file .. ".ts", line) end
            )
            result = string.gsub(
                result,
                "(%[string \"[^\"]+\"%]):(%d+)",
                function(file, line) return replacer(_G, file, "unknown", line) end
            )
            return result
        end
    end
end

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["53"] = 4,["54"] = 4,["55"] = 4,["56"] = 16,["57"] = 17,["58"] = 18,["59"] = 16,["60"] = 22,["61"] = 22,["62"] = 25,["63"] = 26,["64"] = 27,["66"] = 29,["67"] = 30,["68"] = 31,["71"] = 25});
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
