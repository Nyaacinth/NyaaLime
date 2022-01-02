--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
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
