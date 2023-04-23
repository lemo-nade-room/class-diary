@testable import Storage
import Entity
import App
import XCTVapor

final class DiaryUpdatableTests: XCTestCase {
    func testUpdate() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        try await revert(on: app.db)
        try await seed(on: app.db)
        
        let new = Entity.Diary(
            日付: Date(timeIntervalSince1970: 1 * 24 * 60 * 60),
            天候: .曇り,
            日直者: [Student.Seeder.default[0], Student.Seeder.default[2]],
            授業: [
                .init(
                    授業時限: [.七時限目, .八時限目],
                    科目: Subject.Seeder.default[2],
                    欠席者一覧: [Student.Seeder.default[1]],
                    備考: "来週テスト"
                ),
            ],
            行時・その他: "雛祭",
            清掃担当研究室: [Research.Seeder.default[1]],
            清掃実施（予定日）: Date(timeIntervalSince1970: 12 * 24 * 60 * 60),
            感想・連絡事項等: "体育が疲れた"
        )
        
        try await DiaryRepository(on: app.db).update(new)
        var expected = Diary.Seeder.default
        expected[1] = new
        let actual = try await DiaryRepository(on: app.db).all()
        XCTAssertEqual(actual, expected)
    }
}
