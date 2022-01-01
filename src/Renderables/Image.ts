import {IRenderable} from "../Renderable"

export class Image implements IRenderable {
    /** Image Object */
    image: import("love.graphics").Image

    /**
     * Image Constructor
     * @param image Image Object
     */
    constructor(image: import("love.graphics").Image) {
        this.image = image
    }

    /** Update Method, no functional */
    update() {}

    /** Draw Method, draw the image */
    draw() {
        love.graphics.draw(this.image)
    }
}
