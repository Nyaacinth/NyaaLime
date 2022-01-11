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
        love.graphics.ellipse(this.mode, 0, 0, this.width, this.height)
    }
}
