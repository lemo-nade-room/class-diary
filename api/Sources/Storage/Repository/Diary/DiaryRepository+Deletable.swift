import Foundation
import Fluent
import Repository
import Entity

extension DiaryRepository: DiaryDeletable {
    
    public func delete(_ 日付: Date) async throws {
        try await delete(日付, on: db)
    }
    
    func delete(_ 日付: Date, on db: Database) async throws {
        guard let 日誌モデル = try await find日誌モデル(日付, on: db) else {
            throw NSError(domain: "日誌が見つからなかった", code: 404)
        }
        let 授業モデル = try await self.授業モデル(日誌モデル.requireID(), on: db)
        
        try await db.transaction { transaction in
            try await delete清掃担当研究室(日誌モデル.requireID(), on: transaction)
            try await delete日直者(日誌モデル.requireID(), on: transaction)
            try await delete欠課学生(授業モデル, on: transaction)
            try await delete授業(日誌モデル.requireID(), on: transaction)
            try await 日誌モデル.delete(on: transaction)
        }
    }
    
    fileprivate func find日誌モデル(_ 日付: Date, on db: Database) async throws -> Diary? {
        try await Diary.query(on: db)
            .filter(\.$datetime == 日付)
            .first()
    }
    
    fileprivate func 授業モデル(_ 日誌ID: Diary.IDValue, on db: Database) async throws -> [Study] {
        try await Study.query(on: db)
            .filter(\.$日誌.$id == 日誌ID)
            .all()
    }
    
    fileprivate func delete清掃担当研究室(_ 日誌ID: Diary.IDValue, on db: Database) async throws {
        try await DiaryResearch.query(on: db)
            .filter(\.$diary.$id == 日誌ID)
            .delete()
    }
    
    fileprivate func delete日直者(_ 日誌ID: Diary.IDValue, on db: Database) async throws {
        try await DiaryStudent.query(on: db)
            .filter(\.$diary.$id == 日誌ID)
            .delete()
    }
    
    fileprivate func delete欠課学生(_ 授業: [Study], on db: Database) async throws {
        try await StudyStudent.query(on: db)
            .filter(\.$study.$id ~~ 授業.map({ try $0.requireID() }))
            .delete()
    }
    
    private func delete授業(_ 日誌ID: Diary.IDValue, on db: Database) async throws {
        try await Study.query(on: db)
            .filter(\.$日誌.$id == 日誌ID)
            .delete()
    }
    
}
