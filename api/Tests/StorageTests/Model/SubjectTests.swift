@testable import Storage
import Entity
import XCTest

final class SubjectTest: XCTestCase {
    
    func test_ModelをEntityに変換() {
        let model = Subject(UUID(), "数学")
        
        let expected = Entity.Subject("数学")
        let actual = model.entity
        
        XCTAssertEqual(actual, expected)
    }
    
}
