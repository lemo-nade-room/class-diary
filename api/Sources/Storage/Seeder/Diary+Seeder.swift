import Foundation
import Fluent
import Entity

extension Diary {
    struct Seeder: Seedable {
        
        typealias Model = Diary
        
        static let ids = [UUID(), UUID(), UUID()]
        
        var models: [Model] {
            [
                .init(
                    Self.ids[0],
                    Date.init(timeIntervalSince1970: 0),
                    .晴れ,
                    "特になし",
                    .init(timeIntervalSince1970: 3 * 24 * 60 * 60),
                    "寒かった"
                ),
                .init(
                    Self.ids[1],
                    Date.init(timeIntervalSince1970: 24 * 60 * 60),
                    .雨,
                    "体育大会",
                    Date.init(timeIntervalSince1970: 3 * 24 * 60 * 60),
                    "少し寒かった"
                ),
                .init(
                    Self.ids[2],
                    Date.init(timeIntervalSince1970: 2 * 24 * 60 * 60),
                    .雪,
                    "高専祭",
                    Date.init(timeIntervalSince1970: 3 * 24 * 60 * 60),
                    "超寒かった"
                ),
            ]
        }
        
        func seed(on db: Database) async throws {
            try await models.create(on: db)
        }
        
        func revert(on db: Database) async throws {
            try await Model.query(on: db).delete()
        }
        
        static let `default`: [Entity.Diary] = [
            Entity.Diary(
                日付: Date(timeIntervalSince1970: 0),
                天候: .晴れ,
                日直者: Array(Student.Seeder.default[0...1]),
                授業: [
                    .init(
                        授業時限: [.一時限目, .二時限目],
                        科目: Subject.Seeder.default[0],
                        欠席者一覧: [.init(出席番号: 1, 氏名: "学生A"), .init(出席番号: 2, 氏名: "学生B")],
                        備考: "漢字テスト"
                    ),
                    Entity.Study(
                        授業時限: [.三時限目, .四時限目],
                        科目: Subject.Seeder.default[1],
                        欠席者一覧: [.init(出席番号: 3, 氏名: "学生C")],
                        備考: "数学テスト"
                    )
                ],
                行時・その他: "特になし",
                清掃担当研究室: Array(Research.Seeder.default[0...1]),
                清掃実施（予定日）: Date(timeIntervalSince1970: 3 * 24 * 60 * 60),
                感想・連絡事項等: "寒かった"
            ),
            Entity.Diary(
                日付: Date(timeIntervalSince1970: 1 * 24 * 60 * 60),
                天候: .雨,
                日直者: [Student.Seeder.default[2]],
                授業: [
                    .init(
                        授業時限: [.一時限目, .二時限目],
                        科目: Subject.Seeder.default[2],
                        欠席者一覧: [],
                        備考: "英語テスト"
                    )
                ],
                行時・その他: "体育大会",
                清掃担当研究室: [Research.Seeder.default[2]],
                清掃実施（予定日）: Date(timeIntervalSince1970: 3 * 24 * 60 * 60),
                感想・連絡事項等: "少し寒かった"
            ),
            Entity.Diary(
                日付: Date(timeIntervalSince1970: 2 * 24 * 60 * 60),
                天候: .雪,
                日直者: [],
                授業: [],
                行時・その他: "高専祭",
                清掃担当研究室: [],
                清掃実施（予定日）: Date(timeIntervalSince1970: 3 * 24 * 60 * 60),
                感想・連絡事項等: "超寒かった"
            )
        ]
    }
}
