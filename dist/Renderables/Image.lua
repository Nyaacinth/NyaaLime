--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Image = __TS__Class()
local Image = ____exports.Image
Image.name = "Image"
function Image.prototype.____constructor(self, image_data)
    self.image_drawable = love.graphics.newImage(image_data)
end
function Image.prototype.update(self)
end
function Image.prototype.draw(self)
    love.graphics.draw(self.image_drawable)
end
return ____exports
