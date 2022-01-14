import { DrawMode } from "love.graphics";
import { IUiElement } from "../UiElement";
/** Ellipse Class */
export declare class Ellipse implements IUiElement {
    /** Position X-axis */
    x: number;
    /** Position Y-axis */
    y: number;
    /** Drawing Width */
    width: number;
    /** Drawing Height */
    height: number;
    /** Drawing Mode */
    mode: DrawMode;
    /** Ellipse Color */
    color: [r: number, g: number, b: number, a?: number];
    /** Border Thickness */
    border_thickness: number;
    /** Border Color */
    border_color: [r: number, g: number, b: number, a?: number];
    /**
     * Ellipse Constructor
     * @param mode Drawing Mode
     * @param width Drawing Width
     * @param height Drawing Height
     */
    constructor(mode: DrawMode, width: number, height: number, x?: number, y?: number);
    /** Update Method, no functional */
    update(): void;
    /** Draw Method, draw a ellipse */
    draw(): void;
}
