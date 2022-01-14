import { Layer } from "./Layer";
import { IRenderable } from "./Renderable";
/** Interface of a Sprite */
export interface ISprite extends IRenderable {
    /** Drawable Object */
    graphic?: IRenderable;
    /** Position X-axis */
    x: number;
    /** Position Y-axis */
    y: number;
    /** Scale Factor */
    scale: number;
    /** Rotation is Radians */
    rotation: number;
}
/** Sprite Base Class */
export declare abstract class SpriteBase implements ISprite {
    /** Drawable Object */
    graphic?: IRenderable;
    /** Position X-axis */
    x: number;
    /** Position Y-axis */
    y: number;
    /** Scale Factor */
    scale: number;
    /** Rotation, in radians */
    rotation: number;
    /**
     * Sprite Base Constructor
     * @param x Position X-axis
     * @param y Position Y-axis
     * @param scale Scale Factor
     * @param rotation Rotation, in radians
     * @param graphic Renderable Graphic
     */
    constructor(x?: number, y?: number, scale?: number, rotation?: number, graphic?: IRenderable);
    /**
     * Use Graphic for Sprite
     * @param graphic Renderable Graphic
     */
    useGraphic(graphic: IRenderable): void;
    /**
     * Update Method
     * @param dt Delta Time
     */
    update(dt: number): void;
    /** Drawing Method */
    draw(): void;
}
/** Sprite Class */
export declare class Sprite extends SpriteBase {
    /** Graphic Layer */
    graphic: Layer;
    /**
     * Sprite Constructor
     * @param x Position X-axis
     * @param y Position Y-axis
     * @param scale Scale Factor
     * @param rotation Rotation, in radians
     */
    constructor(x?: number, y?: number, scale?: number, rotation?: number);
}
