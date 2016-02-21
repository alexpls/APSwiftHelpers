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
    
    func testDelayPerformsBlockOnMainThreadByDefault() {
        let expectation = expectationWithDescription("run on main thread")
        delay(0.1) {
            XCTAssert(NSThread.isMainThread(), "should be on main thread")
            expectation.fulfill()
        }
        waitForExpectationsWithTimeout(1.0, handler: nil)
    }
    
    func testDelayPerformsBlockOffMainThread() {
        let expectation = expectationWithDescription("run off main thread")
        delay(0.1, queueType: .Background) {
            XCTAssert(!NSThread.isMainThread(), "should be off main thread")
            expectation.fulfill()
        }
        waitForExpectationsWithTimeout(1, handler: nil)
    }
    
    func testDelayPerformsBlockAfterSpecifiedInterval() {
        let expectation = expectationWithDescription("perform block after specified interaval")
        
        let delayTime = 0.2
        let timeBeforeDelay = NSDate()
        
        delay(delayTime) {
            let timeAfterDelay = NSDate()
            let timeDiff = abs(timeAfterDelay.timeIntervalSinceDate(timeBeforeDelay))
            XCTAssert((timeDiff - delayTime) < 0.1, "should wait the specified amount of time before performing a block")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1, handler: nil)
    }

}
