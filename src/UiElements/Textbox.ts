import {ColouredText, Font} from "love.graphics"
import {IUiElement} from "../UiElement"
import {Rectangle} from "./Rectangle"

/** Textbox Class */
export class Textbox extends Rectangle implements IUiElement {
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
    constructor(text: string | ColouredText, width: number, height: number, font: Font = love.graphics.getFont() ?? love.graphics.newFont(), x: number = 0, y: number = 0) {
        super("line", width, height, x, y)
        this.text = text
        this.font = font
    }

    override draw() {
        love.graphics.push("all")
        love.graphics.setFont(this.font)
        love.graphics.printf(this.text, this.x + this.roundness, this.y + this.roundness, this.width)
        love.graphics.pop()
        super.draw()
    }
}
