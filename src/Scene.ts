/** Interface of a Scene */
export interface IScene {
    /** Tag it as initialized or not, if not `init()` will be called once */
    initialized?: boolean

    /** Init Callback, will be called once before first entering */
    init?(): void

    /**
     * Entering Callback, will be called at every entering
     * @param prev Previous Scene, might be undefined when there's no previous scene
     * @param varargs Optional arguments passed to this scene
     */
    enter?(prev?: IScene, ...varargs: unknown[]): void

    /** Pause Callback, will be called when a scene is pushed over it */
    pause?(): void

    /**
     * Resume Callback, will be called when a scene on the top of it is popped out
     * @param prev Previous Scene, might be undefined when there's no previous scene
     * @param varargs Optional arguments passed to this scene
     */
    resume?(prev?: IScene, ...varargs: unknown[]): void

    /** Leaving Callback, will be called at every leaving (popped or switched) */
    leave?(): void

    /**
     * Update Callback, will be called frequently before `draw()` is called
     * @param dt Delta Time, representing the amount of time which has passed since it was last called in second
     */
    update(dt: number): void

    /** Drawing Callback, will be called every frames */
    draw(): void
}

/** Scene Base Class */
export abstract class SceneBase implements IScene {
    /** Scene Children */
    protected children: IScene[] = []

    /**
     * Add child to the scene
     * @param child Child to add
     */
    addChild(child: IScene) {
        if (this.children.includes(child)) return
        this.children.push(child)
    }

    /**
     * Remove child from the scene
     * @param child Child to remove
     */
    removeChild(child: IScene) {
        let child_index = this.children.indexOf(child)
        if (child_index > -1) {
            this.children.splice(child_index, 1)
        }
    }

    update(dt: number) {
        this.children.forEach((child) => child.update(dt))
    }

    draw() {
        this.children.forEach((child) => child.draw())
    }
}
