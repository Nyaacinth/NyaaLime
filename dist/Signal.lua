--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["9"] = 3,["10"] = 1,["11"] = 10,["12"] = 10,["13"] = 11,["14"] = 12,["15"] = 12,["16"] = 12,["17"] = 12,["18"] = 12,["19"] = 12,["20"] = 12,["22"] = 10,["23"] = 21,["24"] = 22,["25"] = 23,["27"] = 25,["28"] = 26,["31"] = 27,["32"] = 21,["33"] = 35,["34"] = 36,["37"] = 37,["38"] = 38,["39"] = 39,["40"] = 40,["42"] = 42,["43"] = 43,["45"] = 35,["46"] = 55,["47"] = 56,["48"] = 57,["50"] = 59,["52"] = 55});
local ____exports = {}
____exports.Signal = __TS__Class()
local Signal = ____exports.Signal
Signal.name = "Signal"
function Signal.prototype.____constructor(self)
    self.connected_signals = {}
end
function Signal.prototype.emit(self, signal_name, ...)
    local varargs = {...}
    if self.connected_signals[signal_name] then
        __TS__ArrayForEach(
            self.connected_signals[signal_name],
            function(____, callback) return callback(
                nil,
                unpack(varargs)
            ) end
        )
    end
end
function Signal.prototype.connect(self, signal_name, callback)
    if not self.connected_signals[signal_name] then
        self.connected_signals[signal_name] = {}
    end
    local connections = self.connected_signals[signal_name]
    if __TS__ArrayIncludes(connections, callback) then
        return
    end
    __TS__ArrayPush(connections, callback)
end
function Signal.prototype.disconnect(self, signal_name, callback)
    if not self.connected_signals[signal_name] then
        return
    end
    local connections = self.connected_signals[signal_name]
    local callback_index = __TS__ArrayIndexOf(connections, callback)
    if callback_index > -1 then
        __TS__ArraySplice(connections, callback_index, 1)
    end
    if #connections == 0 then
        __TS__Delete(self.connected_signals, signal_name)
    end
end
function Signal.prototype.clear(self, signal_name)
    if signal_name then
        __TS__Delete(self.connected_signals, signal_name)
    else
        self.connected_signals = {}
    end
end
return ____exports
