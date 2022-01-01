import {DrawMode} from "love.graphics"
import {IRenderable} from "../Renderable"

export class Rectangle implements IRenderable {
    /** Drawing Mode */
    mode: DrawMode

    /** Drawing Width */
    width: number

    /** Drawing Height */
    height: number

    /**
     * Rectangle Constructor
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

    /** Draw Method, draw a rectangle */
    draw() {
        love.graphics.rectangle(this.mode, 0, 0, this.width, this.height)
    }
}
