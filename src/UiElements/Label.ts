import {ColouredText, Font} from "love.graphics"
import {IRenderable} from "../Renderable"

export class Label implements IRenderable {
    /** Text Content */
    text: string | ColouredText

    /** Text Font */
    font: Font

    /**
     * Text Consturctor
     * @param text Text Content
     * @param font Font Object
     */
    constructor(text: string | ColouredText, font?: Font) {
        this.text = text
        this.font = font ?? love.graphics.getFont() ?? love.graphics.newFont()
    }

    /** Update Method, no functional */
    update() {}

    /** Draw Method, draw the text */
    draw() {
        love.graphics.push("all")
        love.graphics.setFont(this.font)
        love.graphics.print(this.text)
        love.graphics.pop()
    }
}
