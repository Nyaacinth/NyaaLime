import { IRenderable } from "./Renderable";
import { IScene } from "./Scene";
/** Interface of a Sprite */
export interface ISprite extends IScene {
    /** Drawable Object */
    graphic: IRenderable;
    /** Position X-axis */
    x: number;
    /** Position Y-axis */
    y: number;
    /** @description Calling this method should draw object at the right position, coordinates translation needs to be handled here */
    draw(): void;
}
/** Sprite Base Class */
export declare abstract class SpriteBase implements ISprite, IScene {
    /** Drawable Object */
    graphic: IRenderable;
    /** Position X-axis */
    x: number;
    /** Position Y-axis */
    y: number;
    /**
     * Sprite Constructor
     * @param x Position X-axis
     * @param y Position Y-axis
     * @param graphic Renderable Graphic
     */
    constructor(x: number, y: number, graphic: IRenderable);
    /**
     * Update Method
     * @param dt Delta Time
     */
    update(dt: number): void;
    /** Drawing Callback */
    draw(): void;
}
/** Sprite Class */
export declare class Sprite extends SpriteBase {
}
