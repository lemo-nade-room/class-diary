@testable import Service
import Foundation
import XCTest
import Entity
import Repository

final class DiaryDeleteServiceTests: XCTestCase {
    
    func testDelete() async throws {
        let mock = MockDiaryDeletable()
        let service = DiaryDeleteService(mock)
        
        let date = Date()
        try await service.delete(date)
        
        let expected = date
        let actual = mock.date
        XCTAssertEqual(expected, actual)
    }
    
}

fileprivate final class MockDiaryDeletable: DiaryDeletable {
    var date: Date?
    func delete(_ date: Date) async throws {
        self.date = date
    }
}
