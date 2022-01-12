import {DrawMode} from "love.graphics"
import {IRenderable} from "../Renderable"

export class Polygon implements IRenderable {
    /** Drawing Mode */
    mode: DrawMode

    /** Points Details, `[x1, y1, x2, y2, ...]` */
    points: number[]

    /** Polygon Color */
    color: [r: number, g: number, b: number, a?: number] = [1, 1, 1]

    /** Border Thickness */
    border_thickness = 0

    /** Border Color */
    border_color: [r: number, g: number, b: number, a?: number] = [1, 1, 1]

    /**
     * Polygon Constructor
     * @param mode Drawing Mode
     * @param points Points Details, `[x1, y1, x2, y2, ...]`
     */
    constructor(mode: DrawMode, points: number[]) {
        this.mode = mode
        this.points = points
    }

    /** Update Method, no functional */
    update() {}

    /** Draw Method, draw a polygon */
    draw() {
        love.graphics.push("all")
        love.graphics.setLineWidth(this.border_thickness)
        love.graphics.setColor(this.border_color)
        love.graphics.polygon("line", this.points)
        if (this.mode == "fill") {
            love.graphics.setColor(this.color)
            let triangles = love.math.triangulate(this.points)
            for (let triangle of triangles) {
                love.graphics.polygon("fill", triangle)
            }
        }
        love.graphics.pop()
    }
}
