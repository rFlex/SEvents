SEvents
=======

Swift events dispatching made easy, done the C# way.

It adds a convenient way for your objects to declare events that those objects send, and let listeners register easily to those events to know when they happen.


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

// Notifying an event 
// This calls every callbacks registered on this event
onTextEntered.notify("wololo")


```

Installation
--------

It's just one file. Until there is a proper way to handle project dependencies on Swift, you can easily take this file and copy it to your project.


