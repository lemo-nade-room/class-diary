@testable import Usecase
import XCTest

final class UserTests: XCTestCase {
    
    func test初期化() {
        let user = User("test@example.com")
        XCTAssertEqual(user.mailAddress, "test@example.com")
    }
}
