import {DisplayFlags} from "love.graphics"
import {ContentManager} from "./ContentManager"
import {DisplayManager} from "./DisplayManager"
import {SceneManager} from "./SceneManager"
import {Signal} from "./Signal"
import {Timer} from "./Timer"

export class Stage {
    /** Stage Scene Manager */
    scene_manager = new SceneManager()

    /** Stage Timer */
    timer = new Timer()

    /** Stage Signal */
    signal = new Signal()

    /** Stage Display Manager */
    display_manager = new DisplayManager()

    /** Stage Content Manager */
    content_manager = new ContentManager()

    /**
     * Stage Constructor
     * @param screen_width Screen Width
     * @param screen_height Screen Height
     * @param screen_flags Screen Display Flags
     */
    constructor(screen_width: number, screen_height: number, screen_flags?: DisplayFlags) {
        this.display_manager.setScreen(screen_width, screen_height, screen_flags)
    }

    /**
     * Update Method, update current scene and stage timer
     * @param dt Delta Time
     */
    update(dt: number) {
        this.scene_manager.update(dt)
        this.timer.update(dt)
    }

    /** Draw Method, draw current scene with fixed display */
    draw() {
        this.display_manager.attach()
        this.scene_manager.draw()
        this.display_manager.detach()
    }
}
