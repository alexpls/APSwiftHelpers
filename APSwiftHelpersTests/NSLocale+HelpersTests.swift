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
