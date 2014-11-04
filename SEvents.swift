//
//  SEvents.swift
//  One
//
//  Created by Simon CORSIN on 04/11/14.
//  Copyright (c) 2014 Simon Corsin. All rights reserved.
//

import Foundation

class EventHandlers<T> {
    
    private var handlers = Array<(Int, T)>()
    private var id = 0
    
    func acquireHandlersCopy() -> Array<(Int, T)> {
        return self.handlers
    }
    
    private func nextId() -> Int {
        return self.id++
    }
    
    func doOnHandlers(callback: (T) -> Void) {
        let handlersCopy = self.acquireHandlersCopy()
        
        for (key: Int, handler: T) in handlersCopy {
            callback(handler)
        }
    }
    
    func add(handler: T) -> Int {
        let id = self.nextId()
        
        let tuple: (Int, T) = (id, handler)
        
        self.handlers.append(tuple)
        
        return id
    }
    
    func remove(id: Int) {
        let handlersCopy = self.handlers
        
        var idx = 0
        for (key: Int, handler: T) in handlersCopy {
            if key == id {
                self.handlers.removeAtIndex(idx)
            } else {
                idx++
            }
        }
    }
}

class ThreadSafeEventHandlers<T> : EventHandlers<T> {
    
    let lock = NSLock()
    
    override func acquireHandlersCopy() -> Array<(Int, T)> {
        // Don't really know if it is necessary to lock as Array's are value types.
        // I do it anyway until I get more information
        
        lock.lock()
        
        let copy = super.acquireHandlersCopy()
        
        lock.unlock()
        
        return copy
    }
    
    override func add(handler: T) -> Int {
        lock.lock()
        
        let id = super.add(handler)
        
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
    
    private let wrapped: EventHandlers<T>
    
    init(threadSafe: Bool) {
        self.wrapped = threadSafe ? ThreadSafeEventHandlers<T>() : EventHandlers<T>()
    }
    
    
    func doOnHandlers(callback: (T) -> Void) {
        self.wrapped.doOnHandlers(callback)
    }
    
    func add(handler: T) -> Int {
        return self.wrapped.add(handler)
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



class Event<T> : EventHandlersWrapper<(T) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false)
    }
    
    override init(threadSafe: Bool) {
        super.init(threadSafe: threadSafe)
    }
    
    func notify(param: T) {
        self.doOnHandlers { (handler) -> Void in
            handler(param)
        }
    }
    
}

class Event2<T, T2> : EventHandlersWrapper<(T, T2) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false)
    }
    
    override init(threadSafe: Bool) {
        super.init(threadSafe: threadSafe)
    }
    
    func notify(param: T, param2: T2) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2)
        }
    }
    
}

class Event3<T, T2, T3> : EventHandlersWrapper<(T, T2, T3) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false)
    }
    
    override init(threadSafe: Bool) {
        super.init(threadSafe: threadSafe)
    }
    
    func notify(param: T, param2: T2, param3: T3) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3)
        }
    }
    
}

class Event4<T, T2, T3, T4> : EventHandlersWrapper<(T, T2, T3, T4) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false)
    }
    
    override init(threadSafe: Bool) {
        super.init(threadSafe: threadSafe)
    }
    
    func notify(param: T, param2: T2, param3: T3, param4: T4) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3, param4)
        }
    }
    
}

class Event5<T, T2, T3, T4, T5> : EventHandlersWrapper<(T, T2, T3, T4, T5) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false)
    }
    
    override init(threadSafe: Bool) {
        super.init(threadSafe: threadSafe)
    }
    
    func notify(param: T, param2: T2, param3: T3, param4: T4, param5: T5) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3, param4, param5)
        }
    }
    
}

class Event6<T, T2, T3, T4, T5, T6> : EventHandlersWrapper<(T, T2, T3, T4, T5, T6) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false)
    }
    
    override init(threadSafe: Bool) {
        super.init(threadSafe: threadSafe)
    }
    
    func notify(param: T, param2: T2, param3: T3, param4: T4, param5: T5, param6: T6) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3, param4, param5, param6)
        }
    }
    
}

class Event7<T, T2, T3, T4, T5, T6, T7> : EventHandlersWrapper<(T, T2, T3, T4, T5, T6, T7) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false)
    }
    
    override init(threadSafe: Bool) {
        super.init(threadSafe: threadSafe)
    }
    
    func notify(param: T, param2: T2, param3: T3, param4: T4, param5: T5, param6: T6, param7: T7) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3, param4, param5, param6, param7)
        }
    }
    
}

class Event8<T, T2, T3, T4, T5, T6, T7, T8> : EventHandlersWrapper<(T, T2, T3, T4, T5, T6, T7, T8) -> Void>  {
    
    convenience init() {
        self.init(threadSafe: false)
    }
    
    override init(threadSafe: Bool) {
        super.init(threadSafe: threadSafe)
    }
    
    func notify(param: T, param2: T2, param3: T3, param4: T4, param5: T5, param6: T6, param7: T7, param8: T8) {
        self.doOnHandlers { (handler) -> Void in
            handler(param, param2, param3, param4, param5, param6, param7, param8)
        }
    }
    
}