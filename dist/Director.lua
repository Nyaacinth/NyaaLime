--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Director = __TS__Class()
local Director = ____exports.Director
Director.name = "Director"
function Director.prototype.____constructor(self, width, height, flags)
    self.scenes = {}
    self.display_width = -1
    self.display_height = -1
    self.scale = -1
    self.offset_x = -1
    self.offset_y = -1
    self:setScreen(width, height, flags)
    local prev_update = love.update or (function()
    end)
    love.update = function(dt)
        prev_update(dt)
        self:update(dt)
    end
    local prev_draw = love.draw or (function()
    end)
    love.draw = function()
        prev_draw()
        self:draw()
    end
    local prev_resize = love.resize or (function()
    end)
    love.resize = function(w, h)
        prev_resize(w, h)
        self:handleResize(w, h)
    end
end
function Director.prototype.setScreen(self, width, height, window_width_or_flags, window_height, flags)
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
    self:setWindow(window_width, window_height, flags)
end
function Director.prototype.setWindow(self, width, height, flags)
    if flags == nil then
        flags = {}
    end
    love.window.setMode(width, height, flags)
    self:handleResize(width, height)
end
function Director.prototype.handleResize(self, width, height)
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
function Director.prototype.getScreenWidth(self)
    return self.display_width
end
function Director.prototype.getScreenHeight(self)
    return self.display_height
end
function Director.prototype.getScreenDimensions(self)
    return self.display_width, self.display_height
end
function Director.prototype.fromScreenCoordinates(self, x, y)
    local scale = self.scale
    return x * scale + self.offset_x, y * scale + self.offset_y
end
function Director.prototype.toScreenCoordinates(self, x, y)
    local scale = self.scale
    return (x - self.offset_x) / scale, (y - self.offset_y) / scale
end
function Director.prototype.getCurrentScene(self)
    return self.scenes[#self.scenes]
end
function Director.prototype.switch(self, to, ...)
    local from = self:getCurrentScene()
    if not to.initialized then
        local ____this_1
        ____this_1 = to
        local ____to_init_result_0 = ____this_1.init
        if ____to_init_result_0 ~= nil then
            ____to_init_result_0 = ____to_init_result_0(____this_1)
        end
        local ____ = ____to_init_result_0
        to.initialized = true
    end
    if from then
        local ____this_3
        ____this_3 = from
        local ____from_leave_result_2 = ____this_3.leave
        if ____from_leave_result_2 ~= nil then
            ____from_leave_result_2 = ____from_leave_result_2(____this_3)
        end
        local ____ = ____from_leave_result_2
    end
    local ____this_5
    ____this_5 = to
    local ____to_enter_result_4 = ____this_5.enter
    if ____to_enter_result_4 ~= nil then
        ____to_enter_result_4 = ____to_enter_result_4(____this_5, from, ...)
    end
    local ____ = ____to_enter_result_4
    table.remove(self.scenes)
    __TS__ArrayPush(self.scenes, to)
end
function Director.prototype.push(self, to, ...)
    local from = self:getCurrentScene()
    if from then
        local ____this_7
        ____this_7 = from
        local ____from_pause_result_6 = ____this_7.pause
        if ____from_pause_result_6 ~= nil then
            ____from_pause_result_6 = ____from_pause_result_6(____this_7)
        end
        local ____ = ____from_pause_result_6
    end
    local ____this_9
    ____this_9 = to
    local ____to_enter_result_8 = ____this_9.enter
    if ____to_enter_result_8 ~= nil then
        ____to_enter_result_8 = ____to_enter_result_8(
            ____this_9,
            self:getCurrentScene(),
            ...
        )
    end
    local ____ = ____to_enter_result_8
    __TS__ArrayPush(self.scenes, to)
end
function Director.prototype.pop(self, ...)
    local from = self:getCurrentScene()
    if from then
        local ____this_11
        ____this_11 = from
        local ____from_leave_result_10 = ____this_11.leave
        if ____from_leave_result_10 ~= nil then
            ____from_leave_result_10 = ____from_leave_result_10(____this_11)
        end
        local ____ = ____from_leave_result_10
    end
    table.remove(self.scenes)
    local to = self:getCurrentScene()
    if to then
        local ____this_13
        ____this_13 = to
        local ____to_resume_result_12 = ____this_13.resume
        if ____to_resume_result_12 ~= nil then
            ____to_resume_result_12 = ____to_resume_result_12(____this_13, from, ...)
        end
        local ____ = ____to_resume_result_12
    end
end
function Director.prototype.update(self, dt)
    local ____table_getCurrentScene_result_update_result_14 = self:getCurrentScene()
    if ____table_getCurrentScene_result_update_result_14 ~= nil then
        ____table_getCurrentScene_result_update_result_14 = ____table_getCurrentScene_result_update_result_14:update(dt)
    end
    local ____ = ____table_getCurrentScene_result_update_result_14
end
function Director.prototype.draw(self)
    love.graphics.push("all")
    love.graphics.translate(self.offset_x, self.offset_y)
    love.graphics.scale(self.scale)
    local ____table_getCurrentScene_result_draw_result_16 = self:getCurrentScene()
    if ____table_getCurrentScene_result_draw_result_16 ~= nil then
        ____table_getCurrentScene_result_draw_result_16 = ____table_getCurrentScene_result_draw_result_16:draw()
    end
    local ____ = ____table_getCurrentScene_result_draw_result_16
    love.graphics.pop()
end
return ____exports
