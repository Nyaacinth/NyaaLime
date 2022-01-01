import { IScene } from "./Scene";
/** Scene Manager */
export declare class SceneManager {
    /** States Stack */
    protected states: IScene[];
    /** Get current scene, might be undefined if there's nothing on stack */
    getCurrent(): IScene | undefined;
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
