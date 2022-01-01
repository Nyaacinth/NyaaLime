import { DisplayFlags } from "love.graphics";
import { ContentManager } from "./ContentManager";
import { DisplayManager } from "./DisplayManager";
import { SceneManager } from "./SceneManager";
import { Signal } from "./Signal";
import { Timer } from "./Timer";
export declare class Stage {
    /** Stage Scene Manager */
    scene_manager: SceneManager;
    /** Stage Timer */
    timer: Timer;
    /** Stage Signal */
    signal: Signal;
    /** Stage Display Manager */
    display_manager: DisplayManager;
    /** Stage Content Manager */
    content_manager: ContentManager;
    /**
     * Stage Constructor
     * @param screen_width Screen Width
     * @param screen_height Screen Height
     * @param screen_flags Screen Display Flags
     */
    constructor(screen_width: number, screen_height: number, screen_flags?: DisplayFlags);
    /**
     * Update Method, update current scene and stage timer
     * @param dt Delta Time
     */
    update(dt: number): void;
    /** Draw Method, draw current scene with fixed display */
    draw(): void;
}
