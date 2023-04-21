import Foundation
import Fluent
import Entity

extension Research {
    struct Seeder: Seedable {

        typealias Model = Research

        static let ids = [UUID(), UUID(), UUID()]

        var models: [Model] {
            [
                .init(Self.ids[0], "研究室A"),
                .init(Self.ids[1], "研究室B"),
                .init(Self.ids[2], "研究室C"),
            ]
        }

        func seed(on db: Database) async throws {
            try await models.create(on: db)
        }

        func revert(on db: Database) async throws {
            try await Model.query(on: db).delete()
        }
        
        static let `default` = [
            Entity.Research("研究室A"),
            Entity.Research("研究室B"),
            Entity.Research("研究室C"),
        ]
    }
}
