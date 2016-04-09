import XCTest

class AppTests: XCTestCase {

    var initialPlistProvier: PlistProvider?

    override func setUp() {
        super.setUp()
        initialPlistProvier = App.plistProvider
        App.plistProvider = PlistStub()
    }

    override func tearDown() {
        super.tearDown()
        if let provider = initialPlistProvier {
            App.plistProvider = provider
        }
    }

    func testKnowsWhenAppIsRunningInSimulator() {
        let inSim = App.inSimulator
        XCTAssertEqual(inSim, (TARGET_IPHONE_SIMULATOR == 1))
    }

    func testReturnsNameOfApplication() {
        if let name = App.name {
            XCTAssertEqual(name, "APSwiftHelpersTests")
        } else {
            XCTAssert(false, "expected to get name of application")
        }
    }

    func testReturnsVersionOfApplication() {
        if let version = App.version {
            XCTAssertEqual(version, "1.1")
        } else {
            XCTAssert(false, "expected to get version of application")
        }
    }

    func testReturnsFormattedNameAndVersionOfApplication() {
        if let formatted = App.formattedNameAndVersion {
            XCTAssertEqual(formatted, "APSwiftHelpersTests (1.1)")
        } else {
            XCTAssert(false, "expected to get formatted name and version")
        }
    }

}
