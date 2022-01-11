--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Signal = __TS__Class()
local Signal = ____exports.Signal
Signal.name = "Signal"
function Signal.prototype.____constructor(self)
    self.connected_signals = {}
end
function Signal.prototype.emit(self, signal_name, ...)
    local varargs = {...}
    if self.connected_signals["*"] then
        __TS__ArrayForEach(
            self.connected_signals["*"],
            function(____, callback) return callback(
                nil,
                unpack(varargs)
            ) end
        )
    end
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
