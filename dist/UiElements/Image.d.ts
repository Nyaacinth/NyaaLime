import { ImageData } from "love.image";
import { IUiElement } from "../UiElement";
/** Image Class */
export declare class Image implements IUiElement {
    /** Position X-axis */
    x: number;
    /** Position Y-axis */
    y: number;
    /** Drawing Width */
    get width(): number;
    /** Drawing Height */
    get height(): number;
    /** Image Object */
    readonly image_drawable: import("love.graphics").Image;
    /**
     * Image Constructor
     * @param image_data Image Data
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    constructor(image_data: ImageData, x?: number, y?: number);
    /** Update Method, no functional */
    update(): void;
    /** Draw Method, draw the image */
    draw(): void;
}
