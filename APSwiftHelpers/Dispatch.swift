//
//  Dispatch.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 20/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import Foundation

/**
 Perform a block on the specified queue. This is just a nicer wrapper around the dispatch_async()
 Grand Central Dispatch function.

 - Parameter queueType:  The queue to execute the block on
 - Parameter closure:    The block to execute

 *Example usage:*
 ```
 performOn(.Main) { self.tableView.reloadData() }
 ```
*/
public func performOn(queueType: QueueType, closure: () -> Void) {
    dispatch_async(queueType.queue, closure)
}

/**
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
*/
public func delay(delay: NSTimeInterval, queueType: QueueType = .Main, closure: () -> Void) {
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(time, queueType.queue, closure)
}

/**
 A wrapper around GCD queues. This shouldn't be accessed directly, but rather through
 the helper functions supplied by the APSwiftHelpers package.
*/
public enum QueueType {
    case Main
    case Background
    case LowPriority
    case HighPriority

    var queue: dispatch_queue_t {
        switch self {
        case .Main:
            return dispatch_get_main_queue()
        case .Background:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        case .LowPriority:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
        case .HighPriority:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
        }
    }
}
