import Foundation
import Fluent
import Entity

extension Student {
    struct Seeder: Seedable {

        typealias Model = Student

        static let ids = [UUID(), UUID(), UUID()]

        var models: [Model] {
            [
                .init(Self.ids[0], 1, "学生A"),
                .init(Self.ids[1], 2, "学生B"),
                .init(Self.ids[2], 3, "学生C"),
            ]
        }

        func seed(on db: Database) async throws {
            try await models.create(on: db)
        }

        func revert(on db: Database) async throws {
            try await Model.query(on: db).delete()
        }
        
        static let `default` = [
            Entity.Student(1, "学生A"),
            Entity.Student(2, "学生B"),
            Entity.Student(3, "学生C"),
        ]
    }
}
