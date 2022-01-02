--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Ellipse = __TS__Class()
local Ellipse = ____exports.Ellipse
Ellipse.name = "Ellipse"
function Ellipse.prototype.____constructor(self, mode, width, height)
    self.mode = mode
    self.width = width
    self.height = height
end
function Ellipse.prototype.update(self)
end
function Ellipse.prototype.draw(self)
    love.graphics.ellipse(
        self.mode,
        0,
        0,
        self.width,
        self.height
    )
end
return ____exports
