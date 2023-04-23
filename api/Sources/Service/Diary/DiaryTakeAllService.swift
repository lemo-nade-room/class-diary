import Entity
import Repository

public struct DiaryTakeAllService {
    
    public var repository: DiaryAllTakable
    
    public init(_ repository: DiaryAllTakable) {
        self.repository = repository
    }
    
    public func all() async throws -> [Diary] {
        try await repository.all()
    }
}
