--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 5,["6"] = 5,["7"] = 5,["8"] = 49,["9"] = 49,["10"] = 49,["12"] = 49,["13"] = 49,["15"] = 49,["16"] = 49,["18"] = 22,["19"] = 24,["20"] = 25,["21"] = 22,["22"] = 32,["23"] = 32,["24"] = 33,["25"] = 33,["27"] = 34,["28"] = 35,["29"] = 36,["30"] = 22,["31"] = 22,["32"] = 50,["33"] = 51,["34"] = 52,["35"] = 53,["36"] = 54,["37"] = 49,["38"] = 62,["39"] = 63,["40"] = 64,["41"] = 62,["42"] = 71,["43"] = 72,["44"] = 71,["45"] = 83,["46"] = 84,["47"] = 83,["48"] = 92,["49"] = 93,["50"] = 94,["51"] = 92,["52"] = 98,["53"] = 99,["54"] = 98,["55"] = 106,["56"] = 107,["57"] = 106,["58"] = 120,["59"] = 121,["60"] = 122,["61"] = 120,["62"] = 135,["63"] = 136,["64"] = 137,["65"] = 135,["66"] = 147,["67"] = 147,["68"] = 147,["70"] = 147,["71"] = 147,["73"] = 147,["74"] = 147,["76"] = 148,["77"] = 149,["79"] = 151,["80"] = 151,["81"] = 151,["82"] = 151,["83"] = 151,["84"] = 151,["85"] = 151,["86"] = 151,["87"] = 151,["88"] = 151,["89"] = 147,["90"] = 165,["91"] = 172,["92"] = 172,["94"] = 175,["95"] = 176,["96"] = 177,["97"] = 177,["98"] = 177,["99"] = 176,["100"] = 178,["101"] = 178,["102"] = 178,["103"] = 176,["104"] = 176,["105"] = 176,["106"] = 176,["107"] = 165,["108"] = 185,["109"] = 186,["110"] = 187,["111"] = 188,["112"] = 189,["113"] = 185,["114"] = 193,["115"] = 194,["116"] = 193});
local ____exports = {}
____exports.Camera = __TS__Class()
local Camera = ____exports.Camera
Camera.name = "Camera"
function Camera.prototype.____constructor(self, x, y, width, height, scale)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if scale == nil then
        scale = 1
    end
    self.default_smoothers = {
        none = function(self, _x, _y, dx, dy)
            return dx, dy
        end,
        common = function(self, x, y, dx, dy, ...)
            local vargs = {...}
            if x == dx and y == dy then
                return dx, dy
            end
            local speed = type(vargs[1]) == "number" and vargs[1] or 0.001
            speed = math.min(1, speed)
            return x ~= dx and (dx - x) * speed + x or x, y ~= dy and (dy - y) * speed + y or y
        end
    }
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.scale = scale
end
function Camera.prototype.move(self, dx, dy)
    self.x = self.x + dx
    self.y = self.y + dy
end
function Camera.prototype.zoom(self, mul)
    self.scale = self.scale * mul
end
function Camera.prototype.getPosition(self)
    return self.x, self.y
end
function Camera.prototype.setPosition(self, x, y)
    self.x = x
    self.y = y
end
function Camera.prototype.getScale(self)
    return self.scale
end
function Camera.prototype.setScale(self, scale)
    self.scale = scale
end
function Camera.prototype.getWorldCoords(self, x, y)
    local scale = self.scale
    return x / scale - self.x - self.width / 2, y / scale - self.y - self.height / 2
end
function Camera.prototype.getCameraCoords(self, x, y)
    local scale = self.scale
    return (x + self.x + self.width / 2) * scale, (y + self.y + self.height / 2) * scale
end
function Camera.prototype.lookAt(self, x, y, smoother, ...)
    if x == nil then
        x = self.x
    end
    if y == nil then
        y = self.y
    end
    if smoother == nil then
        smoother = self.default_smoothers.none
    end
    if type(smoother) == "string" then
        smoother = self.default_smoothers[smoother]
    end
    local ____temp_0 = {smoother(
        nil,
        self.x,
        self.y,
        x,
        y,
        ...
    )}
    self.x = ____temp_0[1]
    self.y = ____temp_0[2]
end
function Camera.prototype.lookAtSegment(self, x, y, min_x, max_x, min_y, max_y, smoother, ...)
    if smoother == nil then
        smoother = self.default_smoothers.none
    end
    local scale = self.scale
    self:lookAt(
        math.max(
            (min_x + self.width / 2) / scale,
            math.min(x, (max_x - self.width / 2) / scale)
        ),
        math.max(
            (min_y + self.height / 2) / scale,
            math.min(y, (max_y - self.height / 2) / scale)
        ),
        smoother,
        ...
    )
end
function Camera.prototype.attach(self)
    love.graphics.push("transform")
    love.graphics.translate(self.width / 2, self.height / 2)
    love.graphics.scale(self.scale)
    love.graphics.translate(-self.x, -self.y)
end
function Camera.prototype.detach(self)
    love.graphics.pop()
end
return ____exports
