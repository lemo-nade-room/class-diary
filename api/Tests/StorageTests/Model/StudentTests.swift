@testable import Storage
import Entity
import XCTest

final class StudentTests: XCTestCase {
    
    func test_ModelをEntityに変換() {
        let model = Student(UUID(), 20, "田中")
        
        let expected = Entity.Student(20, "田中")
        let actual = model.entity
        
        XCTAssertEqual(actual, expected)
    }
}
