import Entity
import Repository

public struct DiaryUpdateService {
    
    public var repository: DiaryUpdatable
    
    public init(_ repository: DiaryUpdatable) {
        self.repository = repository
    }
    
    public func update(_ 日誌: Diary) async throws {
        try await repository.update(日誌)
    }
}
