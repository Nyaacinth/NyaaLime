/// <reference types="typescript-to-lua/language-extensions" />
import { DisplayFlags } from "love.graphics";
import { IScene } from "./Scene";
/** Director Class */
export declare class Director {
    /** Scenes Stack */
    protected scenes: IScene[];
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
     * Director Constructor
     * @param width Screen Width
     * @param height Screen Height
     * @param flags Screen Flags
     */
    constructor(width: number, height: number, flags: DisplayFlags);
    /**
     * Set screen and display
     * @param width Canvas and Window Width
     * @param height Canvas and Window Height
     * @param flags Diaplay Flags
     */
    setScreen(width: number, height: number, flags?: DisplayFlags): void;
    /**
     * Set screen and display
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
    /** Get width of current display */
    getScreenWidth(): number;
    /** Get height of current display */
    getScreenHeight(): number;
    /** Get width and height of current display */
    getScreenDimensions(): LuaMultiReturn<[width: number, height: number]>;
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
    /** Get current scene, might be undefined if there's nothing on stack */
    getCurrentScene(): IScene | undefined;
    /**
     * Switch to a scene and call `<from>.leave()`, `<to>.enter()`
     * @param to Target scene
     * @param varargs Arguments pass to to.enter()
     */
    switch(to: IScene, ...varargs: unknown[]): void;
    /**
     * Push scene to the top of states stack and call `<from>.pause()`, `<to>.enter()`
     * @param to Target scene
     * @param varargs Arguments pass to to.enter()
     */
    push(to: IScene, ...varargs: unknown[]): void;
    /**
     * Remove current scene from the states stack and call `<from>.leave()`, `<to>.resume()`
     * @param varargs Arguments pass to to.resume()
     */
    pop(...varargs: unknown[]): void;
    /**
     * Update Method
     * @param dt Delta Time
     */
    update(dt: number): void;
    /** Draw Method */
    draw(): void;
}
