@testable import Storage
import Entity
import App
import XCTVapor

final class DiaryCreateRepositoryTests: XCTestCase {
    func testCreate() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        try await revert(on: app.db)
        try await seed(on: app.db)
        
        let new = Entity.Diary(
            Date(timeIntervalSince1970: 10 * 24 * 60 * 60),
            .曇り,
            [Student.Seeder.default[0], Student.Seeder.default[2]],
            [
                .init(
                    [.七時限目, .八時限目],
                    Subject.Seeder.default[2],
                    [Student.Seeder.default[1]],
                    "来週テスト"
                ),
            ],
            "雛祭",
            [Research.Seeder.default[1]],
            Date(timeIntervalSince1970: 12 * 24 * 60 * 60),
            "体育が疲れた"
        )
        
        try await DiaryCreateRepository(db: app.db).create(new)
        let actual = try await DiaryAllRepository(db: app.db).all()
        XCTAssertEqual(actual, Diary.Seeder.default + [new])
    }
}
