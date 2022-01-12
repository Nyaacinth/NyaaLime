import { DrawMode } from "love.graphics";
import { IRenderable } from "../Renderable";
export declare class Rectangle implements IRenderable {
    /** Drawing Mode */
    mode: DrawMode;
    /** Drawing Width */
    width: number;
    /** Drawing Height */
    height: number;
    /** Round corner */
    roundness: number;
    /** Rectangle Color */
    color: [r: number, g: number, b: number, a?: number];
    /** Border Thickness */
    border_thickness: number;
    /** Border Color */
    border_color: [r: number, g: number, b: number, a?: number];
    /**
     * Rectangle Constructor
     * @param mode Drawing Mode
     * @param width Drawing Width
     * @param height Drawing Height
     */
    constructor(mode: DrawMode, width: number, height: number);
    /** Update Method, no functional */
    update(): void;
    /** Draw Method, draw a rectangle */
    draw(): void;
}
