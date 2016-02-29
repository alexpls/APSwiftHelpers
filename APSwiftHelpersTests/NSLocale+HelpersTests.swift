//
//  NSLocale+HelpersTests.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 29/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import XCTest

class NSLocale_HelpersTests: XCTestCase {

    private let USLocale = NSLocale(localeIdentifier: "en_US")
    
    func testGetLocaleCountryCode() {
        XCTAssertEqual(USLocale.countryCode, "US")
    }
    
    func testGetLocaleCountryName() {
        XCTAssertEqual(USLocale.countryName, "United States")
    }

}
