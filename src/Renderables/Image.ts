import {ImageData} from "love.image"
import {IRenderable} from "../Renderable"

/** Image Class */
export class Image implements IRenderable {
    /** Image Object */
    image_drawable: import("love.graphics").Image

    /**
     * Image Constructor
     * @param image_data Image Data
     */
    constructor(image_data: ImageData) {
        this.image_drawable = love.graphics.newImage(image_data)
    }

    /** Update Method, no functional */
    update() {}

    /** Draw Method, draw the image */
    draw() {
        love.graphics.draw(this.image_drawable)
    }
}
