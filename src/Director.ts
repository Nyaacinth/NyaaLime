import {DisplayFlags} from "love.graphics"
import {IScene} from "./Scene"

/** Director Class */
export class Director {
    /** Scenes Stack */
    protected scenes: IScene[] = []

    /** Display Width */
    protected display_width = -1

    /** Display Height */
    protected display_height = -1

    /** Display Scale */
    protected scale = -1

    /** Display Offset X-axis */
    protected offset_x = -1

    /** Display Offset Y-axis */
    protected offset_y = -1

    /**
     * Director Constructor
     * @param width Screen Width
     * @param height Screen Height
     * @param flags Screen Flags
     */
    constructor(width: number, height: number, flags: DisplayFlags) {
        this.setScreen(width, height, flags)
        let prev_update = love.update ?? function() {}
        love.update = (dt: number) => {
            prev_update(dt)
            this.update(dt)
        }
        let prev_draw = love.draw ?? function() {}
        love.draw = () => {
            prev_draw()
            this.draw()
        }
        let prev_resize = love.resize ?? function() {}
        love.resize = (w: number, h: number) => {
            prev_resize(w, h)
            this.handleResize(w, h)
        }
        for (let handler_name in love.handlers) {
            let prev_handler = (love as any)[handler_name] as (this: void, ...varargs: any[]) => any | undefined ?? function() {}
            let up_this = this
            ;(love as any)[handler_name] = function(this: void, ...varargs: any[]) {
                prev_handler(...varargs)
                up_this.getCurrentScene()?.signal.emit(handler_name, ...varargs)
            }
        }
    }

    /**
     * Set screen and display
     * @param width Canvas and Window Width
     * @param height Canvas and Window Height
     * @param flags Diaplay Flags
     */
    setScreen(width: number, height: number, flags?: DisplayFlags): void
    /**
     * Set screen and display
     * @param width Canvas Width
     * @param height Canvas Height
     * @param window_width Window Width
     * @param window_height Window Height
     * @param flags Diaplay Flags
     */
    setScreen(width: number, height: number, window_width?: number, window_height?: number, flags?: DisplayFlags): void
    //-----------------------------------------------------------------------------------------------------------------------------------//
    setScreen(width: number, height: number, window_width_or_flags?: number | DisplayFlags, window_height: number = height, flags?: DisplayFlags) {
        let window_width: number
        if (typeof window_width_or_flags === "number") {
            window_width = window_width_or_flags
        } else {
            flags ??= window_width_or_flags
            window_width = width
        }
        flags ??= {}

        this.display_width = width
        this.display_height = height

        this.setWindow(window_width, window_height, flags)
    }

    /**
     * Set window mode
     * @param width Window Width
     * @param height Window Height
     * @param flags Diaplay Flags
     */
    setWindow(width: number, height: number, flags: DisplayFlags = {}) {
        love.window.setMode(width, height, flags)
        this.handleResize(width, height)
    }

    /**
     * Handle display resize
     * @param width Window Width 
     * @param height Window Height
     */
    handleResize(width: number, height: number) {
        this.scale = width / this.display_width
        let window_aspectratio = width / height
        let display_aspectratio = this.display_width / this.display_height

        if (display_aspectratio > window_aspectratio) {
            // Y-axis
            this.offset_x = 0
            this.offset_y = height / 2 - (this.scale * this.display_height) / 2
        } else if (display_aspectratio < window_aspectratio) {
            // X-axis
            this.scale = height / this.display_height
            this.offset_x = width / 2 - (this.scale * this.display_width) / 2
            this.offset_y = 0
        } else {
            // Equal
            this.offset_x = 0
            this.offset_y = 0
        }
    }

    /** Get width of current display */
    getScreenWidth() {
        return this.display_width
    }

    /** Get height of current display */
    getScreenHeight() {
        return this.display_height
    }

    /** Get width and height of current display */
    getScreenDimensions(): LuaMultiReturn<[width: number, height: number]> {
        return $multi(this.display_width, this.display_height)
    }

    /**
     * Convert the position from screen coordinates to native coordinates
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    fromScreenCoordinates(x: number, y: number): LuaMultiReturn<[x: number, y: number]> {
        let scale = this.scale
        return $multi(x * scale + this.offset_x, y * scale + this.offset_y)
    }

    /**
     * Convert the position from native coordinates to screen coordinates
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    toScreenCoordinates(x: number, y: number): LuaMultiReturn<[x: number, y: number]> {
        let scale = this.scale
        return $multi((x - this.offset_x) / scale, (y - this.offset_y) / scale)
    }

    /** Get current scene, might be undefined if there's nothing on stack */
    getCurrentScene(): IScene | undefined {
        return this.scenes[this.scenes.length - 1]
    }

    /**
     * Switch to a scene and call `<from>.leave()`, `<to>.enter()`
     * @param to Target scene
     * @param varargs Arguments pass to to.enter()
     */
    switch(to: IScene, ...varargs: unknown[]) {
        let from = this.getCurrentScene()
        if (!to.initialized) {
            to.init?.()
            to.initialized = true
        }
        if (from) {
            from.leave?.()
        }
        to.enter?.(from, ...varargs)
        this.scenes.pop()
        this.scenes.push(to)
    }

    /**
     * Push scene to the top of states stack and call `<from>.pause()`, `<to>.enter()`
     * @param to Target scene
     * @param varargs Arguments pass to to.enter()
     */
    push(to: IScene, ...varargs: unknown[]) {
        let from = this.getCurrentScene()
        if (from) {
            from.pause?.()
        }
        to.enter?.(this.getCurrentScene(), ...varargs)
        this.scenes.push(to)
    }

    /**
     * Remove current scene from the states stack and call `<from>.leave()`, `<to>.resume()`
     * @param varargs Arguments pass to to.resume()
     */
    pop(...varargs: unknown[]) {
        let from = this.getCurrentScene()
        if (from) {
            from.leave?.()
        }
        this.scenes.pop()
        let to = this.getCurrentScene()
        if (to) {
            to.resume?.(from, ...varargs)
        }
    }

    /**
     * Update Method
     * @param dt Delta Time
     */
    update(dt: number) {
        this.getCurrentScene()?.update(dt)
    }

    /** Draw Method */
    draw() {
        love.graphics.push("all")
        love.graphics.translate(this.offset_x, this.offset_y)
        love.graphics.scale(this.scale)
        this.getCurrentScene()?.draw()
        love.graphics.pop()
    }
}
