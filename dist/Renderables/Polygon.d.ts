import { DrawMode } from "love.graphics";
import { IRenderable } from "../Renderable";
export declare class Polygon implements IRenderable {
    /** Drawing Mode */
    mode: DrawMode;
    /** Points Details, `[x1, y1, x2, y2, ...]` */
    points: number[];
    /**
     * Polygon Constructor
     * @param mode Drawing Mode
     * @param points Points Details, `[x1, y1, x2, y2, ...]`
     */
    constructor(mode: DrawMode, points: number[]);
    /** Update Method, no functional */
    update(): void;
    /** Draw Method, draw a polygon */
    draw(): void;
}