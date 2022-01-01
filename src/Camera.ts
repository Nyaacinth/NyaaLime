/** Camera Smoother */
type CameraSmoother = (x: number, y: number, dx: number, dy: number, ...vargs: unknown[]) => LuaMultiReturn<[dx: number, dy: number]>

/** Camera Class */
export class Camera {
    /** Camera Focus X-axis */
    protected x: number

    /** Camera Focus Y-axis */
    protected y: number

    /** Camera Width */
    protected width: number

    /** Camera Height */
    protected height: number

    /** Camera Scaling, 1 = 100% */
    protected scale: number

    /** Default Smoothers */
    readonly default_smoothers = {
        /** None, directly return [dx, dy] */
        none(_x: number, _y: number, dx: number, dy: number): LuaMultiReturn<[dx: number, dy: number]> {
            return $multi(dx, dy)
        },

        /**
         * Common Smoother, speed proportional to the distance to the target
         * @param vargs `[0]`: speed factor (1 = 100% -> Instantly), defaults to 0.1
         */
        common(x: number, y: number, dx: number, dy: number, ...vargs: unknown[]): LuaMultiReturn<[fixed_x: number, fixed_y: number]> {
            if (x == dx && y == dy) return $multi(dx, dy)
            let speed = typeof vargs[0] == "number" ? vargs[0] : 0.001
            speed = Math.min(1, speed)
            return $multi(
                x != dx ? (dx - x) * speed + x : x,
                y != dy ? (dy - y) * speed + y : y
            )
        }
    }

    /**
     * Camera Constructor
     * @param x Camera Focus X-axis, defaults to 0
     * @param y Camera Focus Y-axis, defaults to 0
     * @param scale Camera Scaling, defaults to 1 = 100%
     */
    constructor(x: number = 0, y: number = 0, width: number, height: number, scale: number = 1) {
        this.x = x
        this.y = y
        this.width = width
        this.height = height
        this.scale = scale
    }

    /**
     * Move the camera by some vector
     * @param dx Direction to move the camera (X-axis)
     * @param dy Direction to move the camera (Y-axis)
     */
    move(dx: number, dy: number) {
        this.x += dx
        this.y += dy
    }

    /**
     * Multiply zoom factor
     * @param mul Zoom changes, 1 = 100%
     */
    zoom(mul: number) {
        this.scale *= mul
    }

    /**
     * Get camera focused position
     * @returns
     * ```text
     * position_x: Position X-axis
     * position_y: Position Y-axis
     * ```
     */
    getPosition(): LuaMultiReturn<[position_x: number, position_y: number]> {
        return $multi(this.x, this.y)
    }

    /**
     * Set the camera position
     * @param x Position to focus (X-axis)
     * @param y Position to focus (Y-axis)
     */
    setPosition(x: number, y: number) {
        this.x = x
        this.y = y
    }

    /** Get zoom factor */
    getScale() {
        return this.scale
    }

    /**
     * Set zoom factor
     * @param scale New zoom factor
     */
    setScale(scale: number) {
        this.scale = scale
    }

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
    getWorldCoords(x: number, y: number): LuaMultiReturn<[x: number, y: number]> {
        let scale = this.scale
        return $multi(x / scale - this.x - this.width / 2, y / scale - this.y - this.height / 2)
    }

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
    getCameraCoords(x: number, y: number): LuaMultiReturn<[x: number, y: number]> {
        let scale = this.scale
        return $multi((x + this.x + this.width / 2) * scale, (y + this.y + this.height / 2) * scale)
    }

    /**
     * Look at a position with smoother view
     * @param x Position X-axis
     * @param y Position Y-axis
     * @param smoother Movement smoothing function
     * @param vargs Additional parameters to the smoothing function
     */
    lookAt(x: number = this.x, y: number = this.y, smoother: CameraSmoother | keyof Camera["default_smoothers"] = this.default_smoothers.none, ...vargs: unknown[]) {
        if (typeof smoother == "string") {
            smoother = this.default_smoothers[smoother]
        }
        ;[this.x, this.y] = smoother(this.x, this.y, x, y, ...vargs)
    }

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
    lookAtSegment(
        x: number,
        y: number,
        min_x: number,
        max_x: number,
        min_y: number,
        max_y: number,
        smoother: CameraSmoother | keyof Camera["default_smoothers"] = this.default_smoothers.none,
        ...vargs: unknown[]
    ) {
        let scale = this.scale
        this.lookAt(
            Math.max((min_x + this.width / 2) / scale, Math.min(x, (max_x - this.width / 2) / scale)),
            Math.max((min_y + this.height / 2) / scale, Math.min(y, (max_y - this.height / 2) / scale)),
            smoother,
            ...vargs
        )
    }

    /** Apply camera transformations until `detach()` */
    attach() {
        love.graphics.push("transform")
        love.graphics.translate(this.width / 2, this.height / 2)
        love.graphics.scale(this.scale)
        love.graphics.translate(-this.x, -this.y)
    }

    /** Unset camera transformations */
    detach() {
        love.graphics.pop()
    }
}
