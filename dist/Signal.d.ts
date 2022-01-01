export declare class Signal {
    /** Connected Signals */
    protected connected_signals: {
        [signal_name: string]: ((...varargs: unknown[]) => void)[];
    };
    /**
     * Emit signal with given arguments
     * @param signal_name Signal Name
     * @param varargs Optional Arguments
     */
    emit(signal_name: string, ...varargs: any[]): void;
    /**
     * Connect callback to the signal
     * @param signal_name Signal Name
     * @param callback Callback to connect
     */
    connect(signal_name: string, callback: (...varargs: unknown[]) => void): void;
    /**
     * Disconnect callback from the signal
     * @param signal_name Signal Name
     * @param callback Callback to disconnect
     */
    disconnect(signal_name: string, callback: (...varargs: unknown[]) => void): void;
    /** Clear all signal connections */
    clear(): void;
    /**
     * Clear given signal connections
     * @param signal_name Signal Name
     */
    clear(signal_name: string): void;
}
