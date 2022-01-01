import {DrawMode} from "love.graphics"
import {IRenderable} from "../Renderable"

export class Polygon implements IRenderable {
    /** Drawing Mode */
    mode: DrawMode

    /** Points Details, `[x1, y1, x2, y2, ...]` */
    points: number[]

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
        if (this.mode == "line") {
            love.graphics.polygon("line", this.points)
        } else {
            let triangles = love.math.triangulate(this.points)
            for (let triangle of triangles) {
                love.graphics.polygon("fill", triangle)
            }
        }
    }
}
