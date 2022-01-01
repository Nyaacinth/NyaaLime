--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

function __TS__ArrayPush(arr, ...)
    local items = {...}
    for ____, item in ipairs(items) do
        arr[#arr + 1] = item
    end
    return #arr
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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["61"] = 5,["62"] = 5,["63"] = 5,["64"] = 28,["65"] = 10,["66"] = 13,["67"] = 19,["68"] = 29,["69"] = 30,["70"] = 31,["71"] = 32,["72"] = 33,["73"] = 34,["75"] = 35,["76"] = 35,["78"] = 36,["79"] = 36,["80"] = 37,["81"] = 37,["82"] = 37,["83"] = 37,["84"] = 37,["85"] = 37,["86"] = 37,["87"] = 37,["88"] = 37,["89"] = 37,["90"] = 37,["91"] = 36,["94"] = 35,["97"] = 28,["98"] = 46,["99"] = 47,["100"] = 48,["101"] = 49,["102"] = 50,["103"] = 51,["104"] = 52,["107"] = 46,["108"] = 58,["109"] = 59,["110"] = 58});
local ____exports = {}
____exports.Animation = __TS__Class()
local Animation = ____exports.Animation
Animation.name = "Animation"
function Animation.prototype.____constructor(self, image, frame_width, frame_height, duration)
    self.frames = {}
    self.frame_index = 0
    self.duration = 0
    self.image = image
    self.total_duration = duration
    local image_width = image:getWidth()
    local image_height = image:getHeight()
    local width_frames = math.floor(image_width / frame_width)
    local height_frames = math.floor(image_height / frame_height)
    do
        local width_index = 0
        while width_index < width_frames do
            do
                local height_index = 0
                while height_index < height_frames do
                    __TS__ArrayPush(
                        self.frames,
                        love.graphics.newQuad(
                            width_index * frame_width,
                            height_index * frame_height,
                            frame_width,
                            frame_height,
                            image_width,
                            image_height
                        )
                    )
                    height_index = height_index + 1
                end
            end
            width_index = width_index + 1
        end
    end
end
function Animation.prototype.update(self, dt)
    self.duration = self.duration + dt
    if self.duration > self.total_duration / #self.frames then
        self.duration = 0
        self.frame_index = self.frame_index + 1
        if self.frame_index > #self.frames - 1 then
            self.frame_index = 0
        end
    end
end
function Animation.prototype.draw(self)
    love.graphics.draw(self.image, self.frames[self.frame_index + 1])
end
return ____exports
