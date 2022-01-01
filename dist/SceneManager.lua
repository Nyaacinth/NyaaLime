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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["61"] = 4,["62"] = 4,["63"] = 4,["65"] = 6,["66"] = 4,["67"] = 9,["68"] = 10,["69"] = 9,["70"] = 18,["71"] = 19,["72"] = 20,["74"] = 21,["75"] = 21,["76"] = 21,["77"] = 21,["79"] = 21,["80"] = 22,["82"] = 24,["84"] = 25,["85"] = 25,["86"] = 25,["87"] = 25,["89"] = 25,["92"] = 27,["93"] = 27,["94"] = 27,["95"] = 27,["97"] = 27,["98"] = 28,["99"] = 29,["100"] = 18,["101"] = 37,["102"] = 38,["103"] = 39,["105"] = 40,["106"] = 40,["107"] = 40,["108"] = 40,["110"] = 40,["113"] = 42,["114"] = 42,["115"] = 42,["116"] = 42,["117"] = 42,["118"] = 42,["119"] = 42,["120"] = 42,["122"] = 42,["123"] = 43,["124"] = 37,["125"] = 50,["126"] = 51,["127"] = 52,["129"] = 53,["130"] = 53,["131"] = 53,["132"] = 53,["134"] = 53,["136"] = 55,["137"] = 56,["138"] = 57,["140"] = 58,["141"] = 58,["142"] = 58,["143"] = 58,["145"] = 58,["147"] = 50,["148"] = 66,["149"] = 67,["150"] = 67,["151"] = 67,["153"] = 67,["154"] = 66,["155"] = 71,["156"] = 72,["157"] = 72,["158"] = 72,["160"] = 72,["161"] = 71});
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
