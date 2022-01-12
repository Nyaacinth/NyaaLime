/// <reference types="typescript-to-lua/language-extensions" />
/** Camera Smoother */
declare type CameraSmoother = (x: number, y: number, dx: number, dy: number, ...vargs: unknown[]) => LuaMultiReturn<[dx: number, dy: number]>;
/** Camera Class */
export declare class Camera {
    /** Camera Focus X-axis */
    protected x: number;
    /** Camera Focus Y-axis */
    protected y: number;
    /** Camera Width */
    protected width: number;
    /** Camera Height */
    protected height: number;
    /** Camera Scaling, 1 = 100% */
    protected scale: number;
    /** Default Smoothers */
    readonly default_smoothers: {
        /** None, directly return [dx, dy] */
        none(_x: number, _y: number, dx: number, dy: number): LuaMultiReturn<[dx: number, dy: number]>;
        /**
         * Common Smoother, speed proportional to the distance to the target
         * @param vargs `[0]`: speed factor (1 = 100% -> Instantly), defaults to 0.1
         */
        common(x: number, y: number, dx: number, dy: number, ...vargs: unknown[]): LuaMultiReturn<[
            fixed_x: number,
            fixed_y: number
        ]>;
    };
    /**
     * Camera Constructor
     * @param x Camera Focus X-axis, defaults to 0
     * @param y Camera Focus Y-axis, defaults to 0
     * @param scale Camera Scaling, defaults to 1 = 100%
     */
    constructor(x: number | undefined, y: number | undefined, width: number, height: number, scale?: number);
    /**
     * Move the camera by some vector
     * @param dx Direction to move the camera (X-axis)
     * @param dy Direction to move the camera (Y-axis)
     */
    move(dx: number, dy: number): void;
    /**
     * Multiply zoom factor
     * @param mul Zoom changes, 1 = 100%
     */
    zoom(mul: number): void;
    /**
     * Get camera focused position
     * @returns
     * ```text
     * position_x: Position X-axis
     * position_y: Position Y-axis
     * ```
     */
    getPosition(): LuaMultiReturn<[position_x: number, position_y: number]>;
    /**
     * Set the camera position
     * @param x Position to focus (X-axis)
     * @param y Position to focus (Y-axis)
     */
    setPosition(x: number, y: number): void;
    /** Get zoom factor */
    getScale(): number;
    /**
     * Set zoom factor
     * @param scale New zoom factor
     */
    setScale(scale: number): void;
    /**
     * Transform point from camera coordinates to world coordinates
     * @param x Point to transform (X-axis)
     * @param y Point to transform (Y-axis)
     * @returns
     * ```text
     * x: Transformed point (X-axis)
     * y: Transformed point (Y-axis)
     * ```
     */
    getWorldCoords(x: number, y: number): LuaMultiReturn<[x: number, y: number]>;
    /**
     * Transform point from world coordinates to camera coordinates
     * @param x Point to transform (X-axis)
     * @param y Point to transform (Y-axis)
     * @returns
     * ```text
     * x: Transformed point (X-axis)
     * y: Transformed point (Y-axis)
     * ```
     */
    getCameraCoords(x: number, y: number): LuaMultiReturn<[x: number, y: number]>;
    /**
     * Look at a position with smoother view
     * @param x Position X-axis
     * @param y Position Y-axis
     * @param smoother Movement smoothing function
     * @param vargs Additional parameters to the smoothing function
     */
    lookAt(x?: number, y?: number, smoother?: CameraSmoother | keyof Camera["default_smoothers"], ...vargs: unknown[]): void;
    /**
     * Look at a position in segment with smoother view
     * @param x Position X-axis
     * @param y Position Y-axis
     * @param min_x Minimum Position X-axis
     * @param max_x Maximum Position X-axis
     * @param min_y Minimum Position Y-axis
     * @param max_y Maximum Position Y-axis
     * @param smoother Movement smoothing function
     * @param vargs Additional parameters to the smoothing function
     */
    lookAtSegment(x: number, y: number, min_x: number, max_x: number, min_y: number, max_y: number, smoother?: CameraSmoother | keyof Camera["default_smoothers"], ...vargs: unknown[]): void;
    /** Apply camera transformations until `detach()` */
    attach(): void;
    /** Unset camera transformations */
    detach(): void;
}
export {};
