@testable import Storage
import Entity
import XCTest

final class StudyTests: XCTestCase {
    
    func test_ModelをEntityに変換() {
        let model = Study(UUID(), UUID(), UUID(), [1, 2], "漢字テスト")
        model.$科目.value = .init(UUID() , "国語")
        model.$欠課学生.value = [.init(UUID(), 1, "赤井"), .init(UUID(), 2, "青木")]
        
        let expected = Entity.Study([.一時限目, .二時限目], .init("国語"), [.init(1, "赤井"), .init(2, "青木")], "漢字テスト")
        let actual = model.entity
        
        XCTAssertEqual(actual, expected)
    }
}
