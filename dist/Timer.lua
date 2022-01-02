--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 26,["6"] = 26,["7"] = 26,["8"] = 73,["9"] = 37,["10"] = 37,["11"] = 37,["12"] = 37,["13"] = 37,["14"] = 37,["15"] = 37,["16"] = 37,["17"] = 37,["18"] = 46,["19"] = 47,["20"] = 48,["21"] = 49,["22"] = 37,["23"] = 37,["24"] = 75,["25"] = 76,["26"] = 77,["27"] = 78,["28"] = 79,["29"] = 80,["30"] = 81,["31"] = 83,["32"] = 84,["33"] = 85,["34"] = 86,["35"] = 87,["36"] = 88,["38"] = 90,["39"] = 91,["40"] = 73,["41"] = 95,["42"] = 96,["43"] = 97,["44"] = 98,["45"] = 99,["46"] = 100,["48"] = 95,["49"] = 106,["50"] = 106,["51"] = 106,["53"] = 112,["54"] = 111,["55"] = 119,["56"] = 120,["59"] = 123,["60"] = 119,["61"] = 130,["62"] = 131,["63"] = 132,["64"] = 133,["66"] = 130,["67"] = 138,["68"] = 139,["69"] = 138,["70"] = 146,["72"] = 147,["73"] = 147,["74"] = 148,["75"] = 149,["76"] = 150,["77"] = 151,["78"] = 152,["80"] = 154,["82"] = 155,["83"] = 155,["84"] = 155,["85"] = 155,["87"] = 155,["88"] = 156,["89"] = 157,["91"] = 147,["94"] = 146,["95"] = 170,["96"] = 171,["97"] = 171,["98"] = 171,["99"] = 171,["100"] = 171,["101"] = 171,["102"] = 171,["103"] = 171,["104"] = 179,["105"] = 180,["106"] = 170,["107"] = 192,["108"] = 192,["109"] = 192,["111"] = 192,["112"] = 192,["114"] = 193,["115"] = 193,["116"] = 193,["117"] = 193,["118"] = 193,["119"] = 193,["120"] = 193,["121"] = 193,["122"] = 193,["123"] = 202,["124"] = 203,["125"] = 192,["126"] = 213,["127"] = 214,["128"] = 214,["129"] = 214,["130"] = 214,["131"] = 214,["132"] = 214,["133"] = 214,["134"] = 214,["135"] = 214,["136"] = 223,["137"] = 224,["138"] = 213,["139"] = 236,["140"] = 243,["141"] = 243,["142"] = 243,["143"] = 243,["144"] = 243,["145"] = 243,["146"] = 243,["147"] = 243,["148"] = 244,["149"] = 245,["150"] = 236});
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
