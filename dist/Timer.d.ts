/** Timer Registry */
export declare type TimerRegistry = {
    /** Total Life Time */
    life: number;
    /** Time Elapsed */
    time: number;
    /** Calling Count, for `onDuring` */
    count: number;
    /** Duration Setting, for `onDuring` */
    duration: number;
    /** Last Called Timestamp */
    last_called: number;
    /** During Callback */
    onDuring?: (dt: number) => void;
    /** End Callback */
    onEnd?: () => void;
};
/** Timer Tweener (Custom Registry) Class */
export declare class TimerTweener implements TimerRegistry {
    life: number;
    time: number;
    count: number;
    duration: number;
    last_called: number;
    onDuring?: (dt: number) => void;
    onEnd?: () => void;
    /** All available tweening methods */ protected readonly tweening_handlers: {
        linear: (value: number) => number;
        quad: (value: number) => number;
        cubic: (value: number) => number;
        quart: (value: number) => number;
        quint: (value: number) => number;
        sine: (value: number) => number;
        expo: (value: number) => number;
        circle: (value: number) => number;
        bounce: (value: number) => number;
    };
    /** Subjects Container, structure must be same as `target` (constructor force) */
    protected subject: {
        [index: string]: number;
    };
    /** Targets Container, structure must be same as `subject` */
    protected target: {
        [index: string]: number;
    };
    /** Tweening Object, as output */
    tweening_object: {
        [index: string]: number;
    };
    /** Tweening method set before */
    protected method: (value: number) => number;
    /**
     * Timer Tweener Registry Constructor
     * @param delay Duration of the tween
     * @param subject Object has values to be tweened
     * @param target Target values
     * @param method Tweening method, defaults to `linear`
     * @param after Function to execute after the tween has finished
     */
    constructor(delay: number, subject: {
        [index: string]: number;
    }, target: {
        [index: string]: number;
    }, method: keyof TimerTweener["tweening_handlers"], after?: () => void);
    /** Process Tweening, will be set as `onDuring()` */
    protected processTweening(): void;
}
/** Timer Class */
export declare class Timer {
    /** Timer Registrys Container */
    protected registry_container: TimerRegistry[];
    /** Timer Constructor */
    constructor();
    /**
     * Register a ticket to timer
     * @param ticket Registry to register
     */
    register(ticket: TimerRegistry): void;
    /**
     * Unregister a ticket from timer
     * @param ticket Registry to unregister
     */
    unregister(ticket: TimerRegistry): void;
    /** Unregister all tickets from timer */
    clear(): void;
    /**
     * Update Method
     * @param dt Delta Time
     */
    update(dt: number): void;
    /**
     * Schedule a function to be executed after `delay` seconds have elapsed
     * @param delay Delay, in seconds
     * @param func Function to be executed
     * @returns registry, for `unregister`
     */
    after(delay: number, func: () => void): {
        life: number;
        time: number;
        count: number;
        duration: number;
        last_called: number;
        onEnd: () => void;
    };
    /**
     * Set a function that will be executed `count` times every `duration` seconds before `limit` (or Infinity) reached, then call `after` for the end
     * @param duration Duration, in seconds
     * @param func Function to be executed
     * @param count Count times to execute
     * @param limit Total Duration
     * @param after End Callback
     * @returns registry, for `unregister`
     */
    every(duration: number, func: () => void, count?: number, limit?: number, after?: () => void): {
        life: number;
        time: number;
        count: number;
        duration: number;
        last_called: number;
        onDuring: () => void;
        onEnd: (() => void) | undefined;
    };
    /**
     * Set a function that will be executed every update before `limit` reached, then call `after` for the end
     * @param limit Total Duration
     * @param func Function to be executed
     * @param after End Callback
     * @returns registry, for `unregister`
     */
    during(limit: number, func: (dt: number) => void, after?: () => void): {
        life: number;
        time: number;
        count: number;
        duration: number;
        last_called: number;
        onDuring: (dt: number) => void;
        onEnd: (() => void) | undefined;
    };
    /**
     * Tweening some values from subject to target
     * @param delay Duration of tweening
     * @param subject Object contains values to be tweened
     * @param target Target values
     * @param method Tweening method, defaults to `linear` (See: TimerTweener.tweening_handlers)
     * @param after Function to execute after the tweening finished
     * @returns registry, for `unregister`
     */
    tween<TTarget extends {
        [index: string]: number;
    }, TSubject extends TTarget>(delay: number, subject: TSubject, target: TTarget, method: keyof TimerTweener["tweening_handlers"], after?: () => void): TimerTweener;
}
