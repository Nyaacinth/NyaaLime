--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 4,["9"] = 6,["10"] = 9,["11"] = 12,["12"] = 15,["13"] = 18,["14"] = 21,["15"] = 4,["16"] = 40,["17"] = 40,["18"] = 40,["20"] = 41,["21"] = 42,["22"] = 43,["24"] = 45,["25"] = 45,["27"] = 46,["29"] = 48,["30"] = 48,["32"] = 50,["33"] = 51,["34"] = 52,["35"] = 54,["36"] = 40,["37"] = 63,["38"] = 63,["39"] = 63,["41"] = 64,["42"] = 65,["45"] = 66,["46"] = 63,["47"] = 74,["48"] = 75,["51"] = 76,["52"] = 77,["53"] = 78,["54"] = 80,["55"] = 82,["56"] = 83,["57"] = 84,["58"] = 86,["59"] = 87,["60"] = 88,["62"] = 91,["63"] = 92,["65"] = 74,["66"] = 97,["67"] = 98,["70"] = 99,["71"] = 100,["72"] = 101,["73"] = 97,["74"] = 105,["75"] = 106,["78"] = 107,["79"] = 105,["80"] = 111,["81"] = 112,["82"] = 113,["84"] = 115,["85"] = 111,["86"] = 119,["87"] = 120,["88"] = 121,["90"] = 123,["91"] = 119,["92"] = 127,["93"] = 128,["94"] = 129,["96"] = 131,["97"] = 127,["98"] = 139,["99"] = 140,["100"] = 141,["102"] = 143,["103"] = 144,["104"] = 139,["105"] = 152,["106"] = 153,["107"] = 154,["109"] = 156,["110"] = 157,["111"] = 152});
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
