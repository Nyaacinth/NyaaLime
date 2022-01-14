import {Image, Quad} from "love.graphics"
import {IUiElement} from "../UiElement"

/** Animation Class */
export class Animation implements IUiElement {
    /** Position X-axis */
    x: number

    /** Position Y-axis */
    y: number

    /** Width */
    readonly width: number

    /** Height */
    readonly height: number

    /** Image Object */
    readonly image_object: Image

    /** Animation Frames */
    readonly frames: Quad[] = []

    /** Frame Index */
    frame_index = 0

    /** Animation Total Duration */
    total_duration: number

    /** Animation Duration Counter */
    duration = 0

    /**
     * Animation Constructor
     * @param image Image Object
     * @param frame_width Frame Width
     * @param frame_height Frame Height
     * @param duration Animation Duration
     */
    constructor(image: Image, frame_width: number, frame_height: number, duration: number, x: number = 0, y: number = 0) {
        this.x = x
        this.y = y
        this.image_object = image
        this.total_duration = duration
        this.width = frame_width
        this.height = frame_height
        let image_width = image.getWidth(),
            image_height = image.getHeight()
        let width_frames = Math.floor(image_width / frame_width),
            height_frames = Math.floor(image_height / frame_height)
        for (let width_index = 0; width_index < width_frames; width_index++) {
            for (let height_index = 0; height_index < height_frames; height_index++) {
                this.frames.push(love.graphics.newQuad(width_index * frame_width, height_index * frame_height, frame_width, frame_height, image_width, image_height))
            }
        }
    }

    /**
     * Update Method, update the animtion
     * @param dt Delta Time
     */
    update(dt: number) {
        this.duration += dt
        if (this.duration > this.total_duration / this.frames.length) {
            this.duration = 0
            this.frame_index += 1
            if (this.frame_index > this.frames.length - 1) {
                this.frame_index = 0
            }
        }
    }

    /** Draw Method, draw the animation */
    draw() {
        love.graphics.draw(this.image_object, this.frames[this.frame_index], this.x, this.y)
    }
}
