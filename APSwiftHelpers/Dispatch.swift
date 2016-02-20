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
public func performOn(queueType: QueueType, closure: () -> ()) {
    dispatch_async(queueType.queue, closure)
}

/// Queues which we can perform blocks on through Grand Central Dispatch. 
/// This shouldn't need to be accessed directly, but rather through 
/// performOn(queueType: QueueType, closure: () -> ()).
public enum QueueType {
    case Main
    case Background
    
    var queue: dispatch_queue_t {
        switch self {
        case .Main:
            return dispatch_get_main_queue()
        case .Background:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        }
    }
}
