import { ColouredText, Font } from "love.graphics";
import { IRenderable } from "../Renderable";
export declare class Label implements IRenderable {
    /** Text Content */
    text: string | ColouredText;
    /** Text Font */
    font: Font;
    /**
     * Text Consturctor
     * @param text Text Content
     * @param font Font Object
     */
    constructor(text: string | ColouredText, font?: Font);
    /** Update Method, no functional */
    update(): void;
    /** Draw Method, draw the text */
    draw(): void;
}
