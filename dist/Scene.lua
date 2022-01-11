--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Signal = require("Signal")
local Signal = ____Signal.Signal
____exports.SceneBase = __TS__Class()
local SceneBase = ____exports.SceneBase
SceneBase.name = "SceneBase"
function SceneBase.prototype.____constructor(self)
    self.children = {}
    self.signal = __TS__New(Signal)
end
function SceneBase.prototype.addChild(self, child)
    if __TS__ArrayIncludes(self.children, child) then
        return
    end
    __TS__ArrayPush(self.children, child)
end
function SceneBase.prototype.removeChild(self, child)
    local child_index = __TS__ArrayIndexOf(self.children, child)
    if child_index > -1 then
        __TS__ArraySplice(self.children, child_index, 1)
    end
end
function SceneBase.prototype.update(self, dt)
    __TS__ArrayForEach(
        self.children,
        function(____, child) return child:update(dt) end
    )
end
function SceneBase.prototype.draw(self)
    __TS__ArrayForEach(
        self.children,
        function(____, child) return child:draw() end
    )
end
return ____exports
