import Fluent

extension DiaryStudent {
    struct Migration: AsyncMigration {
        
        static let schema = "diary+student"
        
        func prepare(on database: Database) async throws {
            try await database.schema(Self.schema)
                .id()
                .field("diary_id", .uuid, .required, .references("diaries", "id"))
                .field("student_id", .uuid, .required, .references("students", "id"))
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .unique(on: "created_at", "updated_at")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(Self.schema).delete()
        }
    }
}
