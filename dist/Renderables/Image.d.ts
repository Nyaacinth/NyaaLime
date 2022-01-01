import { IRenderable } from "../Renderable";
export declare class Image implements IRenderable {
    /** Image Object */
    image: import("love.graphics").Image;
    /**
     * Image Constructor
     * @param image Image Object
     */
    constructor(image: import("love.graphics").Image);
    /** Update Method, no functional */
    update(): void;
    /** Draw Method, draw the image */
    draw(): void;
}
