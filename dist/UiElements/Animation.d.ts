import { Image, Quad } from "love.graphics";
import { IUiElement } from "../UiElement";
/** Animation Class */
export declare class Animation implements IUiElement {
    /** Position X-axis */
    x: number;
    /** Position Y-axis */
    y: number;
    /** Width */
    readonly width: number;
    /** Height */
    readonly height: number;
    /** Image Object */
    readonly image_object: Image;
    /** Animation Frames */
    readonly frames: Quad[];
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
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    constructor(image: Image, frame_width: number, frame_height: number, duration: number, x?: number, y?: number);
    /**
     * Update Method, update the animtion
     * @param dt Delta Time
     */
    update(dt: number): void;
    /** Draw Method, draw the animation */
    draw(): void;
}
