--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Layer = __TS__Class()
local Layer = ____exports.Layer
Layer.name = "Layer"
function Layer.prototype.____constructor(self)
    self.children = {}
end
function Layer.prototype.addChild(self, child)
    if __TS__ArrayIncludes(self.children, child) then
        return
    end
    __TS__ArrayPush(self.children, child)
end
function Layer.prototype.removeChild(self, child)
    local child_index = __TS__ArrayIndexOf(self.children, child)
    if child_index > -1 then
        __TS__ArraySplice(self.children, child_index, 1)
    end
end
function Layer.prototype.update(self, dt)
    __TS__ArrayForEach(
        self.children,
        function(____, child) return child:update(dt) end
    )
end
function Layer.prototype.draw(self)
    __TS__ArrayForEach(
        self.children,
        function(____, child) return child:draw() end
    )
end
return ____exports
