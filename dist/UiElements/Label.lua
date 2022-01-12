--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Label = __TS__Class()
local Label = ____exports.Label
Label.name = "Label"
function Label.prototype.____constructor(self, text, font)
    self.text = text
    self.font = font or love.graphics.getFont() or love.graphics.newFont()
end
function Label.prototype.update(self)
end
function Label.prototype.draw(self)
    love.graphics.push("all")
    love.graphics.setFont(self.font)
    love.graphics.print(self.text)
    love.graphics.pop()
end
return ____exports
