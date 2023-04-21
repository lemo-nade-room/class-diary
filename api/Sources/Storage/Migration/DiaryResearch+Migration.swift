import Fluent

extension DiaryResearch {
    struct Migration: AsyncMigration {
        
        static let schema = "diary+research"
        
        func prepare(on database: Database) async throws {
            try await database.schema(Self.schema)
                .id()
                .field("diary_id", .uuid, .required, .references("diaries", "id"))
                .field("research_id", .uuid, .required, .references("researches", "id"))
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .unique(on: "diary_id", "research_id")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(Self.schema).delete()
        }
    }
}
