import {DisplayFlags} from "love.graphics"

/** Display Manager Class */
export class DisplayManager {
    /** Enabled Tag */
    protected enabled = false

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
     * Set screen, display and enable manager
     * @param width Canvas and Window Width
     * @param height Canvas and Window Height
     * @param flags Diaplay Flags
     */
    setScreen(width: number, height: number, flags?: DisplayFlags): void
    /**
     * Set screen, display and enable manager
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
        this.enabled = true

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
        if (!this.enabled) return
        this.handleResize(width, height)
    }

    /**
     * Handle display resize
     * @param width Window Width 
     * @param height Window Height
     */
    handleResize(width: number, height: number) {
        if (!this.enabled) return
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

    /** Attach to managed display */
    attach() {
        if (!this.enabled) return
        love.graphics.push("all")
        love.graphics.translate(this.offset_x, this.offset_y)
        love.graphics.scale(this.scale)
    }

    /** Detach from managed display */
    detach() {
        if (!this.enabled) return
        love.graphics.pop()
    }

    /** Get width of current display */
    getWidth() {
        if (!this.enabled) {
            return love.graphics.getWidth()
        }
        return this.display_width
    }

    /** Get height of current display */
    getHeight() {
        if (!this.enabled) {
            return love.graphics.getHeight()
        }
        return this.display_height
    }

    /** Get width and height of current display */
    getDimensions(): LuaMultiReturn<[width: number, height: number]> {
        if (!this.enabled) {
            return love.graphics.getDimensions()
        }
        return $multi(this.display_width, this.display_height)
    }

    /**
     * Convert the position from screen coordinates to native coordinates
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    fromScreenCoordinates(x: number, y: number): LuaMultiReturn<[x: number, y: number]> {
        if (!this.enabled) {
            return $multi(x, y)
        }
        let scale = this.scale
        return $multi(x * scale + this.offset_x, y * scale + this.offset_y)
    }

    /**
     * Convert the position from native coordinates to screen coordinates
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    toScreenCoordinates(x: number, y: number): LuaMultiReturn<[x: number, y: number]> {
        if (!this.enabled) {
            return $multi(x, y)
        }
        let scale = this.scale
        return $multi((x - this.offset_x) / scale, (y - this.offset_y) / scale)
    }
}
