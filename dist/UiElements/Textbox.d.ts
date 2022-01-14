import { ColouredText, Font } from "love.graphics";
import { IUiElement } from "../UiElement";
import { Rectangle } from "./Rectangle";
/** Textbox Class */
export declare class Textbox extends Rectangle implements IUiElement {
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
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    constructor(text: string | ColouredText, width: number, height: number, font?: Font, x?: number, y?: number);
    draw(): void;
}
