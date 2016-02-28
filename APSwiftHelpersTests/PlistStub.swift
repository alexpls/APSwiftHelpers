//
//  PlistStub.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 28/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

struct PlistStub: PlistProvider {
    func objectForInfoDictionaryKey(key: String) -> AnyObject? {
        switch key {
        case "CFBundleDisplayName":
            return "APSwiftHelpersTests"
        case "CFBundleShortVersionString":
            return "1.1"
        default:
            return nil
        }
    }
}
