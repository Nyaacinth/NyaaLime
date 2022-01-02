--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 5,["6"] = 5,["7"] = 5,["8"] = 28,["9"] = 10,["10"] = 13,["11"] = 19,["12"] = 29,["13"] = 30,["14"] = 31,["15"] = 32,["16"] = 33,["17"] = 34,["19"] = 35,["20"] = 35,["22"] = 36,["23"] = 36,["24"] = 37,["25"] = 37,["26"] = 37,["27"] = 37,["28"] = 37,["29"] = 37,["30"] = 37,["31"] = 37,["32"] = 37,["33"] = 37,["34"] = 37,["35"] = 36,["38"] = 35,["41"] = 28,["42"] = 46,["43"] = 47,["44"] = 48,["45"] = 49,["46"] = 50,["47"] = 51,["48"] = 52,["51"] = 46,["52"] = 58,["53"] = 59,["54"] = 58});
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
