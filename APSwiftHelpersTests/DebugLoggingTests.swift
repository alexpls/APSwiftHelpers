import XCTest

class DebugLoggingTests: XCTestCase {

    func testDebugLogFormat() {
        let printable = Printable()
        let formatted = debugLogFormatMessage(printable, message: "Let's go")
        XCTAssertEqual(formatted, "(Hey!) Let's go")
    }

}
