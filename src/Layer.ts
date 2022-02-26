import {IRenderable} from "./Renderable"

export class Layer implements IRenderable {
    /** Layer Children */
    protected children: IRenderable[] = []

    /**
     * Add child to the layer
     * @param child Child to add
     */
    addChild(child: IRenderable) {
        if (this.children.includes(child)) return
        this.children.push(child)
    }

    /**
     * Remove child from the layer
     * @param child Child to remove
     */
    removeChild(child: IRenderable) {
        let child_index = this.children.indexOf(child)
        if (child_index > -1) {
            this.children.splice(child_index, 1)
        }
    }

    /**
     * Update Method, update children
     * @param dt Delta Time
     */
    update(dt: number) {
        this.children.forEach((child) => child.update(dt))
    }

    /** Draw Method, draw children */
    draw() {
        this.children.forEach((child) => child.draw())
    }
}
