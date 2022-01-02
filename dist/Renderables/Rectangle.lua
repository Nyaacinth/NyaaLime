--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Rectangle = __TS__Class()
local Rectangle = ____exports.Rectangle
Rectangle.name = "Rectangle"
function Rectangle.prototype.____constructor(self, mode, width, height)
    self.mode = mode
    self.width = width
    self.height = height
end
function Rectangle.prototype.update(self)
end
function Rectangle.prototype.draw(self)
    love.graphics.rectangle(
        self.mode,
        0,
        0,
        self.width,
        self.height
    )
end
return ____exports
