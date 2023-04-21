import Fluent

extension Study {
    struct Migration: AsyncMigration {
        
        static let schema = "studies"
        
        func prepare(on database: Database) async throws {
            try await database.schema(Self.schema)
                .id()
                .field("diary_id", .uuid, .required, .references("diaries", "id"))
                .field("subject_id", .uuid, .required, .references("subjects", "id"))
                .field("periods", .array(of: .int), .required)
                .field("remark", .string, .required)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(Self.schema).delete()
        }
    }
}
