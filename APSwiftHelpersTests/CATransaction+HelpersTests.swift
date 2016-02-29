//
//  CATransaction+HelpersTests.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 27/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import XCTest

class CATransactionHelpersTests: XCTestCase {

    func testExecutesBlockWithoutCAAnimation() {
        withCAAnimationsDisabled(true) {
            // swiftlint:disable:next force_cast
            let val = CATransaction.valueForKey(kCATransactionDisableActions) as! CFBoolean
            XCTAssert(val == kCFBooleanTrue)
        }
    }

    func testExecutesBlockWithCAAnmiation() {
        withCAAnimationsDisabled(false) {
            // swiftlint:disable:next force_cast
            let val = CATransaction.valueForKey(kCATransactionDisableActions) as! CFBoolean
            XCTAssert(val == kCFBooleanFalse)
        }
    }

    func testDefaultsToExecutingWithoutCAAnimation() {
        withCAAnimationsDisabled {
            // swiftlint:disable:next force_cast
            let val = CATransaction.valueForKey(kCATransactionDisableActions) as! CFBoolean
            XCTAssert(val == kCFBooleanTrue)
        }
    }

}
