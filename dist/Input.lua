--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Input = __TS__Class()
local Input = ____exports.Input
Input.name = "Input"
function Input.prototype.____constructor(self, bindings)
    if bindings == nil then
        bindings = {}
    end
    self.bindings = bindings
end
function Input.prototype.bind(self, scancode, action_name)
    self.bindings[action_name] = scancode
end
function Input.prototype.isDown(self, action_name)
    if action_name then
        return love.keyboard.isDown(self.bindings[action_name])
    end
    for action_name in pairs(self.bindings) do
        if love.keyboard.isDown(self.bindings[action_name]) then
            return true
        end
    end
    return false
end
function Input.prototype.getKeyPressed(self)
    local keypressed = {}
    for action_name in pairs(self.bindings) do
        local key = self.bindings[action_name]
        if love.keyboard.isDown(key) then
            __TS__ArrayPush(keypressed, action_name)
        end
    end
    return keypressed
end
return ____exports
