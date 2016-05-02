## APSwiftHelpers
[![CocoaPods](https://img.shields.io/cocoapods/v/APSwiftHelpers.svg)](https://cocoapods.org/pods/APSwiftHelpers) [![Build Status](https://travis-ci.org/alexpls/APSwiftHelpers.svg?branch=master)](https://travis-ci.org/alexpls/APSwiftHelpers)

Common helpers for developing iOS apps in Swift. Find them helpful? Help yourself.

## Installation

### [CocoaPods](https://cocoapods.org)

1. Add (or create) a Podfile containing this:
```
use_frameworks!
pod 'APSwiftHelpers'
```

2. Run `pod install`.
3. Done!

## Usage

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

### NSLocale+Helpers
```swift
// Fetch region info from NSLocale:
NSLocale.currentLocale().countryCode // String e.g.: "US"
NSLocale.currentLocale().countryName // String e.g.: "United States"
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

// Returns true/false whether the app is running in DEBUG mode
App.isDebug
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
