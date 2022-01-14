--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Label = __TS__Class()
local Label = ____exports.Label
Label.name = "Label"
function Label.prototype.____constructor(self, text, font, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self.x = x
    self.y = y
    self.text = text
    self.font = font or love.graphics.getFont() or love.graphics.newFont()
end
__TS__SetDescriptor(
    Label.prototype,
    "width",
    {get = function(self)
        local text = self.text
        local raw_text = ""
        if type(text) == "string" then
            raw_text = text
        else
            for ____, text_element in ipairs(text) do
                if type(text_element) == "string" then
                    raw_text = raw_text .. text_element
                end
            end
        end
        return self.font:getWidth(raw_text)
    end},
    true
)
__TS__SetDescriptor(
    Label.prototype,
    "height",
    {get = function(self)
        return self.font:getHeight()
    end},
    true
)
function Label.prototype.update(self)
end
function Label.prototype.draw(self)
    love.graphics.push("all")
    love.graphics.setFont(self.font)
    love.graphics.print(self.text, self.x, self.y)
    love.graphics.pop()
end
return ____exports
