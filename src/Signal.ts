export class Signal {
    /** Connected Signals */
    protected connected_signals: {[signal_name: string]: ((...varargs: unknown[]) => void)[]} = {}

    /**
     * Emit signal with given arguments
     * @param signal_name Signal Name
     * @param varargs Optional Arguments
     */
    emit(signal_name: string, ...varargs: any[]) {
        if (this.connected_signals[signal_name]) {
            this.connected_signals[signal_name].forEach((callback) => callback(...varargs))
        }
    }

    /**
     * Connect callback to the signal
     * @param signal_name Signal Name
     * @param callback Callback to connect
     */
    connect(signal_name: string, callback: (...varargs: unknown[]) => void) {
        if (!this.connected_signals[signal_name]) {
            this.connected_signals[signal_name] = []
        }
        let connections = this.connected_signals[signal_name]
        if (connections.includes(callback)) return
        connections.push(callback)
    }

    /**
     * Disconnect callback from the signal
     * @param signal_name Signal Name
     * @param callback Callback to disconnect
     */
    disconnect(signal_name: string, callback: (...varargs: unknown[]) => void) {
        if (!this.connected_signals[signal_name]) return
        let connections = this.connected_signals[signal_name]
        let callback_index = connections.indexOf(callback)
        if (callback_index > -1) {
            connections.splice(callback_index, 1)
        }
        if (connections.length === 0) {
            delete this.connected_signals[signal_name]
        }
    }

    /** Clear all signal connections */
    clear(): void
    /**
     * Clear given signal connections
     * @param signal_name Signal Name
     */
    clear(signal_name: string): void
    //-------------------------//
    clear(signal_name?: string) {
        if (signal_name) {
            delete this.connected_signals[signal_name]
        } else {
            this.connected_signals = {}
        }
    }
}
