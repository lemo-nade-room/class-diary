import Fluent

let seeders: [any Seedable] = [
    Diary.Seeder(),
    Student.Seeder(),
    Subject.Seeder(),
    Study.Seeder(),
    Research.Seeder(),
    StudyStudent.Seeder(),
    DiaryStudent.Seeder(),
    DiaryResearch.Seeder(),
]

func seed(on db: Database) async throws {
    for seeder in seeders {
        try await seeder.seed(on: db)
    }
}

func revert(on db: Database) async throws {
    for seeder in seeders.reversed() {
        try await seeder.revert(on: db)
    }
}
