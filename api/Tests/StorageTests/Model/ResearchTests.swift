@testable import Storage
import Entity
import XCTest

final class ResearchTest: XCTestCase {
    
    func test_ModelをEntityに変換() {
        let model = Research(UUID(), "田中")
        
        let expected = Entity.Research(指導教員名: "田中")
        let actual = model.entity
        
        XCTAssertEqual(actual, expected)
    }
}

