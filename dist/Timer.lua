--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

function __TS__ObjectAssign(to, ...)
    local sources = {...}
    if to == nil then
        return to
    end
    for ____, source in ipairs(sources) do
        for key in pairs(source) do
            to[key] = source[key]
        end
    end
    return to
end

function __TS__ArrayIncludes(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    local k = fromIndex
    if fromIndex < 0 then
        k = len + fromIndex
    end
    if k < 0 then
        k = 0
    end
    for i = k, len do
        if self[i + 1] == searchElement then
            return true
        end
    end
    return false
end

function __TS__ArrayPush(arr, ...)
    local items = {...}
    for ____, item in ipairs(items) do
        arr[#arr + 1] = item
    end
    return #arr
end

function __TS__ArrayIndexOf(arr, searchElement, fromIndex)
    local len = #arr
    if len == 0 then
        return -1
    end
    local n = 0
    if fromIndex then
        n = fromIndex
    end
    if n >= len then
        return -1
    end
    local k
    if n >= 0 then
        k = n
    else
        k = len + n
        if k < 0 then
            k = 0
        end
    end
    do
        local i = k
        while i < len do
            if arr[i + 1] == searchElement then
                return i
            end
            i = i + 1
        end
    end
    return -1
end

function __TS__ArraySplice(list, ...)
    local len = #list
    local actualArgumentCount = select("#", ...)
    local start = select(1, ...)
    local deleteCount = select(2, ...)
    local actualStart
    if start < 0 then
        actualStart = math.max(len + start, 0)
    else
        actualStart = math.min(start, len)
    end
    local itemCount = math.max(actualArgumentCount - 2, 0)
    local actualDeleteCount
    if actualArgumentCount == 0 then
        actualDeleteCount = 0
    elseif actualArgumentCount == 1 then
        actualDeleteCount = len - actualStart
    else
        actualDeleteCount = math.min(
            math.max(deleteCount or 0, 0),
            len - actualStart
        )
    end
    local out = {}
    do
        local k = 0
        while k < actualDeleteCount do
            local from = actualStart + k
            if list[from + 1] then
                out[k + 1] = list[from + 1]
            end
            k = k + 1
        end
    end
    if itemCount < actualDeleteCount then
        do
            local k = actualStart
            while k < len - actualDeleteCount do
                local from = k + actualDeleteCount
                local to = k + itemCount
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k + 1
            end
        end
        do
            local k = len
            while k > len - actualDeleteCount + itemCount do
                list[k] = nil
                k = k - 1
            end
        end
    elseif itemCount > actualDeleteCount then
        do
            local k = len - actualDeleteCount
            while k > actualStart do
                local from = k + actualDeleteCount - 1
                local to = k + itemCount - 1
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k - 1
            end
        end
    end
    local j = actualStart
    for i = 3, actualArgumentCount do
        list[j + 1] = select(i, ...)
        j = j + 1
    end
    do
        local k = #list - 1
        while k >= len - actualDeleteCount + itemCount do
            list[k + 1] = nil
            k = k - 1
        end
    end
    return out
end

function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
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

__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["218"] = 26,["219"] = 26,["220"] = 26,["221"] = 73,["222"] = 37,["223"] = 37,["224"] = 37,["225"] = 37,["226"] = 37,["227"] = 37,["228"] = 37,["229"] = 37,["230"] = 37,["231"] = 46,["232"] = 47,["233"] = 48,["234"] = 49,["235"] = 37,["236"] = 37,["237"] = 75,["238"] = 76,["239"] = 77,["240"] = 78,["241"] = 79,["242"] = 80,["243"] = 81,["244"] = 83,["245"] = 84,["246"] = 85,["247"] = 86,["248"] = 87,["249"] = 88,["251"] = 90,["252"] = 91,["253"] = 73,["254"] = 95,["255"] = 96,["256"] = 97,["257"] = 98,["258"] = 99,["259"] = 100,["261"] = 95,["262"] = 106,["263"] = 106,["264"] = 106,["266"] = 112,["267"] = 111,["268"] = 119,["269"] = 120,["272"] = 123,["273"] = 119,["274"] = 130,["275"] = 131,["276"] = 132,["277"] = 133,["279"] = 130,["280"] = 138,["281"] = 139,["282"] = 138,["283"] = 146,["285"] = 147,["286"] = 147,["287"] = 148,["288"] = 149,["289"] = 150,["290"] = 151,["291"] = 152,["293"] = 154,["295"] = 155,["296"] = 155,["297"] = 155,["298"] = 155,["300"] = 155,["301"] = 156,["302"] = 157,["304"] = 147,["307"] = 146,["308"] = 170,["309"] = 171,["310"] = 171,["311"] = 171,["312"] = 171,["313"] = 171,["314"] = 171,["315"] = 171,["316"] = 171,["317"] = 179,["318"] = 180,["319"] = 170,["320"] = 192,["321"] = 192,["322"] = 192,["324"] = 192,["325"] = 192,["327"] = 193,["328"] = 193,["329"] = 193,["330"] = 193,["331"] = 193,["332"] = 193,["333"] = 193,["334"] = 193,["335"] = 193,["336"] = 202,["337"] = 203,["338"] = 192,["339"] = 213,["340"] = 214,["341"] = 214,["342"] = 214,["343"] = 214,["344"] = 214,["345"] = 214,["346"] = 214,["347"] = 214,["348"] = 214,["349"] = 223,["350"] = 224,["351"] = 213,["352"] = 236,["353"] = 243,["354"] = 243,["355"] = 243,["356"] = 243,["357"] = 243,["358"] = 243,["359"] = 243,["360"] = 243,["361"] = 244,["362"] = 245,["363"] = 236});
local ____exports = {}
____exports.TimerTweener = __TS__Class()
local TimerTweener = ____exports.TimerTweener
TimerTweener.name = "TimerTweener"
function TimerTweener.prototype.____constructor(self, delay, subject, target, method, after)
    self.tweening_handlers = {
        linear = function(____, value) return value end,
        quad = function(____, value) return value ^ 2 end,
        cubic = function(____, value) return value ^ 3 end,
        quart = function(____, value) return value ^ 4 end,
        quint = function(____, value) return value ^ 5 end,
        sine = function(____, value) return 1 - math.cos(value * math.pi / 2) end,
        expo = function(____, value) return 2 ^ (10 * (value - 1)) end,
        circle = function(____, value) return 1 - math.sqrt(1 - value ^ 2) end,
        bounce = function(____, value)
            local a = 7.5625
            local b = 1 / 2.75
            return math.min(a * value ^ 2, a * (value - 1.5 * b) ^ 2 + 0.75, a * (value - 2.25 * b) ^ 2 + 0.9375, a * (value - 2.625 * b) ^ 2 + 0.984375)
        end
    }
    self.life = delay
    self.time = 0
    self.duration = 0
    self.last_called = 0
    self.onDuring = self.processTweening
    self.onEnd = after
    self.count = math.huge
    self.target = target
    self.method = self.tweening_handlers[method]
    local tweening_objects = {}
    for index in pairs(target) do
        local item = assert(subject[index], ("Target " .. index) .. " has no subject to match")
        tweening_objects[index] = item
    end
    self.tweening_object = subject
    self.subject = __TS__ObjectAssign({}, tweening_objects)
end
function TimerTweener.prototype.processTweening(self)
    for index in pairs(self.target) do
        local subject = self.subject[index]
        local target = self.target[index]
        local factor = self:method(math.min(1, self.time / self.life))
        self.tweening_object[index] = subject + (target - subject) * factor
    end
end
____exports.Timer = __TS__Class()
local Timer = ____exports.Timer
Timer.name = "Timer"
function Timer.prototype.____constructor(self)
    self.registry_container = {}
end
function Timer.prototype.register(self, ticket)
    if __TS__ArrayIncludes(self.registry_container, ticket) then
        return
    end
    __TS__ArrayPush(self.registry_container, ticket)
end
function Timer.prototype.unregister(self, ticket)
    local exist_index = __TS__ArrayIndexOf(self.registry_container, ticket)
    if exist_index > -1 then
        __TS__ArraySplice(self.registry_container, exist_index, 1)
    end
end
function Timer.prototype.clear(self)
    self.registry_container = {}
end
function Timer.prototype.update(self, dt)
    do
        local i = 0
        while i < #self.registry_container do
            local current = self.registry_container[i + 1]
            current.time = current.time + dt
            if current.onDuring and current.time - current.last_called > current.duration then
                current.last_called = current.time
                current:onDuring(dt)
            end
            if current.time > current.life then
                local ____this_1
                ____this_1 = current
                local ____current_onEnd_result_0 = ____this_1.onEnd
                if ____current_onEnd_result_0 ~= nil then
                    ____current_onEnd_result_0 = ____current_onEnd_result_0(____this_1)
                end
                local ____ = ____current_onEnd_result_0
                __TS__ArraySplice(self.registry_container, i, 1)
                i = i - 1
            end
            i = i + 1
        end
    end
end
function Timer.prototype.after(self, delay, func)
    local reg = {
        life = delay,
        time = 0,
        count = 0,
        duration = 0,
        last_called = 0,
        onEnd = func
    }
    self:register(reg)
    return reg
end
function Timer.prototype.every(self, duration, func, count, limit, after)
    if count == nil then
        count = math.huge
    end
    if limit == nil then
        limit = math.huge
    end
    local reg = {
        life = limit,
        time = 0,
        count = count,
        duration = duration,
        last_called = 0,
        onDuring = func,
        onEnd = after
    }
    self:register(reg)
    return reg
end
function Timer.prototype.during(self, limit, func, after)
    local reg = {
        life = limit,
        time = 0,
        count = math.huge,
        duration = 0,
        last_called = 0,
        onDuring = func,
        onEnd = after
    }
    self:register(reg)
    return reg
end
function Timer.prototype.tween(self, delay, subject, target, method, after)
    local tweener = __TS__New(
        ____exports.TimerTweener,
        delay,
        subject,
        target,
        method,
        after
    )
    self:register(tweener)
    return tweener
end
return ____exports
