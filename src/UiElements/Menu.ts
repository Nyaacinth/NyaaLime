import { ColouredText, discard, Font } from "love.graphics"
import {KeyConstant} from "love.keyboard"
import {Input} from "../Input"
import {IRenderable} from "../Renderable"

class Menu implements IRenderable {
    font: Font
    selected_item = 0
    items: [display: string | ColouredText, action: () => void][]
    protected input: Input
    protected just_pressed = false
    constructor(
        bindings: {[action_name: string]: KeyConstant},
        items: [display: string, action: () => void][] = [],
        font: Font = love.graphics.getFont() ?? love.graphics.newFont()
    ) {
        this.input = new Input(bindings)
        this.items = items
        this.font = font
    }
    update() {}
    draw() {
        love.graphics.push("all")
        love.graphics.setFont(this.font)
        for (let key = 0; key < this.items.length; key++) {
            let display = this.items[key][0]
            love.graphics.print(display, key * this.font.getHeight())
            if (this.selected_item == key) {
                let raw_display = ""
                switch (typeof display) {
                    case "string": {
                        raw_display = display
                    }
                    default: {
                        for (let display_element of display) {
                            if (typeof display_element == "string") {
                                raw_display += display_element
                            }
                        }
                    }
                }
                love.graphics.rectangle("line", 0, key * this.font.getHeight(), this.font.getWidth(raw_display), this.font.getHeight())
            }
        }
        love.graphics.pop()
    }
}
