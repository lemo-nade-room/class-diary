import Foundation
import Fluent
import Entity

struct DiaryUpdateRepository {
    
    var db: Database
    
    func update(_ 日誌: Entity.Diary) async throws {
        try await db.transaction { transaction in
            try await DiaryDeleteRepository(db: transaction).delete(日誌.日付)
            try await DiaryCreateRepository(db: transaction).create(日誌)
        }
    }
}
