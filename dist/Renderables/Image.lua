--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 3,["8"] = 11,["9"] = 12,["10"] = 11,["11"] = 16,["12"] = 16,["13"] = 19,["14"] = 20,["15"] = 19});
local ____exports = {}
____exports.Image = __TS__Class()
local Image = ____exports.Image
Image.name = "Image"
function Image.prototype.____constructor(self, image)
    self.image = image
end
function Image.prototype.update(self)
end
function Image.prototype.draw(self)
    love.graphics.draw(self.image)
end
return ____exports
