import Foundation
import Fluent

extension DiaryResearch {
    struct Seeder: Seedable {

        typealias Model = DiaryResearch

        static let ids = [UUID(), UUID(), UUID()]

        var models: [Model] {
            [
                .init(Self.ids[0], Diary.Seeder.ids[0], Research.Seeder.ids[0]),
                .init(Self.ids[1], Diary.Seeder.ids[0], Research.Seeder.ids[1]),
                .init(Self.ids[2], Diary.Seeder.ids[1], Research.Seeder.ids[2]),
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
