//
//  AppTests.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 22/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import XCTest

class AppTests: XCTestCase {

    func testKnowsWhenAppIsRunningInSimulator() {
        let inSim = App.inSimulator
        XCTAssertEqual(inSim, (TARGET_IPHONE_SIMULATOR == 1))
    }

}
