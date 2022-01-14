import {DrawMode} from "love.graphics"
import {IUiElement} from "../UiElement"

/** Ellipse Class */
export class Ellipse implements IUiElement {
    /** Position X-axis */
    x: number

    /** Position Y-axis */
    y: number

    /** Drawing Width */
    width: number

    /** Drawing Height */
    height: number

    /** Drawing Mode */
    mode: DrawMode

    /** Ellipse Color */
    color: [r: number, g: number, b: number, a?: number] = [1, 1, 1]

    /** Border Thickness */
    border_thickness = 0

    /** Border Color */
    border_color: [r: number, g: number, b: number, a?: number] = [1, 1, 1]

    /**
     * Ellipse Constructor
     * @param mode Drawing Mode
     * @param width Drawing Width
     * @param height Drawing Height
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    constructor(mode: DrawMode, width: number, height: number, x: number = 0, y: number = 0) {
        this.x = x
        this.y = y
        this.mode = mode
        this.width = width
        this.height = height
    }

    /** Update Method, no functional */
    update() {}

    /** Draw Method, draw a ellipse */
    draw() {
        love.graphics.push("all")
        if (this.mode == "fill") {
            love.graphics.setColor(this.color)
            love.graphics.ellipse("fill", this.x, this.y, this.width, this.height)
        }
        love.graphics.setLineWidth(this.border_thickness)
        love.graphics.setColor(this.border_color)
        love.graphics.ellipse("line", this.x, this.y, this.width, this.height)
        love.graphics.pop()
    }
}
