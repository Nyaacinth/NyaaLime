import {DrawMode} from "love.graphics"
import {IRenderable} from "../Renderable"

/** Ellipse Class */
export class Ellipse implements IRenderable {
    /** Drawing Mode */
    mode: DrawMode

    /** Drawing Width */
    width: number

    /** Drawing Height */
    height: number

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
     */
    constructor(mode: DrawMode, width: number, height: number) {
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
            love.graphics.ellipse("fill", 0, 0, this.width, this.height)
        }
        love.graphics.setLineWidth(this.border_thickness)
        love.graphics.setColor(this.border_color)
        love.graphics.ellipse("line", 0, 0, this.width, this.height)
        love.graphics.pop()
    }
}
