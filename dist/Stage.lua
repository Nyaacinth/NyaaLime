--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["59"] = 2,["60"] = 2,["61"] = 3,["62"] = 3,["63"] = 4,["64"] = 4,["65"] = 5,["66"] = 5,["67"] = 6,["68"] = 6,["69"] = 8,["70"] = 8,["71"] = 8,["72"] = 30,["73"] = 10,["74"] = 13,["75"] = 16,["76"] = 19,["77"] = 22,["78"] = 31,["79"] = 30,["80"] = 38,["81"] = 39,["82"] = 40,["83"] = 38,["84"] = 44,["85"] = 45,["86"] = 46,["87"] = 47,["88"] = 44});
local ____exports = {}
local ____ContentManager = require("ContentManager")
local ContentManager = ____ContentManager.ContentManager
local ____DisplayManager = require("DisplayManager")
local DisplayManager = ____DisplayManager.DisplayManager
local ____SceneManager = require("SceneManager")
local SceneManager = ____SceneManager.SceneManager
local ____Signal = require("Signal")
local Signal = ____Signal.Signal
local ____Timer = require("Timer")
local Timer = ____Timer.Timer
____exports.Stage = __TS__Class()
local Stage = ____exports.Stage
Stage.name = "Stage"
function Stage.prototype.____constructor(self, screen_width, screen_height, screen_flags)
    self.scene_manager = __TS__New(SceneManager)
    self.timer = __TS__New(Timer)
    self.signal = __TS__New(Signal)
    self.display_manager = __TS__New(DisplayManager)
    self.content_manager = __TS__New(ContentManager)
    self.display_manager:setScreen(screen_width, screen_height, screen_flags)
end
function Stage.prototype.update(self, dt)
    self.scene_manager:update(dt)
    self.timer:update(dt)
end
function Stage.prototype.draw(self)
    self.display_manager:attach()
    self.scene_manager:draw()
    self.display_manager:detach()
end
return ____exports
