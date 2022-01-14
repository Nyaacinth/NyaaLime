import {IRenderable} from "./Renderable"

export interface IUiElement extends IRenderable {
    /** Position X-axis */
    x: number

    /** Position Y-axis */
    y: number

    /** Width */
    width: number

    /** Height */
    height: number
}
