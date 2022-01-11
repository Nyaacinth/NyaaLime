import {IRenderable} from "./Renderable"

/** Interface of a Sprite */
export interface ISprite extends IRenderable {
    /** Drawable Object */
    graphic: IRenderable

    /** Position X-axis */
    x: number

    /** Position Y-axis */
    y: number
}

/** Sprite Base Class */
export abstract class SpriteBase implements ISprite {
    /** Drawable Object */
    graphic: IRenderable

    /** Position X-axis */
    x: number

    /** Position Y-axis */
    y: number

    /**
     * Sprite Constructor
     * @param x Position X-axis
     * @param y Position Y-axis
     * @param graphic Renderable Graphic
     */
    constructor(x: number, y: number, graphic: IRenderable) {
        this.graphic = graphic
        this.x = x
        this.y = y
    }

    /**
     * Update Method
     * @param dt Delta Time
     */
    update(dt: number) {
        this.graphic.update(dt)
    }

    /** Drawing Method */
    draw() {
        love.graphics.push("transform")
        love.graphics.translate(this.x, this.y)
        this.graphic.draw()
        love.graphics.pop()
    }
}

/** Sprite Class */
export class Sprite extends SpriteBase {}
