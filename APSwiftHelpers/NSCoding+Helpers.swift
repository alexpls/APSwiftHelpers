//
//  NSCoding+Helpers.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 25/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import Foundation

extension NSCoding {
    /**
     Archive this object to NSData using NSKeyedArchiver.
    */
    public func archive() -> NSData {
        return NSKeyedArchiver.archivedDataWithRootObject(self)
    }
    
    /**
     Create a new instance of this object from the archived data passed in.
     
     - Parameter data:  The data to unarchive (can be created using the `archive()` function)
    */
    public static func unarchive(data: NSData) -> Self? {
        return NSKeyedUnarchiver.unarchiveObjectWithData(data) as? Self
    }
}