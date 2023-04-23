@testable import Entity
import XCTest

final class StudyTests: XCTestCase {
    
    func test初期化() {
        let study = Study(
            授業時限: [.一時限目, .二時限目],
            科目: .init(科目名: "数学"),
            欠席者一覧: [
                .init(出席番号: 20, 氏名: "田中"),
                .init(出席番号: 22, 氏名: "中田"),
            ],
            備考: "特に何もなかった"
        )
        
        XCTAssertEqual(study.授業時限, [.一時限目, .二時限目])
        XCTAssertEqual(study.科目, .init(科目名: "数学"))
        XCTAssertEqual(study.欠席者一覧, [
            .init(出席番号: 20, 氏名: "田中"),
            .init(出席番号: 22, 氏名: "中田"),
        ])
        XCTAssertEqual(study.備考, "特に何もなかった")
    }
    
    
}
