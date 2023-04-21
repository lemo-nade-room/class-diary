import Foundation
import Entity

public protocol DiaryRepository {
    
    func all() async throws -> [Diary]
    
    func create(_ diary: Diary) async throws
    
    func update(_ diary: Diary) async throws
    
    func delete(_ date: Date) async throws
}
