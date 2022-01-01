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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["53"] = 4,["54"] = 4,["55"] = 4,["57"] = 6,["58"] = 9,["59"] = 12,["60"] = 15,["61"] = 18,["62"] = 21,["63"] = 4,["64"] = 40,["65"] = 40,["66"] = 40,["68"] = 41,["69"] = 42,["70"] = 43,["72"] = 45,["73"] = 45,["75"] = 46,["77"] = 48,["78"] = 48,["80"] = 50,["81"] = 51,["82"] = 52,["83"] = 54,["84"] = 40,["85"] = 63,["86"] = 63,["87"] = 63,["89"] = 64,["90"] = 65,["93"] = 66,["94"] = 63,["95"] = 74,["96"] = 75,["99"] = 76,["100"] = 77,["101"] = 78,["102"] = 80,["103"] = 82,["104"] = 83,["105"] = 84,["106"] = 86,["107"] = 87,["108"] = 88,["110"] = 91,["111"] = 92,["113"] = 74,["114"] = 97,["115"] = 98,["118"] = 99,["119"] = 100,["120"] = 101,["121"] = 97,["122"] = 105,["123"] = 106,["126"] = 107,["127"] = 105,["128"] = 111,["129"] = 112,["130"] = 113,["132"] = 115,["133"] = 111,["134"] = 119,["135"] = 120,["136"] = 121,["138"] = 123,["139"] = 119,["140"] = 127,["141"] = 128,["142"] = 129,["144"] = 131,["145"] = 127,["146"] = 139,["147"] = 140,["148"] = 141,["150"] = 143,["151"] = 144,["152"] = 139,["153"] = 152,["154"] = 153,["155"] = 154,["157"] = 156,["158"] = 157,["159"] = 152});
local ____exports = {}
____exports.DisplayManager = __TS__Class()
local DisplayManager = ____exports.DisplayManager
DisplayManager.name = "DisplayManager"
function DisplayManager.prototype.____constructor(self)
    self.enabled = false
    self.display_width = -1
    self.display_height = -1
    self.scale = -1
    self.offset_x = -1
    self.offset_y = -1
end
function DisplayManager.prototype.setScreen(self, width, height, window_width_or_flags, window_height, flags)
    if window_height == nil then
        window_height = height
    end
    local window_width
    if type(window_width_or_flags) == "number" then
        window_width = window_width_or_flags
    else
        if flags == nil then
            flags = window_width_or_flags
        end
        window_width = width
    end
    if flags == nil then
        flags = {}
    end
    self.display_width = width
    self.display_height = height
    self.enabled = true
    self:setWindow(window_width, window_height, flags)
end
function DisplayManager.prototype.setWindow(self, width, height, flags)
    if flags == nil then
        flags = {}
    end
    love.window.setMode(width, height, flags)
    if not self.enabled then
        return
    end
    self:handleResize(width, height)
end
function DisplayManager.prototype.handleResize(self, width, height)
    if not self.enabled then
        return
    end
    self.scale = width / self.display_width
    local window_aspectratio = width / height
    local display_aspectratio = self.display_width / self.display_height
    if display_aspectratio > window_aspectratio then
        self.offset_x = 0
        self.offset_y = height / 2 - self.scale * self.display_height / 2
    elseif display_aspectratio < window_aspectratio then
        self.scale = height / self.display_height
        self.offset_x = width / 2 - self.scale * self.display_width / 2
        self.offset_y = 0
    else
        self.offset_x = 0
        self.offset_y = 0
    end
end
function DisplayManager.prototype.attach(self)
    if not self.enabled then
        return
    end
    love.graphics.push("all")
    love.graphics.translate(self.offset_x, self.offset_y)
    love.graphics.scale(self.scale)
end
function DisplayManager.prototype.detach(self)
    if not self.enabled then
        return
    end
    love.graphics.pop()
end
function DisplayManager.prototype.getWidth(self)
    if not self.enabled then
        return love.graphics.getWidth()
    end
    return self.display_width
end
function DisplayManager.prototype.getHeight(self)
    if not self.enabled then
        return love.graphics.getHeight()
    end
    return self.display_height
end
function DisplayManager.prototype.getDimensions(self)
    if not self.enabled then
        return love.graphics.getDimensions()
    end
    return self.display_width, self.display_height
end
function DisplayManager.prototype.fromScreenCoordinates(self, x, y)
    if not self.enabled then
        return x, y
    end
    local scale = self.scale
    return x * scale + self.offset_x, y * scale + self.offset_y
end
function DisplayManager.prototype.toScreenCoordinates(self, x, y)
    if not self.enabled then
        return x, y
    end
    local scale = self.scale
    return (x - self.offset_x) / scale, (y - self.offset_y) / scale
end
return ____exports
