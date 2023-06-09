@testable import Storage
import Entity
import App
import XCTVapor

final class DiaryDeletableTests: XCTestCase {
    func testDelete() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        try await revert(on: app.db)
        try await seed(on: app.db)
        
        try await DiaryRepository(on: app.db).delete(Date(timeIntervalSince1970: 0))
        let actual = try await DiaryRepository(on: app.db).all()
        XCTAssertEqual(actual, Array(Diary.Seeder.default[1...2]))
    }
}
