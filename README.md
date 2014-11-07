SEvents
=======

Swift events dispatching made easy.

It adds a convenient way for your objects to declare events that those objects send, and let listeners register easily to those events to know when they happen.

How it works
------------

An Event object is a way for an object instance to declare an event that happen within this particular object lifecycle. Other objects listen to this event and the object that manages this event decides when to propagate the event to all the listeners.

An event listener is called a handler.

To add a handler, you can either call the "add()" method on the Event object or use the overloaded operator "+=". Both methods return an integer id that can be used for removing the added handler later.

To notify the handlers, you call "notify()" that will notify every handlers that this event occured.

Usage
--------

```swift
// Declaring an event
// It declares "onTextEntered" has an event than can be produced
// Objects can register to it to find out when this event happens
let onTextEntered = Event<String>()

// Registering to an event
// It adds an handler on this event. When this event
// is notified, the added callback is called
onTextEntered += { (text) in 
  println("User entered: \(text)")
}

// Or without using the operator overload
onTextEntered.add({ (text) in
  println("User entered: \(text)")
})

// Notifying an event.
// This calls every callbacks registered on this event.
// On this example, this should print two times "User entered: wololo"
onTextEntered.notify("wololo")

// Declaring an event that takes multiple parameter.
// Just adds the number of parameter after the "Event" class, it goes up to 8.
let onTextEntered = Event2<String, Int>()
onTextEntered.notify("Hey", 42)

// Adding a handler and keeping a reference to it
let id = onTextEntered += ({ (text, id) in
  println("\(id) - \(text)")
})

// Removing a handler by using the reference
onTextEntered -= id
```

Multithreading
---------------

Events can be either thread safe or not. Making them thread safe will allow adding, removing and notifying handlers to be done on any queue/thread.

Events can also have a dispatchQueue. This will make every notify() calls to be done asynchronously on this given queue.

Each added handler can also specify a queue to which they want to be called. This makes the handler to be notified in the thread they specified. This override the dispatchQueue set when creating the event.

Multithreading usage
---------------

```swift
// Declaring a thread safe Event
let onTextEntered = Event<String>(threadSafe: true)

// Add a handler that will be called on the main queue
onTextEntered.add({ (str) in println(str) }, dispatchQueue: dispatch_get_main_queue())

// Declaring a thread safe event where every handlers are called on the main thread
let onTextCleared = Event2<Int, String>(threadSafe: true, dispatchQueue: dispatch_get_main_queue())
```

Installation
--------

It's just one file. Until there is a proper way to handle project dependencies on Swift, you can easily take this file and copy it to your project.
