import { IRenderable } from "./Renderable";
import { Signal } from "./Signal";
/** Interface of a Scene */
export interface IScene extends IRenderable {
    /** Tag it as initialized or not, if not `init()` will be called once */
    initialized?: boolean;
    /** Signal Object, for event emit */
    signal: Signal;
    /** Init Method, will be called once before first entering */
    init?(): void;
    /**
     * Entering Method, will be called at every entering
     * @param prev Previous Scene, might be undefined when there's no previous scene
     * @param varargs Optional arguments passed to this scene
     */
    enter?(prev?: IScene, ...varargs: unknown[]): void;
    /** Pause Method, will be called when a scene is pushed over it */
    pause?(): void;
    /**
     * Resume Method, will be called when a scene on the top of it is popped out
     * @param prev Previous Scene, might be undefined when there's no previous scene
     * @param varargs Optional arguments passed to this scene
     */
    resume?(prev?: IScene, ...varargs: unknown[]): void;
    /** Leaving Method, will be called at every leaving (popped or switched) */
    leave?(): void;
}
/** Scene Base Class */
export declare abstract class SceneBase implements IScene {
    /** Scene Children */
    protected children: IRenderable[];
    /** Scene Signal Object */
    signal: Signal;
    /**
     * Add child to the scene
     * @param child Child to add
     */
    addChild(child: IRenderable): void;
    /**
     * Remove child from the scene
     * @param child Child to remove
     */
    removeChild(child: IRenderable): void;
    update(dt: number): void;
    draw(): void;
}
