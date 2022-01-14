import {ColouredText, Font} from "love.graphics"
import {IUiElement} from "../UiElement"

export class Label implements IUiElement {
    /** Position X-axis */
    x: number

    /** Position Y-axis */
    y: number

    /** Width */
    get width() {
        let text = this.text
        let raw_text = ""
        if (typeof text == "string") {
            raw_text = text
        } else {
            for (let text_element of text) {
                if (typeof text_element == "string") {
                    raw_text += text_element
                }
            }
        }
        return this.font.getWidth(raw_text)
    }

    /** Height */
    get height() {
        return this.font.getHeight()
    }

    /** Text Content */
    text: string | ColouredText

    /** Text Font */
    font: Font

    /**
     * Text Consturctor
     * @param text Text Content
     * @param font Font Object
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    constructor(text: string | ColouredText, font?: Font, x: number = 0, y: number = 0) {
        this.x = x
        this.y = y
        this.text = text
        this.font = font ?? love.graphics.getFont() ?? love.graphics.newFont()
    }

    /** Update Method, no functional */
    update() {}

    /** Draw Method, draw the text */
    draw() {
        love.graphics.push("all")
        love.graphics.setFont(this.font)
        love.graphics.print(this.text, this.x, this.y)
        love.graphics.pop()
    }
}
