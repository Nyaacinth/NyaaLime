import { DrawMode } from "love.graphics";
import { IUiElement } from "../UiElement";
export declare class Polygon implements IUiElement {
    /** Position X-axis */
    x: number;
    /** Position Y-axis */
    y: number;
    /** Drawing Width */
    get width(): number;
    /** Drawing Height */
    get height(): number;
    /** Drawing Mode */
    mode: DrawMode;
    /** Points Details, `[x1, y1, x2, y2, ...]` */
    points: number[];
    /** Polygon Color */
    color: [r: number, g: number, b: number, a?: number];
    /** Border Thickness */
    border_thickness: number;
    /** Border Color */
    border_color: [r: number, g: number, b: number, a?: number];
    /**
     * Polygon Constructor
     * @param mode Drawing Mode
     * @param points Points Details, `[x1, y1, x2, y2, ...]`
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    constructor(mode: DrawMode, points: number[], x?: number, y?: number);
    /** Update Method, no functional */
    update(): void;
    /** Draw Method, draw a polygon */
    draw(): void;
}
