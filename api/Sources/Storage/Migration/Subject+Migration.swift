import Fluent

extension Subject {
    struct Migration: AsyncMigration {
        
        static let schema = "subjects"
        
        func prepare(on database: Database) async throws {
            try await database.schema(Self.schema)
                .id()
                .field("name", .string, .required)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .unique(on: "name")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(Self.schema).delete()
        }
    }
}
