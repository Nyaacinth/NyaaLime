import {Layer} from "./Layer"
import {IRenderable} from "./Renderable"

/** Interface of a Sprite */
export interface ISprite extends IRenderable {
    /** Drawable Object */
    graphic?: IRenderable

    /** Position X-axis */
    x: number

    /** Position Y-axis */
    y: number

    /** Scale Factor */
    scale: number

    /** Rotation is Radians */
    rotation: number
}

/** Sprite Base Class */
export abstract class SpriteBase implements ISprite {
    /** Drawable Object */
    graphic?: IRenderable

    /** Position X-axis */
    x: number

    /** Position Y-axis */
    y: number

    /** Scale Factor */
    scale: number

    /** Rotation, in radians */
    rotation: number

    /**
     * Sprite Base Constructor
     * @param x Position X-axis
     * @param y Position Y-axis
     * @param scale Scale Factor
     * @param rotation Rotation, in radians
     * @param graphic Renderable Graphic
     */
    constructor(x: number = 0, y: number = 0, scale: number = 1, rotation: number = 0, graphic?: IRenderable) {
        this.graphic = graphic
        this.x = x
        this.y = y
        this.scale = scale
        this.rotation = rotation
    }

    /**
     * Use Graphic for Sprite
     * @param graphic Renderable Graphic
     */
    useGraphic(graphic: IRenderable) {
        this.graphic = graphic
    }

    /**
     * Update Method
     * @param dt Delta Time
     */
    update(dt: number) {
        this.graphic?.update(dt)
    }

    /** Drawing Method */
    draw() {
        love.graphics.push("transform")
        love.graphics.translate(this.x, this.y)
        love.graphics.scale(this.scale)
        love.graphics.rotate(this.rotation)
        this.graphic?.draw()
        love.graphics.pop()
    }
}

/** Sprite Class */
export class Sprite extends SpriteBase {
    /** Graphic Layer */
    override graphic = new Layer()

    /**
     * Sprite Constructor
     * @param x Position X-axis
     * @param y Position Y-axis
     * @param scale Scale Factor
     * @param rotation Rotation, in radians
     */
    constructor(x?: number, y?: number, scale?: number, rotation?: number) {
        super(x, y, scale, rotation)
    }

    /**
     * Use Specific Layer for Sprite
     * @param graphic Renderable Graphic
     */
    override useGraphic(graphic: Layer) {
        super.useGraphic(graphic)
    }
}
