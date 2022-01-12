import { ColouredText, Font } from "love.graphics";
import { KeyConstant } from "love.keyboard";
import { Input } from "../Input";
import { IRenderable } from "../Renderable";
export declare class Menu implements IRenderable {
    font: Font;
    selected_item: number;
    items: [display: string | ColouredText, action: () => void][];
    protected input: Input;
    protected just_pressed: boolean;
    constructor(bindings: {
        [action_name: string]: KeyConstant;
    }, items?: [display: string, action: () => void][], font?: Font);
    update(): void;
    draw(): void;
}
