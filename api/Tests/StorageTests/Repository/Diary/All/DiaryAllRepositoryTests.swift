@testable import Storage
import Entity
import App
import XCTVapor

final class DiaryAllRepositoryTests: XCTestCase {
    func testAll() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        try await revert(on: app.db)
        try await seed(on: app.db)
        
        let actual = try await DiaryAllRepository(db: app.db).all()
        XCTAssertEqual(actual, Diary.Seeder.default)
    }
}
