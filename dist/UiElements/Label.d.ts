import { ColouredText, Font } from "love.graphics";
import { IUiElement } from "../UiElement";
export declare class Label implements IUiElement {
    /** Position X-axis */
    x: number;
    /** Position Y-axis */
    y: number;
    /** Width */
    get width(): number;
    /** Height */
    get height(): number;
    /** Text Content */
    text: string | ColouredText;
    /** Text Font */
    font: Font;
    /**
     * Text Consturctor
     * @param text Text Content
     * @param font Font Object
     */
    constructor(text: string | ColouredText, font?: Font, x?: number, y?: number);
    /** Update Method, no functional */
    update(): void;
    /** Draw Method, draw the text */
    draw(): void;
}
