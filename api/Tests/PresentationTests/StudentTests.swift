@testable import Presentation
import XCTest
import Entity

final class StudentTests: XCTestCase {
    
    func test_toJSON() {
        let entity = Entity.Student(出席番号: 20, 氏名: "田中")
        
        let expected = Student(number: 20, name: "田中")
        let actual = entity.toJSON
        XCTAssertEqual(actual, expected)
    }
    
    func test_students_toJSON() {
        let entities = [
            Entity.Student(出席番号: 20, 氏名: "田中"),
            Entity.Student(出席番号: 21, 氏名: "中田"),
        ]
        
        let expected = [
            Student(number: 20, name: "田中"),
            Student(number: 21, name: "中田"),
        ]
        let actual = entities.toJSON
        XCTAssertEqual(actual, expected)
    }
    
    func test_buildEntity() {
        let json = Student(number: 21, name: "中田")
        
        let expected = Entity.Student(出席番号: 21, 氏名: "中田")
        let actual = json.entity
        XCTAssertEqual(actual, expected)
    }
    
    func test_buildEntities() {
        let json = [
            Student(number: 20, name: "田中"),
            Student(number: 21, name: "中田"),
            ]
        
        let expected = [
            Entity.Student(出席番号: 20, 氏名: "田中"),
            Entity.Student(出席番号: 21, 氏名: "中田"),
        ]

        let actual = json.entities
        XCTAssertEqual(actual, expected)
    }
}
