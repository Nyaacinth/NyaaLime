import { Image, Quad } from "love.graphics";
import { IRenderable } from "../Renderable";
/** Animation Class */
export declare class Animation implements IRenderable {
    /** Image Object */
    image_object: Image;
    /** Animation Frames */
    frames: Quad[];
    /** Frame Index */
    frame_index: number;
    /** Animation Total Duration */
    total_duration: number;
    /** Animation Duration Counter */
    duration: number;
    /**
     * Animation Constructor
     * @param image Image Object
     * @param frame_width Frame Width
     * @param frame_height Frame Height
     * @param duration Animation Duration
     */
    constructor(image: Image, frame_width: number, frame_height: number, duration: number);
    /**
     * Update Method, update the animtion
     * @param dt Delta Time
     */
    update(dt: number): void;
    /** Draw Method, draw the animation */
    draw(): void;
}
