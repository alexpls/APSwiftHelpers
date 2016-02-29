//
//  NSLocale+HelpersTests.swift
//  APSwiftHelpers
//
//  Created by Alex Plescan on 29/02/2016.
//  Copyright © 2016 Alex Plescan. All rights reserved.
//

import XCTest

class NSLocaleHelpersTests: XCTestCase {

    private let usLocale = NSLocale(localeIdentifier: "en_US")

    func testGetLocaleCountryCode() {
        XCTAssertEqual(usLocale.countryCode, "US")
    }

    func testGetLocaleCountryName() {
        XCTAssertEqual(usLocale.countryName, "United States")
    }

}
