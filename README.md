## APSwiftHelpers

Common functions I've used while developing iOS apps in Swift. Find them helpful? Help yourself.

### Dispatch

#### `performOn(queueType: QueueType, closure: () -> ())`
Perform a block on the specified queue. This is just a nicer wrapper around the dispatch_async()
Grand Central Dispatch function.

- Parameter queueType:  The queue to execute the block on
- Parameter closure:    The block to execute

*Example usage:*
```
performOn(.Main) { self.tableView.reloadData() }
```

#### `delay(delay: NSTimeInterval, queueType: QueueType = .Main, closure: () -> ())`
Perform a block on a queue after waiting the specified time.

- Parameter delay:     Time to wait in seconds before performing the block
- Parameter queueType: Queue to execute the block on (default is the main queue)
- Parameter closure:   Block to execute after the time specified in delay has passed

*Example usage:*
```
// Wait for 200ms then run the block on the main queue
delay(0.2) { alert.hide() }

// Wait for 1s then run the block on a background queue
delay(1.0, queueType: .Background) { alert.hide() }
```

### DebugLogging

#### `debugLog<T: CustomDebugStringConvertible>(item: T, message: String)`
Prints a log message prefixed by the debugDescription of the passed in item.

Note: passed in item must comply to CustomDebugStringConvertible and provide  a debugDescription.

*Example usage:*
```
debugLog(movie, "fetching poster from server")
```

### App

#### App.inSimulator (Bool)
Specifies whether the app is running within the iPhone simulator or not.
