import Foundation
import Fluent

extension Study {
    struct Seeder: Seedable {

        typealias Model = Study

        static let ids = [UUID(), UUID(), UUID()]

        var models: [Model] {
            [
                .init(Self.ids[0], Diary.Seeder.ids[0], Subject.Seeder.ids[0], [1, 2], "漢字テスト"),
                .init(Self.ids[1], Diary.Seeder.ids[0], Subject.Seeder.ids[1], [3, 4], "数学テスト"),
                .init(Self.ids[2], Diary.Seeder.ids[1], Subject.Seeder.ids[2], [1, 2], "英語テスト"),
            ]
        }

        func seed(on db: Database) async throws {
            try await models.create(on: db)
        }

        func revert(on db: Database) async throws {
            try await Model.query(on: db).delete()
        }
    }
}
