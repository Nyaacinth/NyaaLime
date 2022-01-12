import { ColouredText, Font } from "love.graphics";
import { IRenderable } from "../Renderable";
import { Rectangle } from "../Renderables/Rectangle";
/** Textbox Class */
export declare class Textbox extends Rectangle implements IRenderable {
    /** Text Content */
    text: string | ColouredText;
    /** Text Font */
    font: Font;
    /**
     * Textbox Constructor
     * @param text Text Content
     * @param font Text Font
     * @param width Drawing Width
     * @param height Drawing Height
     */
    constructor(text: string | ColouredText, width: number, height: number, font?: Font);
    draw(): void;
}
