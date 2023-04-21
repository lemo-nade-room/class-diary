@testable import Entity
import XCTest

final class StudyTests: XCTestCase {
    
    func test初期化() {
        let study = Study(
            [.一時限目, .二時限目],
            .init("数学"),
            [.init(20, "田中"), .init(22, "中田")],
            "特に何もなかった"
        )
        
        XCTAssertEqual(study.授業時限, [.一時限目, .二時限目])
        XCTAssertEqual(study.科目, .init("数学"))
        XCTAssertEqual(study.欠席者一覧, [.init(20, "田中"), .init(22, "中田")])
        XCTAssertEqual(study.備考, "特に何もなかった")
    }
    
    
}
