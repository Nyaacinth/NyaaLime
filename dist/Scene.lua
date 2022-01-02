--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 40,["6"] = 40,["7"] = 40,["9"] = 42,["10"] = 40,["11"] = 48,["12"] = 49,["15"] = 50,["16"] = 48,["17"] = 57,["18"] = 58,["19"] = 59,["20"] = 60,["22"] = 57,["23"] = 64,["24"] = 65,["25"] = 65,["26"] = 65,["27"] = 65,["28"] = 64,["29"] = 68,["30"] = 69,["31"] = 69,["32"] = 69,["33"] = 69,["34"] = 68});
local ____exports = {}
____exports.SceneBase = __TS__Class()
local SceneBase = ____exports.SceneBase
SceneBase.name = "SceneBase"
function SceneBase.prototype.____constructor(self)
    self.children = {}
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
