@testable import Storage
import Entity
import XCTest

final class DiaryTest: XCTestCase {
    
    func test_ModelをEntityに変換() {
        let date1 = Date.now
        let date2 = Date.now
        
        let model = Diary(UUID(), date1, .晴れ, "運動会", date2, "検尿")
        
        let 国語の授業 = Study(UUID(), UUID(), UUID(), [1, 2], "漢字テスト")
        国語の授業.$科目.value = .init(UUID() , "国語")
        国語の授業.$欠課学生.value = [.init(UUID(), 1, "赤井"), .init(UUID(), 2, "青木")]
        let 数学の授業 = Study(UUID(), UUID(), UUID(), [3, 4], "複素数")
        数学の授業.$科目.value = .init(UUID(), "数学")
        let 理科の授業 = Study(UUID(), UUID(), UUID(), [5, 6], "")
        理科の授業.$科目.value = .init(UUID(), "理科")
        
        model.$授業.value = [国語の授業, 数学の授業, 理科の授業]
        
        model.$担当者.value = [.init(UUID(), 20, "田中"), .init(UUID(), 22, "中田")]
        
        model.$清掃担当研究室.value = [.init(UUID(), "先生1"), .init(UUID(), "先生2")]
        
        let expected = Entity.Diary(
            date1,
            .晴れ,
            [.init(20, "田中"), .init(22, "中田")],
            [
                .init([.一時限目, .二時限目], .init("国語"), [.init(1, "赤井"), .init(2, "青木")], "漢字テスト"),
                .init([.三時限目, .四時限目], .init("数学"), [], "複素数"),
                .init([.五時限目, .六時限目], .init("理科"), [], ""),
            ],
            "運動会",
            [.init("先生1"), .init("先生2")],
            date2,
            "検尿"
        )
        let actual = model.entity
        
        XCTAssertEqual(actual, expected)
    }
}

