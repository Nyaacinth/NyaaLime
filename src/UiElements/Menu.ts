import { ColouredText, discard, Font } from "love.graphics"
import {KeyConstant} from "love.keyboard"
import {Input} from "../Input"
import {IRenderable} from "../Renderable"

/** Menu Class */
export class Menu implements IRenderable {
    /** Menu Font */
    font: Font

    /** Selected Item Counter */
    selected_item = 0

    /** Menu Items */
    items: [display: string | ColouredText, action: () => void][]

    /** Input Handler */
    protected input: Input

    /** Handled Tag */
    protected handled = false

    /**
     * Menu Constructor
     * @param bindings Input Bindings, need "up", "down", "action" binded
     * @param items Menu Items
     * @param font Menu Font
     */
    constructor(
        bindings: {[action_name: string]: KeyConstant},
        items: [display: string | ColouredText, action: () => void][] = [],
        font: Font = love.graphics.getFont() ?? love.graphics.newFont()
    ) {
        this.input = new Input(bindings)
        this.items = items
        this.font = font
    }

    /** Update Method, move cursor */
    update() {
        if (this.input.isDown() && !this.handled) {
            if (this.input.isDown("up")) {
                this.selected_item -= 1
                if (this.selected_item < 0) {
                    this.selected_item = this.items.length - 1
                }
            } else if (this.input.isDown("down")) {
                this.selected_item += 1
                if (this.selected_item > this.items.length - 1) {
                    this.selected_item = 0
                }
            }
            this.handled = true
        }
        if (!this.input.isDown()) {
            this.handled = false
        }
    }

    /** Draw Method, draw the menu */
    draw() {
        love.graphics.push("all")
        love.graphics.setFont(this.font)
        for (let key = 0; key < this.items.length; key++) {
            let display = this.items[key][0]
            love.graphics.print(display, 0, key * this.font.getHeight())
            if (this.selected_item == key) {
                let raw_display = ""
                if (typeof display == "string") {
                    raw_display = display
                } else {
                    for (let display_element of display) {
                        if (typeof display_element == "string") {
                            raw_display += display_element
                        }
                    }
                }
                love.graphics.rectangle("line", 0, key * this.font.getHeight(), this.font.getWidth(raw_display), this.font.getHeight())
            }
        }
        love.graphics.pop()
    }
}
