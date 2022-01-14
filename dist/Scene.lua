--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Layer = require("Layer")
local Layer = ____Layer.Layer
local ____Signal = require("Signal")
local Signal = ____Signal.Signal
____exports.SceneBase = __TS__Class()
local SceneBase = ____exports.SceneBase
SceneBase.name = "SceneBase"
__TS__ClassExtends(SceneBase, Layer)
function SceneBase.prototype.____constructor(self, ...)
    Layer.prototype.____constructor(self, ...)
    self.signal = __TS__New(Signal)
end
return ____exports
