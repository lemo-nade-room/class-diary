import Fluent

extension StudyStudent {
    struct Migration: AsyncMigration {
        
        static let schema = "study+student"
        
        func prepare(on database: Database) async throws {
            try await database.schema(Self.schema)
                .id()
                .field("study_id", .uuid, .required, .references("studies", "id"))
                .field("student_id", .uuid, .required, .references("students", "id"))
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .unique(on: "study_id", "student_id")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(Self.schema).delete()
        }
    }
}
