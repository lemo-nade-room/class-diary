import Entity
import Repository

public struct DiaryCreateService {
    
    public var repository: DiaryCreatable
    
    public init(_ repository: DiaryCreatable) {
        self.repository = repository
    }
    
    public func create(_ 日誌: Diary) async throws {
        try await repository.create(日誌)
    }
}
