import { IRenderable } from "./Renderable";
export declare class Layer implements IRenderable {
    /** Scene Children */
    protected children: IRenderable[];
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
    /**
     * Update Method, update children
     * @param dt Delta Time
     */
    update(dt: number): void;
    /** Draw Method, draw children */
    draw(): void;
}
