--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Animation = __TS__Class()
local Animation = ____exports.Animation
Animation.name = "Animation"
function Animation.prototype.____constructor(self, image, frame_width, frame_height, duration, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self.frames = {}
    self.frame_index = 0
    self.duration = 0
    self.x = x
    self.y = y
    self.image_object = image
    self.total_duration = duration
    self.width = frame_width
    self.height = frame_height
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
    love.graphics.draw(self.image_object, self.frames[self.frame_index + 1], self.x, self.y)
end
return ____exports
