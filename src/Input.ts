import {KeyConstant} from "love.keyboard"

/** Input Handler Class */
export class Input {
    /** Key Bindings */
    bindings: {[action_name: string]: KeyConstant}

    /**
     * Input Handler Constructor
     * @param bindings Key Bindings
     */
    constructor(bindings: {[action_name: string]: KeyConstant} = {}) {
        this.bindings = bindings
    }

    /**
     * Bind action and scancode
     * @param scancode Scancode
     * @param action_name Action Name
     */
    bind(scancode: KeyConstant, action_name: string) {
        this.bindings[action_name] = scancode
    }

    /**
     * Check if action's key is down
     * @param action_name Action Name
     */
    isDown(action_name?: string) {
        if (action_name) {
            return love.keyboard.isDown(this.bindings[action_name])
        }
        for (let action_name in this.bindings) {
            if (love.keyboard.isDown(this.bindings[action_name])) return true
        }
        return false
    }

    /** Get current pressed keys */
    getKeyPressed() {
        let keypressed: string[] = []
        for (let action_name in this.bindings) {
            let key = this.bindings[action_name]
            if (love.keyboard.isDown(key)) {
                keypressed.push(action_name)
            }
        }
        return keypressed
    }
}
