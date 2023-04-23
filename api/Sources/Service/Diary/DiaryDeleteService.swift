import Foundation
import Entity
import Repository

public struct DiaryDeleteService {
    
    public var repository: DiaryDeletable
    
    public init(_ repository: DiaryDeletable) {
        self.repository = repository
    }
    
    public func delete(_ 日誌の日付: Date) async throws {
        try await repository.delete(日誌の日付)
    }
}
