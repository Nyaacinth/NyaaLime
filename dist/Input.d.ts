import { KeyConstant } from "love.keyboard";
/** Input Handler Class */
export declare class Input {
    /** Key Bindings */
    bindings: {
        [action_name: string]: KeyConstant;
    };
    /**
     * Input Handler Constructor
     * @param bindings Key Bindings
     */
    constructor(bindings?: {
        [action_name: string]: KeyConstant;
    });
    /**
     * Bind action and scancode
     * @param scancode Scancode
     * @param action_name Action Name
     */
    bind(scancode: KeyConstant, action_name: string): void;
    /**
     * Check if action's key is down
     * @param action_name Action Name
     */
    isDown(action_name?: string): boolean;
    /** Get current pressed keys */
    getKeyPressed(): string[];
}
