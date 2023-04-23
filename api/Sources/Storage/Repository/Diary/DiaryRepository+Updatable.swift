import Foundation
import Fluent
import Repository
import Entity

extension DiaryRepository: DiaryUpdatable {
    
    public func update(_ 日誌: Entity.Diary) async throws {
        try await db.transaction { transaction in
            try await delete(日誌.日付, on: transaction)
            try await create(日誌, on: transaction)
        }
    }
}
