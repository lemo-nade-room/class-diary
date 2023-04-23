@testable import Presentation
import XCTest
import Entity

final class StudyTests: XCTestCase {
    
    func test_toJSON() {
        let entity = Entity.Study(
            授業時限: [.一時限目, .二時限目],
            科目: .init(科目名: "国語"),
            欠席者一覧: [.init(出席番号: 20, 氏名: "田中")],
            備考: "Hello"
        )
        
        let expected = Study(
            periods: [1, 2],
            subject: .init(name: "国語"),
            absentStudents: [.init(number: 20, name: "田中")],
            remark: "Hello"
        )
        let actual = entity.toJSON
        XCTAssertEqual(actual, expected)
    }
    
    func test_studies_toJSON() {
        let entities = [
            Entity.Study(
                授業時限: [.一時限目, .二時限目],
                科目: .init(科目名: "国語"),
                欠席者一覧: [.init(出席番号: 20, 氏名: "田中")],
                備考: "Hello"
            ),
            Entity.Study(
                授業時限: [.七時限目, .八時限目],
                科目: .init(科目名: "数学"),
                欠席者一覧: [.init(出席番号: 21, 氏名: "中田")],
                備考: "World"
            ),
        ]
        let expected = [
            Study(
                periods: [1, 2],
                subject: .init(name: "国語"),
                absentStudents: [.init(number: 20, name: "田中")],
                remark: "Hello"
            ),
            Study(
                periods: [7, 8],
                subject: .init(name: "数学"),
                absentStudents: [.init(number: 21, name: "中田")],
                remark: "World"
            ),
        ]
        let actual = entities.toJSON
        XCTAssertEqual(actual, expected)
    }
    
    func test_buildEntity() {
        let json = Study(
            periods: [1, 2],
            subject: .init(name: "国語"),
            absentStudents: [.init(number: 20, name: "田中")],
            remark: "Hello"
        )
        
        let expected = Entity.Study(
            授業時限: [.一時限目, .二時限目],
            科目: .init(科目名: "国語"),
            欠席者一覧: [.init(出席番号: 20, 氏名: "田中")],
            備考: "Hello"
        )
        let actual = json.entity
        XCTAssertEqual(actual, expected)
    }
    
    func test_buildEntities() {
        let jsons =  [
            Study(
                periods: [1, 2],
                subject: .init(name: "国語"),
                absentStudents: [.init(number: 20, name: "田中")],
                remark: "Hello"
            ),
            Study(
                periods: [7, 8],
                subject: .init(name: "数学"),
                absentStudents: [.init(number: 21, name: "中田")],
                remark: "World"
            ),
        ]
        let expected = [
            Entity.Study(
                授業時限: [.一時限目, .二時限目],
                科目: .init(科目名: "国語"),
                欠席者一覧: [.init(出席番号: 20, 氏名: "田中")],
                備考: "Hello"
            ),
            Entity.Study(
                授業時限: [.七時限目, .八時限目],
                科目: .init(科目名: "数学"),
                欠席者一覧: [.init(出席番号: 21, 氏名: "中田")],
                備考: "World"
            ),
        ]
        let actual = jsons.entities
        XCTAssertEqual(actual, expected)
    }
}
