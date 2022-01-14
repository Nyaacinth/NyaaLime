import {DrawMode} from "love.graphics"
import {IUiElement} from "../UiElement"

export class Polygon implements IUiElement {
    /** Position X-axis */
    x: number

    /** Position Y-axis */
    y: number

    /** Drawing Width */
    get width() {
        let max_x = 0
        for (let index of this.points) {
            let coordinate = this.points[index]
            if (index % 2 > 0) {
                max_x = Math.max(max_x, coordinate)
            }
        }
        return max_x
    }

    /** Drawing Height */
    get height() {
        let max_y = 0
        for (let index of this.points) {
            let coordinate = this.points[index]
            if (index % 2 == 0) {
                max_y = Math.max(max_y, coordinate)
            }
        }
        return max_y
    }

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
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    constructor(mode: DrawMode, points: number[], x: number = 0, y: number = 0) {
        this.x = x
        this.y = y
        this.mode = mode
        this.points = points
    }

    /** Update Method, no functional */
    update() {}

    /** Draw Method, draw a polygon */
    draw() {
        love.graphics.push("all")
        love.graphics.translate(this.x, this.y)
        if (this.mode == "fill") {
            love.graphics.setColor(this.color)
            let triangles = love.math.triangulate(this.points)
            for (let triangle of triangles) {
                love.graphics.polygon("fill", triangle)
            }
        }
        love.graphics.setLineWidth(this.border_thickness)
        love.graphics.setColor(this.border_color)
        love.graphics.polygon("line", this.points)
        love.graphics.pop()
    }
}
