--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Image = __TS__Class()
local Image = ____exports.Image
Image.name = "Image"
function Image.prototype.____constructor(self, image_data, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self.x = x
    self.y = y
    self.image_drawable = love.graphics.newImage(image_data)
end
__TS__SetDescriptor(
    Image.prototype,
    "width",
    {get = function(self)
        return self.image_drawable:getWidth()
    end},
    true
)
__TS__SetDescriptor(
    Image.prototype,
    "height",
    {get = function(self)
        return self.image_drawable:getHeight()
    end},
    true
)
function Image.prototype.update(self)
end
function Image.prototype.draw(self)
    love.graphics.draw(self.image_drawable, self.x, self.y)
end
return ____exports
