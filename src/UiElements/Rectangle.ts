import {DrawMode} from "love.graphics"
import {IUiElement} from "../UiElement"

export class Rectangle implements IUiElement {
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

    /** Round corner */
    roundness = 0

    /** Rectangle Color */
    color: [r: number, g: number, b: number, a?: number] = [1, 1, 1]

    /** Border Thickness */
    border_thickness = 0

    /** Border Color */
    border_color: [r: number, g: number, b: number, a?: number] = [1, 1, 1]

    /**
     * Rectangle Constructor
     * @param mode Drawing Mode
     * @param width Drawing Width
     * @param height Drawing Height
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

    /** Draw Method, draw a rectangle */
    draw() {
        love.graphics.push("all")
        if (this.mode == "fill") {
            love.graphics.setColor(this.color)
            love.graphics.rectangle("fill", this.x, this.y, this.width, this.height, this.roundness)
        }
        love.graphics.setLineWidth(this.border_thickness)
        love.graphics.setColor(this.border_color)
        love.graphics.rectangle("line", this.x, this.y, this.width, this.height, this.roundness)
        love.graphics.pop()
    }
}
