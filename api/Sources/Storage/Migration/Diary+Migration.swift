import Fluent
import Entity

extension Diary {
    struct Migration: AsyncMigration {
        
        static let schema = "diaries"
        static let weatherSchema = "weather"
        
        func prepare(on database: Database) async throws {
            let weatherSchema = try await database.enum(Self.weatherSchema)
                .case("晴れ")
                .case("雨")
                .case("曇り")
                .case("雪")
                .create()
            
            try await database.schema(Self.schema)
                .id()
                .field("date", .date, .required)
                .field("datetime", .datetime, .required)
                .field("weather", weatherSchema, .required)
                .field("event_other", .string, .required)
                .field("clean_date", .date, .required)
                .field("thought_contact", .string, .required)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .unique(on: "date")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(Self.schema).delete()
            try await database.enum(Self.weatherSchema).delete()
        }
    }
}
