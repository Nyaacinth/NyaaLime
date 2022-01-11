import { ImageData } from "love.image";
import { IRenderable } from "../Renderable";
/** Image Class */
export declare class Image implements IRenderable {
    /** Image Object */
    image_drawable: import("love.graphics").Image;
    /**
     * Image Constructor
     * @param image_data Image Data
     */
    constructor(image_data: ImageData);
    /** Update Method, no functional */
    update(): void;
    /** Draw Method, draw the image */
    draw(): void;
}
