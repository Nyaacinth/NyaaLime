import { Image, Quad } from "love.graphics";
import { IUiElement } from "../UiElement";
/** Tilemap Class */
export declare class Tilemap implements IUiElement {
    /** Position X-axis */
    x: number;
    /** Position Y-axis */
    y: number;
    /** Drawing Width */
    get width(): number;
    /** Drawing Height */
    get height(): number;
    /** Tileset Image */
    tileset_image: Image;
    /** Tileset Quads */
    tileset: Quad[];
    /** Tile Width */
    tile_width: number;
    /** Tile Height */
    tile_height: number;
    /** Tilemap Data */
    tilemap: number[][];
    /**
     * Tilemap Constructor
     * @param tileset_image Tileset Image
     * @param tile_width Tile Width
     * @param tile_height Tile Height
     * @param tilemap Tilemap Data
     */
    constructor(tileset_image: Image, tile_width: number, tile_height: number, tilemap: number[][], x?: number, y?: number);
    /** Update Method, no functional */
    update(): void;
    /** Draw Method, draw the tilemap */
    draw(): void;
}
