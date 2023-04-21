import Foundation
import Fluent
import Entity

extension Subject {
    struct Seeder: Seedable {

        typealias Model = Subject

        static let ids = [UUID(), UUID(), UUID()]

        var models: [Model] {
            [
                .init(Self.ids[0], "科目A"),
                .init(Self.ids[1], "科目B"),
                .init(Self.ids[2], "科目C"),
            ]
        }

        func seed(on db: Database) async throws {
            try await models.create(on: db)
        }

        func revert(on db: Database) async throws {
            try await Model.query(on: db).delete()
        }
        
        static let `default` = [
            Entity.Subject("科目A"),
            Entity.Subject("科目B"),
            Entity.Subject("科目C"),
        ]
    }
}
