import { ColouredText, Font } from "love.graphics";
import { KeyConstant } from "love.keyboard";
import { Input } from "../Input";
import { IRenderable } from "../Renderable";
/** Menu Class */
export declare class Menu implements IRenderable {
    /** Menu Font */
    font: Font;
    /** Selected Item Counter */
    selected_item: number;
    /** Menu Items */
    items: [display: string | ColouredText, action: () => void][];
    /** Input Handler */
    protected input: Input;
    /** Handled Tag */
    protected handled: boolean;
    /**
     * Menu Constructor
     * @param bindings Input Bindings, need "up", "down", "action" binded
     * @param items Menu Items
     * @param font Menu Font
     */
    constructor(bindings: {
        [action_name: string]: KeyConstant;
    }, items?: [display: string | ColouredText, action: () => void][], font?: Font);
    /** Update Method, move cursor */
    update(): void;
    /** Draw Method, draw the menu */
    draw(): void;
}
