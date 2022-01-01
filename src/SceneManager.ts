import {IScene} from "./Scene"

/** Scene Manager */
export class SceneManager {
    /** States Stack */
    protected states: IScene[] = []

    /** Get current scene, might be undefined if there's nothing on stack */
    getCurrent(): IScene | undefined {
        return this.states[this.states.length - 1]
    }

    /**
     * Switch to a scene and call `<from>.leave()`, `<to>.enter()`
     * @param to Target scene
     * @param varargs Arguments pass to to.enter()
     */
    switch(to: IScene, ...varargs: unknown[]) {
        let from = this.getCurrent()
        if (!to.initialized) {
            to.init?.()
            to.initialized = true
        }
        if (from) {
            from.leave?.()
        }
        to.enter?.(from, ...varargs)
        this.states.pop()
        this.states.push(to)
    }

    /**
     * Push scene to the top of states stack and call `<from>.pause()`, `<to>.enter()`
     * @param to Target scene
     * @param varargs Arguments pass to to.enter()
     */
    push(to: IScene, ...varargs: unknown[]) {
        let from = this.getCurrent()
        if (from) {
            from.pause?.()
        }
        to.enter?.(this.getCurrent(), ...varargs)
        this.states.push(to)
    }

    /**
     * Remove current scene from the states stack and call `<from>.leave()`, `<to>.resume()`
     * @param varargs Arguments pass to to.resume()
     */
    pop(...varargs: unknown[]) {
        let from = this.getCurrent()
        if (from) {
            from.leave?.()
        }
        this.states.pop()
        let to = this.getCurrent()
        if (to) {
            to.resume?.(from, ...varargs)
        }
    }

    /**
     * Update Method
     * @param dt Delta Time
     */
    update(dt: number) {
        this.getCurrent()?.update(dt)
    }

    /** Draw Method */
    draw() {
        this.getCurrent()?.draw()
    }
}
