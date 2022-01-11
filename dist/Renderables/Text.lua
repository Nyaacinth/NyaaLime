--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Text = __TS__Class()
local Text = ____exports.Text
Text.name = "Text"
function Text.prototype.____constructor(self, text, font)
    self.text = text
    self.font = font or love.graphics.getFont() or love.graphics.newFont()
end
function Text.prototype.update(self)
end
function Text.prototype.draw(self)
    love.graphics.push("all")
    love.graphics.setFont(self.font)
    love.graphics.print(self.text)
    love.graphics.pop()
end
return ____exports
