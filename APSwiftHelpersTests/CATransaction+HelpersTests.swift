//
//  CATransaction+HelpersTests.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 27/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import XCTest

class CATransaction_HelpersTests: XCTestCase {

    func testExecutesBlockWithoutCAAnimation() {
        withCAAnimationsDisabled(true) {
            let val = CATransaction.valueForKey(kCATransactionDisableActions) as! CFBoolean
            XCTAssert(val == kCFBooleanTrue)
        }
    }
    
    func testExecutesBlockWithCAAnmiation() {
        withCAAnimationsDisabled(false) {
            let val = CATransaction.valueForKey(kCATransactionDisableActions) as! CFBoolean
            XCTAssert(val == kCFBooleanFalse)
        }
    }
    
    func testDefaultsToExecutingWithoutCAAnimation() {
        withCAAnimationsDisabled {
            let val = CATransaction.valueForKey(kCATransactionDisableActions) as! CFBoolean
            XCTAssert(val == kCFBooleanTrue)
        }
    }

}
