@testable import Service
import Foundation
import XCTest
import Entity
import Repository

final class DiaryUpdateServiceTests: XCTestCase {
    
    func testUpdate() async throws {
        let mock = MockDiaryUpdatable()
        let service = DiaryUpdateService(mock)
        
        let diary = Diary(
            日付: Date(),
            天候: .曇り,
            日直者: [],
            授業: [],
            行時・その他: "雛祭",
            清掃担当研究室: [],
            清掃実施（予定日）: Date(),
            感想・連絡事項等: "体育が疲れた"
        )
        try await service.update(diary)
        
        let expected = diary
        let actual = mock.diary
        XCTAssertEqual(expected, actual)
    }
    
}

fileprivate final class MockDiaryUpdatable: DiaryUpdatable {
    var diary: Diary?
    func update(_ diary: Diary) async throws {
        self.diary = diary
    }
}
