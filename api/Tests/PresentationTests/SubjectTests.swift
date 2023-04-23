@testable import Presentation
import XCTest
import Entity

final class SubjectTests: XCTestCase {
    
    func test_toJSON() {
        let entity = Entity.Subject(科目名: "国語")
        
        let expected = Subject(name: "国語")
        let actual = entity.toJSON
        XCTAssertEqual(actual, expected)
    }
    
    func test_buildEntity() {
        let json = Subject(name: "数学")
        
        let expected = Entity.Subject(科目名: "数学")
        let actual = json.entity
        XCTAssertEqual(actual, expected)
    }
}
