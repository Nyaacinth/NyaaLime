import {ColouredText, DrawMode, Font} from "love.graphics"
import {IRenderable, Rectangle} from ".."

/** Textbox Class */
export class Textbox extends Rectangle implements IRenderable {
    /** Text Content */
    text: string | ColouredText

    /** Text Font */
    font: Font

    /**
     * Textbox Constructor
     * @param text Text Content
     * @param font Text Font
     * @param width Drawing Width
     * @param height Drawing Height
     */
    constructor(text: string | ColouredText, font: Font, width: number, height: number) {
        super("line", width, height)
        this.text = text
        this.font = font
    }

    override draw() {
        love.graphics.push("all")
        love.graphics.setFont(this.font)
        love.graphics.printf(this.text, this.roundness, this.roundness, this.width)
        love.graphics.pop()
        super.draw()
    }
}
