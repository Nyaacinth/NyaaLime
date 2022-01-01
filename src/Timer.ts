/** Timer Registry */
export type TimerRegistry = {
    /** Total Life Time */
    life: number

    /** Time Elapsed */
    time: number

    /** Calling Count, for `onDuring` */
    count: number

    /** Duration Setting, for `onDuring` */
    duration: number

    /** Last Called Timestamp */
    last_called: number

    /** During Callback */
    onDuring?: (dt: number) => void

    /** End Callback */
    onEnd?: () => void
}

/** Timer Tweener (Custom Registry) Class */
export class TimerTweener implements TimerRegistry {
    // Registry Typedefs
    life: number
    time: number
    count: number
    duration: number
    last_called: number
    onDuring?: (dt: number) => void
    onEnd?: () => void

    /** All available tweening methods */ // * Copied from hump.timer, see: https://github.com/vrld/hump/blob/master/timer.lua
    protected readonly tweening_handlers = {
        linear: (value: number) => value,
        quad: (value: number) => value ** 2,
        cubic: (value: number) => value ** 3,
        quart: (value: number) => value ** 4,
        quint: (value: number) => value ** 5,
        sine: (value: number) => 1 - Math.cos((value * Math.PI) / 2),
        expo: (value: number) => 2 ** (10 * (value - 1)),
        circle: (value: number) => 1 - Math.sqrt(1 - value ** 2),
        bounce: (value: number) => {
            let a = 7.5625,
                b = 1 / 2.75
            return Math.min(a * value ** 2, a * (value - 1.5 * b) ** 2 + 0.75, a * (value - 2.25 * b) ** 2 + 0.9375, a * (value - 2.625 * b) ** 2 + 0.984375) // Magic!
        }
    }

    /** Subjects Container, structure must be same as `target` (constructor force) */
    protected subject: {[index: string]: number}

    /** Targets Container, structure must be same as `subject` */
    protected target: {[index: string]: number}

    /** Tweening Object, as output */
    tweening_object: {[index: string]: number}

    /** Tweening method set before */
    protected method: (value: number) => number

    /**
     * Timer Tweener Registry Constructor
     * @param delay Duration of the tween
     * @param subject Object has values to be tweened
     * @param target Target values
     * @param method Tweening method, defaults to `linear`
     * @param after Function to execute after the tween has finished
     */
    constructor(delay: number, subject: {[index: string]: number}, target: {[index: string]: number}, method: keyof TimerTweener["tweening_handlers"], after?: () => void) {
        // Init Registry
        this.life = delay
        this.time = 0
        this.duration = 0
        this.last_called = 0
        this.onDuring = this.processTweening
        this.onEnd = after
        this.count = Infinity

        this.target = target
        this.method = this.tweening_handlers[method]
        let tweening_objects: {[index: string]: number} = {}
        for (let index in target) {
            let [item] = assert(subject[index], `Target ${index} has no subject to match`) // Assert: Every targets has a subject with it
            tweening_objects[index] = item
        }
        this.tweening_object = subject
        this.subject = {...tweening_objects} // Unpack subject to prevent input changing
    }

    /** Process Tweening, will be set as `onDuring()` */
    protected processTweening() {
        for (let index in this.target) {
            let subject = this.subject[index],
                target = this.target[index]
            let factor = this.method(Math.min(1, this.time / this.life))
            this.tweening_object[index] = subject + (target - subject) * factor
        }
    }
}

/** Timer Class */
export class Timer {
    /** Timer Registrys Container */
    protected registry_container: TimerRegistry[]

    /** Timer Constructor */
    constructor() {
        this.registry_container = []
    }

    /**
     * Register a ticket to timer
     * @param ticket Registry to register
     */
    register(ticket: TimerRegistry) {
        if (this.registry_container.includes(ticket)) {
            return
        }
        this.registry_container.push(ticket)
    }

    /**
     * Unregister a ticket from timer
     * @param ticket Registry to unregister
     */
    unregister(ticket: TimerRegistry) {
        let exist_index = this.registry_container.indexOf(ticket)
        if (exist_index > -1) {
            this.registry_container.splice(exist_index, 1)
        }
    }

    /** Unregister all tickets from timer */
    clear() {
        this.registry_container = []
    }

    /**
     * Update Method
     * @param dt Delta Time
     */
    update(dt: number) {
        for (let i = 0; i < this.registry_container.length; i++) {
            let current = this.registry_container[i]
            current.time += dt
            if (current.onDuring && current.time - current.last_called > current.duration) {
                current.last_called = current.time
                current.onDuring(dt)
            }
            if (current.time > current.life) {
                current.onEnd?.()
                this.registry_container.splice(i, 1)
                i -= 1 // Caused by splice
            }
        }
    }

    //--------------------------- Registry Creators ---------------------------//

    /**
     * Schedule a function to be executed after `delay` seconds have elapsed
     * @param delay Delay, in seconds
     * @param func Function to be executed
     * @returns registry, for `unregister`
     */
    after(delay: number, func: () => void) {
        let reg = {
            life: delay,
            time: 0,
            count: 0,
            duration: 0,
            last_called: 0,
            onEnd: func
        }
        this.register(reg)
        return reg
    }

    /**
     * Set a function that will be executed `count` times every `duration` seconds before `limit` (or Infinity) reached, then call `after` for the end
     * @param duration Duration, in seconds
     * @param func Function to be executed
     * @param count Count times to execute
     * @param limit Total Duration
     * @param after End Callback
     * @returns registry, for `unregister`
     */
    every(duration: number, func: () => void, count: number = Infinity, limit: number = Infinity, after?: () => void) {
        let reg = {
            life: limit,
            time: 0,
            count: count,
            duration: duration,
            last_called: 0,
            onDuring: func,
            onEnd: after
        }
        this.register(reg)
        return reg
    }

    /**
     * Set a function that will be executed every update before `limit` reached, then call `after` for the end
     * @param limit Total Duration
     * @param func Function to be executed
     * @param after End Callback
     * @returns registry, for `unregister`
     */
    during(limit: number, func: (dt: number) => void, after?: () => void) {
        let reg = {
            life: limit,
            time: 0,
            count: Infinity,
            duration: 0,
            last_called: 0,
            onDuring: func,
            onEnd: after
        }
        this.register(reg)
        return reg
    }

    /**
     * Tweening some values from subject to target
     * @param delay Duration of tweening
     * @param subject Object contains values to be tweened
     * @param target Target values
     * @param method Tweening method, defaults to `linear` (See: TimerTweener.tweening_handlers)
     * @param after Function to execute after the tweening finished
     * @returns registry, for `unregister`
     */
    tween<TTarget extends {[index: string]: number}, TSubject extends TTarget>(
        delay: number,
        subject: TSubject,
        target: TTarget,
        method: keyof TimerTweener["tweening_handlers"],
        after?: () => void
    ): TimerTweener {
        let tweener = new TimerTweener(delay, subject, target, method, after)
        this.register(tweener)
        return tweener
    }
}
