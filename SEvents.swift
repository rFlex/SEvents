//
//  SEvents.swift
//  One
//
//  Created by Simon CORSIN on 04/11/14.
//  Copyright (c) 2014 Simon Corsin. All rights reserved.
//

import Foundation

// An Event object is a way for an object instance to declare an event that
// happen within this particular object lifecycle.
// Other objects listen to this event and the object that manages this event
// decides when to propagate the event to all the listeners.
//
// An event listener is called a handler.
//
// To add a handler, you can either call the "add()" method or use the overloaded
// operator "+=".
//
// To notify the handlers, you call "notify()" that will notify every handlers
// that this event occured.
//
// Events can be either thread safe or not. Making them thread safe will
// allow adding, removing and notifying handlers to be done on any queue.
//
// Events can also have a dispatchQueue. This will make every notify() calls
// to be done asynchronously on this given queue.
//
// Each added handler can specify a queue to which they want to be called.
// This makes the handler to be notified in the thread they specified.
// This override the dispatchQueue set when creating the event.

class Event<T> : EventHandlersWrapper<(T) -> Void>  {
    
    // Init a non-thread safe Event.
    // Callbacks with be called synchronously on the current queue.
    // Adding/removing and notifying handlers must be done on the same queue.
    convenience init() {
        self.init(threadSafe: false, dispatchQueue: nil)
    }
    
    // Init a thread safe Event.
    // Callbacks with be called synchronously on the current queue.
    // Adding/removing and notifying handlers can be done on any queue.
    convenience init(threadSafe: Bool) {
        self.init(threadSafe: threadSafe, dispatchQueue: nil)
    }
    
    // Init a non-thread safe Event.
    // Callbacks with be called synchronously on the given queue.
    // Make sure you don't call "notify" on the same queue as the one given,
    // otherwhise deadlocks will occur.
    // Adding/removing and notifying handlers must be done on the same queue.
    convenience init(dispatchQueue: dispatch_queue_t?) {
        self.init(threadSafe: false, dispatchQueue: dispatchQueue)
    }
    
    // Init an Event that can be either thread-safe or not.
    // Callbacks with be called synchronously on the given queue.
    // Pass nil to make the notify call on the current queue.
    // Make sure you don't call "notify" on the same queue as the one given,
    // otherwhise deadlocks will occur.
    override init(threadSafe: Bool, dispatchQueue: dispatch_queue_t?) {
        super.init(threadSafe: threadSafe, dispatchQueue: dispatchQueue)
        
    }

    // Add an handler that will be called when calling notify().
    // The parameters in the handler will be the one given by the
    // caller of the notify() method.
//    override func add(handler: (T) -> Void) -> Int {
//        println("Calling that super \(handler)")
//        return super.add(handler)
//    }

    // Add an handler that will be called when calling notify().
    // The parameters in the handler will be the one given by the
    // caller of the notify() method.
    // the handler will be called in the given dispatchQueue, if not nil
//    override func add(handler: (T) -> Void, dispatchQueue: dispatch_queue_t?) -> Int {
//        return super.add(handler, dispatchQueue: dispatchQueue)
//    }

    
    // Notify every handlers. The callback added using the add() method
    // will be called the "param" will be given as first parameter on
    // the function.
    func notify(param: T) {
        self.doOnHandlers { (handler) -> Void in
            handler(param)
        }
    }
    
}

class Event2<T, T2> : EventHandlersWrapper<(T, T2) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false, dispatchQueue: nil)
    }
    
    convenience init(threadSafe: Bool) {
        self.init(threadSafe: threadSafe, dispatchQueue: nil)
    }
    
    convenience init(dispatchQueue: dispatch_queue_t?) {
        self.init(threadSafe: false, dispatchQueue: dispatchQueue)
    }
    
    override init(threadSafe: Bool, dispatchQueue: dispatch_queue_t?) {
        super.init(threadSafe: threadSafe, dispatchQueue: dispatchQueue)
    }
    
    func notify(param: T, param2: T2) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2)
        }
    }
    
}

class Event3<T, T2, T3> : EventHandlersWrapper<(T, T2, T3) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false, dispatchQueue: nil)
    }
    
    convenience init(threadSafe: Bool) {
        self.init(threadSafe: threadSafe, dispatchQueue: nil)
    }
    
    convenience init(dispatchQueue: dispatch_queue_t?) {
        self.init(threadSafe: false, dispatchQueue: dispatchQueue)
    }
    
    override init(threadSafe: Bool, dispatchQueue: dispatch_queue_t?) {
        super.init(threadSafe: threadSafe, dispatchQueue: dispatchQueue)
    }
    
    func notify(param: T, param2: T2, param3: T3) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3)
        }
    }
    
}

class Event4<T, T2, T3, T4> : EventHandlersWrapper<(T, T2, T3, T4) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false, dispatchQueue: nil)
    }
    
    convenience init(threadSafe: Bool) {
        self.init(threadSafe: threadSafe, dispatchQueue: nil)
    }
    
    convenience init(dispatchQueue: dispatch_queue_t?) {
        self.init(threadSafe: false, dispatchQueue: dispatchQueue)
    }
    
    override init(threadSafe: Bool, dispatchQueue: dispatch_queue_t?) {
        super.init(threadSafe: threadSafe, dispatchQueue: dispatchQueue)
    }
    
    func notify(param: T, param2: T2, param3: T3, param4: T4) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3, param4)
        }
    }
    
}

class Event5<T, T2, T3, T4, T5> : EventHandlersWrapper<(T, T2, T3, T4, T5) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false, dispatchQueue: nil)
    }
    
    convenience init(threadSafe: Bool) {
        self.init(threadSafe: threadSafe, dispatchQueue: nil)
    }
    
    convenience init(dispatchQueue: dispatch_queue_t?) {
        self.init(threadSafe: false, dispatchQueue: dispatchQueue)
    }
    
    override init(threadSafe: Bool, dispatchQueue: dispatch_queue_t?) {
        super.init(threadSafe: threadSafe, dispatchQueue: dispatchQueue)
    }
    
    func notify(param: T, param2: T2, param3: T3, param4: T4, param5: T5) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3, param4, param5)
        }
    }
    
}

class Event6<T, T2, T3, T4, T5, T6> : EventHandlersWrapper<(T, T2, T3, T4, T5, T6) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false, dispatchQueue: nil)
    }
    
    convenience init(threadSafe: Bool) {
        self.init(threadSafe: threadSafe, dispatchQueue: nil)
    }
    
    convenience init(dispatchQueue: dispatch_queue_t?) {
        self.init(threadSafe: false, dispatchQueue: dispatchQueue)
    }
    
    override init(threadSafe: Bool, dispatchQueue: dispatch_queue_t?) {
        super.init(threadSafe: threadSafe, dispatchQueue: dispatchQueue)
    }
    
    func notify(param: T, param2: T2, param3: T3, param4: T4, param5: T5, param6: T6) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3, param4, param5, param6)
        }
    }
    
}

class Event7<T, T2, T3, T4, T5, T6, T7> : EventHandlersWrapper<(T, T2, T3, T4, T5, T6, T7) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false, dispatchQueue: nil)
    }
    
    convenience init(threadSafe: Bool) {
        self.init(threadSafe: threadSafe, dispatchQueue: nil)
    }
    
    convenience init(dispatchQueue: dispatch_queue_t?) {
        self.init(threadSafe: false, dispatchQueue: dispatchQueue)
    }
    
    override init(threadSafe: Bool, dispatchQueue: dispatch_queue_t?) {
        super.init(threadSafe: threadSafe, dispatchQueue: dispatchQueue)
    }
    
    func notify(param: T, param2: T2, param3: T3, param4: T4, param5: T5, param6: T6, param7: T7) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3, param4, param5, param6, param7)
        }
    }
    
}

class Event8<T, T2, T3, T4, T5, T6, T7, T8> : EventHandlersWrapper<(T, T2, T3, T4, T5, T6, T7, T8) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false, dispatchQueue: nil)
    }
    
    convenience init(threadSafe: Bool) {
        self.init(threadSafe: threadSafe, dispatchQueue: nil)
    }
    
    convenience init(dispatchQueue: dispatch_queue_t?) {
        self.init(threadSafe: false, dispatchQueue: dispatchQueue)
    }
    
    override init(threadSafe: Bool, dispatchQueue: dispatch_queue_t?) {
        super.init(threadSafe: threadSafe, dispatchQueue: dispatchQueue)
    }
    
    func notify(param: T, param2: T2, param3: T3, param4: T4, param5: T5, param6: T6, param7: T7, param8: T8) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3, param4, param5, param6, param7, param8)
        }
    }
    
}


///////////////////
// Implementation
//////

struct EventHandler<T> {
    
    let id: Int
    let entry: T
    let dispatchQueue: dispatch_queue_t?
    
    init(id: Int, entry: T, dispatchQueue: dispatch_queue_t?) {
        self.id = id
        self.entry = entry
        self.dispatchQueue = dispatchQueue
    }
    
}

class EventHandlers<T> {
    
    private var handlers = Array<EventHandler<T>>()
    private var id = 0
    
    func acquireHandlersCopy() -> Array<EventHandler<T>> {
        return self.handlers
    }
    
    private func nextId() -> Int {
        return self.id++
    }
    
    func doOnHandlers(callback: (T) -> Void) {
        let handlersCopy = self.acquireHandlersCopy()
        
        for handler in handlersCopy {
            if let dispatchQueue = handler.dispatchQueue {
                dispatch_async(dispatchQueue, { () -> Void in
                    callback(handler.entry)
                })
            } else {
                callback(handler.entry)
            }
        }
    }

    func add(handler: T, dispatchQueue: dispatch_queue_t?) -> Int {
        let id = self.nextId()
        
        self.handlers.append(EventHandler<T>(id: id, entry: handler, dispatchQueue: dispatchQueue))
        
        return id
    }
    
    func remove(id: Int) {
        let handlersCopy = self.handlers
        
        var idx = 0
        for handler in handlersCopy {
            if handler.id == id {
                self.handlers.removeAtIndex(idx)
            } else {
                idx++
            }
        }
    }
}

class ThreadSafeEventHandlers<T> : EventHandlers<T> {
    
    let lock = NSLock()
    
    override func acquireHandlersCopy() -> Array<EventHandler<T>> {
        // Don't really know if it is necessary to lock as Array's are value types.
        // I do it anyway until I get more information
        
        lock.lock()
        
        let copy = super.acquireHandlersCopy()
        
        lock.unlock()
        
        return copy
    }
    
    override func add(handler: T, dispatchQueue: dispatch_queue_t?) -> Int {
        lock.lock()
        
        let id = super.add(handler, dispatchQueue: dispatchQueue)
        
        lock.unlock()
        
        return id
    }
    
    override func remove(id: Int) {
        lock.lock()
        
        super.remove(id)
        
        lock.unlock()
    }
    
}

class EventHandlersWrapper<T> {
    
    let dispatchQueue: dispatch_queue_t?
    
    private let wrapped: EventHandlers<T>
    
    init(threadSafe: Bool, dispatchQueue: dispatch_queue_t?) {
        self.wrapped = threadSafe ? ThreadSafeEventHandlers<T>() : EventHandlers<T>()
        self.dispatchQueue = dispatchQueue
    }
    
    func doOnHandlers(callback: (T) -> Void) {
        let executionClosure = { () -> Void in self.wrapped.doOnHandlers(callback) }
        
        if let dispatchQueue = self.dispatchQueue {
            dispatch_async(dispatchQueue, executionClosure)
        } else {
            executionClosure()
        }
    }
    
    func add(handler: T) -> Int {
        return self.wrapped.add(handler, dispatchQueue: nil)
    }
    
    func add(handler: T, dispatchQueue: dispatch_queue_t?) -> Int {
        return self.wrapped.add(handler, dispatchQueue: dispatchQueue)
    }
    
    func remove(id: Int) {
        self.wrapped.remove(id)
    }
    
}

func +=<T>(event: EventHandlersWrapper<T>, handler: T) -> Int {
    return event.add(handler)
}

func -=<T>(event: EventHandlersWrapper<T>, id: Int) {
    event.remove(id)
}