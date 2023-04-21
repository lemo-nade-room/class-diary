@testable import Entity
import XCTest

final class SubjectTests: XCTestCase {
    
    func test初期化() {
        let subject = Subject("国語")
        XCTAssertEqual(subject.科目名, "国語")
    }
    
}
