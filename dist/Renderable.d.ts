/** Interface of a Drawable Object */
export interface IRenderable {
    /**
     * Update Method, will be called frequently before `draw()` is called
     * @param dt Delta Time
     */
    update(dt: number): void;
    /**
     * Drawing Method, will be called every frames
     * @description Calling this method should draw object at (0, 0), coordinates translation needs to be handled by the caller
     */
    draw(): void;
}
