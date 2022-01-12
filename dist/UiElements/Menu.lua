--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Input = require("Input")
local Input = ____Input.Input
____exports.Menu = __TS__Class()
local Menu = ____exports.Menu
Menu.name = "Menu"
function Menu.prototype.____constructor(self, bindings, items, font)
    if items == nil then
        items = {}
    end
    if font == nil then
        font = love.graphics.getFont() or love.graphics.newFont()
    end
    self.selected_item = 0
    self.just_pressed = false
    self.input = __TS__New(Input, bindings)
    self.items = items
    self.font = font
end
function Menu.prototype.update(self)
end
function Menu.prototype.draw(self)
    love.graphics.push("all")
    love.graphics.setFont(self.font)
    do
        local key = 0
        while key < #self.items do
            local display = self.items[key + 1][1]
            love.graphics.print(
                display,
                key * self.font:getHeight()
            )
            if self.selected_item == key then
                local raw_display = ""
                if type(display) == "string" then
                    raw_display = display
                else
                    for ____, display_element in ipairs(display) do
                        if type(display_element) == "string" then
                            raw_display = raw_display .. display_element
                        end
                    end
                end
                love.graphics.rectangle(
                    "line",
                    0,
                    key * self.font:getHeight(),
                    self.font:getWidth(raw_display),
                    self.font:getHeight()
                )
            end
            key = key + 1
        end
    end
    love.graphics.pop()
end
return ____exports
