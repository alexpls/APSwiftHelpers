//
//  DebugLogging.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 19/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

/// Prints a formatted debug message
public func debugLog<T: CustomDebugStringConvertible>(item: T, message: String) {
    print(debugLogFormatMessage(item, message: message))
}

internal func debugLogFormatMessage<T: CustomDebugStringConvertible>(item: T, message: String) -> String {
    return "(\(item.debugDescription)) \(message)"
}
