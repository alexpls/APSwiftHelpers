//
//  DispatchTests.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 20/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import XCTest

class DispatchTests: XCTestCase {

    func testPerformBlockOnMainThread() {
        let expectation = expectationWithDescription("run on main thread")

        performOn(.Main) {
            XCTAssert(NSThread.isMainThread(), "should be on main thread")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0, handler: nil)
    }
    
    func testPerformBlockOnBackgroundThread() {
        let expectation = expectationWithDescription("run off main thread")
        
        performOn(.Background) {
            XCTAssert(!NSThread.isMainThread(), "should not be on main thread")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0, handler: nil)
    }

}
