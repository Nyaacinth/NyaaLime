--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["78"] = 29,["79"] = 29,["80"] = 29,["81"] = 45,["82"] = 46,["83"] = 47,["84"] = 48,["85"] = 45,["86"] = 55,["87"] = 56,["88"] = 55,["89"] = 60,["90"] = 61,["91"] = 62,["92"] = 63,["93"] = 64,["94"] = 60,["95"] = 69,["96"] = 69,["97"] = 69,["98"] = 69});
local ____exports = {}
____exports.SpriteBase = __TS__Class()
local SpriteBase = ____exports.SpriteBase
SpriteBase.name = "SpriteBase"
function SpriteBase.prototype.____constructor(self, x, y, graphic)
    self.graphic = graphic
    self.x = x
    self.y = y
end
function SpriteBase.prototype.update(self, dt)
    self.graphic:update(dt)
end
function SpriteBase.prototype.draw(self)
    love.graphics.push("transform")
    love.graphics.translate(self.x, self.y)
    self.graphic:draw()
    love.graphics.pop()
end
____exports.Sprite = __TS__Class()
local Sprite = ____exports.Sprite
Sprite.name = "Sprite"
__TS__ClassExtends(Sprite, ____exports.SpriteBase)
return ____exports
