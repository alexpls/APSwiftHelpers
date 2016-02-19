//
//  APSwiftHelpersTests.swift
//  APSwiftHelpersTests
//
//  Created by Alex Plescan on 19/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import XCTest

class APSwiftHelpersTests: XCTestCase {

    func testDebugLogFormat() {
        let printable = Printable()
        let formatted = debugLogFormatMessage(printable, message: "Let's go")
        XCTAssertEqual(formatted, "(Hey!) Let's go")
    }
    
}
