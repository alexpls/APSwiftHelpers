//
//  DebugLogging.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 19/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

/**
 Prints a log message prefixed by the debugDescription of the passed in item.

 Note: passed in item must comply to CustomDebugStringConvertible and provide
 a debugDescription.

 *Example usage:*
 ```
 debugLog(movie, "fetching poster from server")
 ```

 - Parameter item:      The CustomDebugStringConvertible item
 - Parameter message:   The additional message to suffix the debugDescription of `item`
*/
public func debugLog<T: CustomDebugStringConvertible>(item: T, message: String) {
    print(debugLogFormatMessage(item, message: message))
}

// swiftlint:disable:next line_length
internal func debugLogFormatMessage<T: CustomDebugStringConvertible>(item: T, message: String) -> String {
    return "(\(item.debugDescription)) \(message)"
}
