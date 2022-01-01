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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["53"] = 5,["54"] = 5,["55"] = 5,["56"] = 49,["57"] = 49,["58"] = 49,["60"] = 49,["61"] = 49,["63"] = 49,["64"] = 49,["66"] = 22,["67"] = 24,["68"] = 25,["69"] = 22,["70"] = 32,["71"] = 32,["72"] = 33,["73"] = 33,["75"] = 34,["76"] = 35,["77"] = 36,["78"] = 22,["79"] = 22,["80"] = 50,["81"] = 51,["82"] = 52,["83"] = 53,["84"] = 54,["85"] = 49,["86"] = 62,["87"] = 63,["88"] = 64,["89"] = 62,["90"] = 71,["91"] = 72,["92"] = 71,["93"] = 83,["94"] = 84,["95"] = 83,["96"] = 92,["97"] = 93,["98"] = 94,["99"] = 92,["100"] = 98,["101"] = 99,["102"] = 98,["103"] = 106,["104"] = 107,["105"] = 106,["106"] = 120,["107"] = 121,["108"] = 122,["109"] = 120,["110"] = 135,["111"] = 136,["112"] = 137,["113"] = 135,["114"] = 147,["115"] = 147,["116"] = 147,["118"] = 147,["119"] = 147,["121"] = 147,["122"] = 147,["124"] = 148,["125"] = 149,["127"] = 151,["128"] = 151,["129"] = 151,["130"] = 151,["131"] = 151,["132"] = 151,["133"] = 151,["134"] = 151,["135"] = 151,["136"] = 151,["137"] = 147,["138"] = 165,["139"] = 172,["140"] = 172,["142"] = 175,["143"] = 176,["144"] = 177,["145"] = 177,["146"] = 177,["147"] = 176,["148"] = 178,["149"] = 178,["150"] = 178,["151"] = 176,["152"] = 176,["153"] = 176,["154"] = 176,["155"] = 165,["156"] = 185,["157"] = 186,["158"] = 187,["159"] = 188,["160"] = 189,["161"] = 185,["162"] = 193,["163"] = 194,["164"] = 193});
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
