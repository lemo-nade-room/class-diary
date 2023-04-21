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
                Date(timeIntervalSince1970: 0),
                .晴れ,
                Array(Student.Seeder.default[0...1]),
                [
                    .init(
                        [.一時限目, .二時限目],
                        Subject.Seeder.default[0],
                        [.init(1, "学生A"), .init(2, "学生B")],
                        "漢字テスト"
                    ),
                    Entity.Study(
                        [.三時限目, .四時限目],
                        Subject.Seeder.default[1],
                        [.init(3, "学生C")],
                        "数学テスト"
                    )
                ],
                "特になし",
                Array(Research.Seeder.default[0...1]),
                Date(timeIntervalSince1970: 3 * 24 * 60 * 60),
                "寒かった"
            ),
            Entity.Diary(
                Date(timeIntervalSince1970: 1 * 24 * 60 * 60),
                .雨,
                [Student.Seeder.default[2]],
                [
                    .init(
                        [.一時限目, .二時限目],
                        Subject.Seeder.default[2],
                        [],
                        "英語テスト"
                    )
                ],
                "体育大会",
                [Research.Seeder.default[2]],
                Date(timeIntervalSince1970: 3 * 24 * 60 * 60),
                "少し寒かった"
            ),
            Entity.Diary(
                Date(timeIntervalSince1970: 2 * 24 * 60 * 60),
                .雪,
                [],
                [],
                "高専祭",
                [],
                Date(timeIntervalSince1970: 3 * 24 * 60 * 60),
                "超寒かった"
            )
        ]
    }
}
