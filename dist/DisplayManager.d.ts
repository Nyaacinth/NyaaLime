/// <reference types="typescript-to-lua/language-extensions" />
import { DisplayFlags } from "love.graphics";
/** Display Manager Class */
export declare class DisplayManager {
    /** Enabled Tag */
    protected enabled: boolean;
    /** Display Width */
    protected display_width: number;
    /** Display Height */
    protected display_height: number;
    /** Display Scale */
    protected scale: number;
    /** Display Offset X-axis */
    protected offset_x: number;
    /** Display Offset Y-axis */
    protected offset_y: number;
    /**
     * Set screen, display and enable manager
     * @param width Canvas and Window Width
     * @param height Canvas and Window Height
     * @param flags Diaplay Flags
     */
    setScreen(width: number, height: number, flags?: DisplayFlags): void;
    /**
     * Set screen, display and enable manager
     * @param width Canvas Width
     * @param height Canvas Height
     * @param window_width Window Width
     * @param window_height Window Height
     * @param flags Diaplay Flags
     */
    setScreen(width: number, height: number, window_width?: number, window_height?: number, flags?: DisplayFlags): void;
    /**
     * Set window mode
     * @param width Window Width
     * @param height Window Height
     * @param flags Diaplay Flags
     */
    setWindow(width: number, height: number, flags?: DisplayFlags): void;
    /**
     * Handle display resize
     * @param width Window Width
     * @param height Window Height
     */
    handleResize(width: number, height: number): void;
    /** Attach to managed display */
    attach(): void;
    /** Detach from managed display */
    detach(): void;
    /** Get width of current display */
    getWidth(): number;
    /** Get height of current display */
    getHeight(): number;
    /** Get width and height of current display */
    getDimensions(): LuaMultiReturn<[width: number, height: number]>;
    /**
     * Convert the position from screen coordinates to native coordinates
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    fromScreenCoordinates(x: number, y: number): LuaMultiReturn<[x: number, y: number]>;
    /**
     * Convert the position from native coordinates to screen coordinates
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    toScreenCoordinates(x: number, y: number): LuaMultiReturn<[x: number, y: number]>;
}
