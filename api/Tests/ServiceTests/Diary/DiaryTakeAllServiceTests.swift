@testable import Service
import Foundation
import XCTest
import Entity
import Repository

final class DiaryServiceTakeAllTests: XCTestCase {
    
    func testTakeAll() async throws {
        let diaries = [Diary(
            日付: Date(),
            天候: .曇り,
            日直者: [],
            授業: [],
            行時・その他: "雛祭",
            清掃担当研究室: [],
            清掃実施（予定日）: Date(),
            感想・連絡事項等: "体育が疲れた"
        )]
        let mock = MockDiaryAllTakable(diaries: diaries)
        let service = DiaryTakeAllService(mock)
        
        let expected = diaries
        let actual = try await service.all()
        XCTAssertEqual(expected, actual)
    }
    
}

fileprivate struct MockDiaryAllTakable: DiaryAllTakable {
    var diaries: [Diary]
    func all() async throws -> [Diary] {
        diaries
    }
}
