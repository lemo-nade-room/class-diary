import Foundation
import Fluent

extension DiaryStudent {
    struct Seeder: Seedable {

        typealias Model = DiaryStudent

        static let ids = [UUID(), UUID(), UUID()]

        var models: [Model] {
            [
                .init(Self.ids[0], Diary.Seeder.ids[0], Student.Seeder.ids[0]),
                .init(Self.ids[1], Diary.Seeder.ids[0], Student.Seeder.ids[1]),
                .init(Self.ids[2], Diary.Seeder.ids[1], Student.Seeder.ids[2]),
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
