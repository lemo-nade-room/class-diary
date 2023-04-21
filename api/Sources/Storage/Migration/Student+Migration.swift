import Fluent

extension Student {
    struct Migration: AsyncMigration {
        
        static let schema = "students"
        
        func prepare(on database: Database) async throws {
            try await database.schema(Self.schema)
                .id()
                .field("number", .int, .required)
                .field("name", .string, .required)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .unique(on: "number")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(Self.schema).delete()
        }
    }
}
