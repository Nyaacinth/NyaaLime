import {ImageData} from "love.image"
import {IUiElement} from "../UiElement"

/** Image Class */
export class Image implements IUiElement {
    /** Position X-axis */
    x: number

    /** Position Y-axis */
    y: number

    /** Drawing Width */
    get width() {
        return this.image_drawable.getWidth()
    }

    /** Drawing Height */
    get height() {
        return this.image_drawable.getHeight()
    }

    /** Image Object */
    readonly image_drawable: import("love.graphics").Image

    /**
     * Image Constructor
     * @param image_data Image Data
     */
    constructor(image_data: ImageData, x: number = 0, y: number = 0) {
        this.x = x
        this.y = y
        this.image_drawable = love.graphics.newImage(image_data)
    }

    /** Update Method, no functional */
    update() {}

    /** Draw Method, draw the image */
    draw() {
        love.graphics.draw(this.image_drawable, this.x, this.y)
    }
}
