@testable import Presentation
import XCTest
import Entity

final class ResearchTests: XCTestCase {
    
    func test_toJSON() {
        let entity = Entity.Research(指導教員名: "田中")
        
        let expected = Research(teacher: "田中")
        let actual = entity.toJSON
        XCTAssertEqual(actual, expected)
    }
    
    func test_researches_toJSON() {
        let entities = [
            Entity.Research(指導教員名: "田中"),
            Entity.Research(指導教員名: "中田"),
        ]
        
        let expected = [
            Research(teacher: "田中"),
            Research(teacher: "中田"),
        ]
        let actual = entities.toJSON
        XCTAssertEqual(actual, expected)
    }
    
    func test_buildEntity() {
        let json = Research(teacher: "中田")
        
        let expected =  Entity.Research(指導教員名: "中田")
        let actual = json.entity
        XCTAssertEqual(actual, expected)
    }
    
    func test_buildEntities() {
        let jsons = [
            Research(teacher: "田中"),
            Research(teacher: "中田"),
        ]
        
        let expected = [
            Entity.Research(指導教員名: "田中"),
            Entity.Research(指導教員名: "中田"),
        ]
        
        let actual = jsons.entities
        XCTAssertEqual(actual, expected)
    }
}
