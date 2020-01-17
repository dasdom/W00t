import XCTest
@testable import W00t

final class W00tTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(W00t().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
