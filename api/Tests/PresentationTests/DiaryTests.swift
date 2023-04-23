@testable import Presentation
import XCTest
import Entity

final class DiaryTests: XCTestCase {
    
    func test_toJSON() {
        let entity = Entity.Diary(
            日付: Date(timeIntervalSince1970: 0),
            天候: .晴れ,
            日直者: [.init(出席番号: 20, 氏名: "田中")],
            授業: [.init(
                授業時限: [.一時限目],
                科目: .init(科目名: "国語"),
                欠席者一覧: [.init(出席番号: 1, 氏名: "青木")],
                備考: "こんにちは"
            )],
            行時・その他: "特になし",
            清掃担当研究室: [.init(指導教員名: "おはぎ")],
            清掃実施（予定日）: Date(timeIntervalSince1970: 1),
            感想・連絡事項等: "なし"
        )
        
        let expected = Diary(
            date: Date(timeIntervalSince1970: 0),
            weather: .晴れ,
            responsibleStudents: [.init(number: 20, name: "田中")],
            studies: [.init(
                periods: [1],
                subject: .init(name: "国語"),
                absentStudents: [.init(number: 1, name: "青木")],
                remark: "こんにちは"
            )],
            eventOrOther: "特になし",
            cleanResponsibleReasearches: [.init(teacher: "おはぎ")],
            cleanDate: Date(timeIntervalSince1970: 1),
            impressionOrContact: "なし"
        )
        let actual = entity.toJSON
        XCTAssertEqual(actual, expected)
    }
    
    func test_diaries_toJSON() {
        let entity = [
            Entity.Diary(
                日付: Date(timeIntervalSince1970: 0),
                天候: .晴れ,
                日直者: [.init(出席番号: 20, 氏名: "田中")],
                授業: [.init(
                    授業時限: [.一時限目],
                    科目: .init(科目名: "国語"),
                    欠席者一覧: [.init(出席番号: 1, 氏名: "青木")],
                    備考: "こんにちは"
                )],
                行時・その他: "特になし",
                清掃担当研究室: [.init(指導教員名: "おはぎ")],
                清掃実施（予定日）: Date(timeIntervalSince1970: 1),
                感想・連絡事項等: "なし"
            ),
            Entity.Diary(
                日付: Date(timeIntervalSince1970: 2),
                天候: .晴れ,
                日直者: [.init(出席番号: 21, 氏名: "中田")],
                授業: [.init(
                    授業時限: [.七時限目],
                    科目: .init(科目名: "数学"),
                    欠席者一覧: [.init(出席番号: 2, 氏名: "石野")],
                    備考: "おはよう"
                )],
                行時・その他: "スポーツ大会",
                清掃担当研究室: [.init(指導教員名: "まんじゅう")],
                清掃実施（予定日）: Date(timeIntervalSince1970: 4),
                感想・連絡事項等: "眠かった"
            ),
        ]
        
        let expected = [
            Diary(
                date: Date(timeIntervalSince1970: 0),
                weather: .晴れ,
                responsibleStudents: [.init(number: 20, name: "田中")],
                studies: [.init(
                    periods: [1],
                    subject: .init(name: "国語"),
                    absentStudents: [.init(number: 1, name: "青木")],
                    remark: "こんにちは"
                )],
                eventOrOther: "特になし",
                cleanResponsibleReasearches: [.init(teacher: "おはぎ")],
                cleanDate: Date(timeIntervalSince1970: 1),
                impressionOrContact: "なし"
            ),
            Diary(
                date: Date(timeIntervalSince1970: 2),
                weather: .晴れ,
                responsibleStudents: [.init(number: 21, name: "中田")],
                studies: [.init(
                    periods: [7],
                    subject: .init(name: "数学"),
                    absentStudents: [.init(number: 2, name: "石野")],
                    remark: "おはよう"
                )],
                eventOrOther: "スポーツ大会",
                cleanResponsibleReasearches: [.init(teacher: "まんじゅう")],
                cleanDate: Date(timeIntervalSince1970: 4),
                impressionOrContact: "眠かった"
            ),
        ]
        let actual = entity.toJSON
        XCTAssertEqual(actual, expected)
    }
    
    
    func test_buildEntity() {
        let json = Diary(
            date: Date(timeIntervalSince1970: 0),
            weather: .晴れ,
            responsibleStudents: [.init(number: 20, name: "田中")],
            studies: [.init(
                periods: [1],
                subject: .init(name: "国語"),
                absentStudents: [.init(number: 1, name: "青木")],
                remark: "こんにちは"
            )],
            eventOrOther: "特になし",
            cleanResponsibleReasearches: [.init(teacher: "おはぎ")],
            cleanDate: Date(timeIntervalSince1970: 1),
            impressionOrContact: "なし"
        )
        
        let expected = Entity.Diary(
            日付: Date(timeIntervalSince1970: 0),
            天候: .晴れ,
            日直者: [.init(出席番号: 20, 氏名: "田中")],
            授業: [.init(
                授業時限: [.一時限目],
                科目: .init(科目名: "国語"),
                欠席者一覧: [.init(出席番号: 1, 氏名: "青木")],
                備考: "こんにちは"
            )],
            行時・その他: "特になし",
            清掃担当研究室: [.init(指導教員名: "おはぎ")],
            清掃実施（予定日）: Date(timeIntervalSince1970: 1),
            感想・連絡事項等: "なし"
        )
        let actual = json.entity
        XCTAssertEqual(actual, expected)
    }
    
    //    func test_buildEntities() {
    //        let jsons =  [
    //            Study(
    //                periods: [1, 2],
    //                subject: .init(name: "国語"),
    //                absentStudents: [.init(number: 20, name: "田中")],
    //                remark: "Hello"
    //            ),
    //            Study(
    //                periods: [7, 8],
    //                subject: .init(name: "数学"),
    //                absentStudents: [.init(number: 21, name: "中田")],
    //                remark: "World"
    //            ),
    //        ]
    //        let expected = [
    //            Entity.Study(
    //                授業時限: [.一時限目, .二時限目],
    //                科目: .init(科目名: "国語"),
    //                欠席者一覧: [.init(出席番号: 20, 氏名: "田中")],
    //                備考: "Hello"
    //            ),
    //            Entity.Study(
    //                授業時限: [.七時限目, .八時限目],
    //                科目: .init(科目名: "数学"),
    //                欠席者一覧: [.init(出席番号: 21, 氏名: "中田")],
    //                備考: "World"
    //            ),
    //        ]
    //        let actual = jsons.entities
    //        XCTAssertEqual(actual, expected)
    //    }
}
