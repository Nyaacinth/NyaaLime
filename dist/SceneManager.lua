--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 4,["9"] = 6,["10"] = 4,["11"] = 9,["12"] = 10,["13"] = 9,["14"] = 18,["15"] = 19,["16"] = 20,["18"] = 21,["19"] = 21,["20"] = 21,["21"] = 21,["23"] = 21,["24"] = 22,["26"] = 24,["28"] = 25,["29"] = 25,["30"] = 25,["31"] = 25,["33"] = 25,["36"] = 27,["37"] = 27,["38"] = 27,["39"] = 27,["41"] = 27,["42"] = 28,["43"] = 29,["44"] = 18,["45"] = 37,["46"] = 38,["47"] = 39,["49"] = 40,["50"] = 40,["51"] = 40,["52"] = 40,["54"] = 40,["57"] = 42,["58"] = 42,["59"] = 42,["60"] = 42,["61"] = 42,["62"] = 42,["63"] = 42,["64"] = 42,["66"] = 42,["67"] = 43,["68"] = 37,["69"] = 50,["70"] = 51,["71"] = 52,["73"] = 53,["74"] = 53,["75"] = 53,["76"] = 53,["78"] = 53,["80"] = 55,["81"] = 56,["82"] = 57,["84"] = 58,["85"] = 58,["86"] = 58,["87"] = 58,["89"] = 58,["91"] = 50,["92"] = 66,["93"] = 67,["94"] = 67,["95"] = 67,["97"] = 67,["98"] = 66,["99"] = 71,["100"] = 72,["101"] = 72,["102"] = 72,["104"] = 72,["105"] = 71});
local ____exports = {}
____exports.SceneManager = __TS__Class()
local SceneManager = ____exports.SceneManager
SceneManager.name = "SceneManager"
function SceneManager.prototype.____constructor(self)
    self.states = {}
end
function SceneManager.prototype.getCurrent(self)
    return self.states[#self.states]
end
function SceneManager.prototype.switch(self, to, ...)
    local from = self:getCurrent()
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
    table.remove(self.states)
    __TS__ArrayPush(self.states, to)
end
function SceneManager.prototype.push(self, to, ...)
    local from = self:getCurrent()
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
            self:getCurrent(),
            ...
        )
    end
    local ____ = ____to_enter_result_8
    __TS__ArrayPush(self.states, to)
end
function SceneManager.prototype.pop(self, ...)
    local from = self:getCurrent()
    if from then
        local ____this_11
        ____this_11 = from
        local ____from_leave_result_10 = ____this_11.leave
        if ____from_leave_result_10 ~= nil then
            ____from_leave_result_10 = ____from_leave_result_10(____this_11)
        end
        local ____ = ____from_leave_result_10
    end
    table.remove(self.states)
    local to = self:getCurrent()
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
function SceneManager.prototype.update(self, dt)
    local ____table_getCurrent_result_update_result_14 = self:getCurrent()
    if ____table_getCurrent_result_update_result_14 ~= nil then
        ____table_getCurrent_result_update_result_14 = ____table_getCurrent_result_update_result_14:update(dt)
    end
    local ____ = ____table_getCurrent_result_update_result_14
end
function SceneManager.prototype.draw(self)
    local ____table_getCurrent_result_draw_result_16 = self:getCurrent()
    if ____table_getCurrent_result_draw_result_16 ~= nil then
        ____table_getCurrent_result_draw_result_16 = ____table_getCurrent_result_draw_result_16:draw()
    end
    local ____ = ____table_getCurrent_result_draw_result_16
end
return ____exports
