## APSwiftHelpers
[![Build Status](https://travis-ci.org/alexpls/APSwiftHelpers.svg?branch=master)](https://travis-ci.org/alexpls/APSwiftHelpers)

Common functions I use while developing iOS apps in Swift. Find them helpful? Help yourself.

### Dispatch
Helpers for working with Grand Central Dispatch queues.

```swift
// Perform a block on the given queue
performOn(.Main) { self.tableView.reloadData() }
performOn(.LowPriority) { self.clearCache() }

// Delay a block on the given queue - if no queue is provided .Main is assumed
delay(0.5) { self.hideSpinner() }
delay(30, .Background) { self.logActivity() }

// Queue types available:
enum QueueType {
  case Main         // The app's main queue
  case Background   // Background queue (DISPATCH_QUEUE_PRIORITY_BACKGROUND)
  case LowPriority  // Background queue (DISPATCH_QUEUE_PRIORITY_LOW)
  case HighPriority // Background queue (DISPATCH_QUEUE_PRIORITY_HIGH)
}
```

### DebugLogging
```swift
// Print a formatted log message for a CustomDebugStringConvertible

struct Animal: CustomDebugStringConvertible {
  let name: String
  var debugDescription: String { return name }
}

let dog = Animal(name: "Woofy")
debugLog(dog, "is tired") // prints "(Woofy) is tired" to the console
```

### NSCoding+Helpers
Extension to NSCoding to make it more Swift-y.
```swift
// Archive an NSCoding to NSData
let note = Note(title: "secret", content: "I like turtles")
let archivedData = note.archive()

// Unarchive NSData into an NSCoding object
let unarchivedNote = Note.unarchive(archivedData)
unarchivedNote.content // "I like turtles"
```

### CATransaction+Helpers
```swift
// Run the given block with CAAnimations disabled
withCAAnimationsDisabled { self.view.resize() }
```

### App
```swift
// Get info about the currently running app (taken from the
// main bundle's) Info.plist file
App.name
App.version
App.formattedNameAndVersion

// Returns true/false whether the app running within the simulator or not
App.inSimulator
```
