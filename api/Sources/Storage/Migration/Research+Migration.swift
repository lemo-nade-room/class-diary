import Fluent

extension Research {
    struct Migration: AsyncMigration {
        
        static let schema = "researches"
        
        func prepare(on database: Database) async throws {
            try await database.schema(Self.schema)
                .id()
                .field("teacher_name", .string, .required)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .unique(on: "teacher_name")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(Self.schema).delete()
        }
    }
}
