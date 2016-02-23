//
//  App.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 22/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import Foundation

/**
 Contains values about the currently running application. This struct should not
 need to be initialized directly.
*/
public struct App {
    /// Specifies whether the app is running within the iPhone
    /// simulator or not.
    public static var inSimulator: Bool {
        return (TARGET_IPHONE_SIMULATOR != 0)
    }
}
