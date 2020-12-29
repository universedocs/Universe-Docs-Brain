import XCTest
@testable import UDocsDatabaseModel
import UDocsDatabaseUtility

final class UDocsDatabaseUtilityTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(UDocsDatabaseUtility().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
