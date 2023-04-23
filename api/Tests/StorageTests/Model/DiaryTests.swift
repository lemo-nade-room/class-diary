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
            日付: date1,
            天候: .晴れ,
            日直者: [.init(出席番号: 20, 氏名: "田中"), .init(出席番号: 22, 氏名: "中田")],
            授業: [
                .init(
                    授業時限: [.一時限目, .二時限目],
                    科目: .init(科目名: "国語"),
                    欠席者一覧: [.init(出席番号: 1, 氏名: "赤井"), .init(出席番号: 2, 氏名: "青木")],
                    備考: "漢字テスト"
                ),
                .init(
                    授業時限: [.三時限目, .四時限目],
                    科目: .init(科目名: "数学"),
                    欠席者一覧: [],
                    備考: "複素数"
                ),
                .init(
                    授業時限: [.五時限目, .六時限目],
                    科目: .init(科目名: "理科"),
                    欠席者一覧: [],
                    備考: ""
                ),
            ],
            行時・その他: "運動会",
            清掃担当研究室: [.init(指導教員名: "先生1"), .init(指導教員名: "先生2")],
            清掃実施（予定日）: date2,
            感想・連絡事項等: "検尿"
        )
        let actual = model.entity
        
        XCTAssertEqual(actual, expected)
    }
}

