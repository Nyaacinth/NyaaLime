--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 4,["8"] = 20,["9"] = 21,["10"] = 22,["11"] = 23,["12"] = 20,["13"] = 27,["14"] = 27,["15"] = 30,["16"] = 31,["17"] = 31,["18"] = 31,["19"] = 31,["20"] = 31,["21"] = 31,["22"] = 31,["23"] = 30});
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
