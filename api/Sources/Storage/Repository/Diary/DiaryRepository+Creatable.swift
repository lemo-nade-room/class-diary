import Foundation
import Fluent
import Repository
import Entity

extension DiaryRepository: DiaryCreatable {
    
    public func create(_ 日誌: Entity.Diary) async throws {
        try await create(日誌, on: db)
    }
    
    func create(_ 日誌: Entity.Diary, on db: Database) async throws {
        let 全学生モデル = try await Student.query(on: db).all()
        let 全科目モデル = try await Subject.query(on: db).all()
        let 全研究室モデル = try await Research.query(on: db).all()
        
        let 日誌モデル = self.日誌モデル(日誌)
        let 清掃担当研究室一覧モデル = try self.清掃担当研究室モデル(日誌モデル.requireID(), 日誌.清掃担当研究室, 全研究室モデル)
        let 日直者一覧モデル = try self.日直者一覧モデル(日誌モデル.requireID(), 日誌.日直者, 全学生モデル)
        let 授業・欠課学生モデル = try self.授業・欠課学生モデル(
            日誌モデル.requireID(),
            日誌.授業,
            全学生モデル,
            全科目モデル
        )
        let 授業一覧モデル = 授業・欠課学生モデル.map({ $0.授業 })
        let 欠課学生一覧モデル = 授業・欠課学生モデル.flatMap({ $0.欠課学生一覧 })
        
        try await db.transaction { transaction in
            try await 日誌モデル.create(on: transaction)
            try await 清掃担当研究室一覧モデル.create(on: transaction)
            try await 日直者一覧モデル.create(on: transaction)
            try await 授業一覧モデル.create(on: transaction)
            try await 欠課学生一覧モデル.create(on: transaction)
        }
    }
    
    fileprivate func 日誌モデル(_ 日誌: Entity.Diary) -> Diary {
        .init(
            UUID(),
            日誌.日付,
            日誌.天候,
            日誌.行時・その他,
            日誌.清掃実施（予定）日,
            日誌.感想・連絡事項等
        )
    }
    
    fileprivate func 清掃担当研究室モデル(
        _ 日誌ID: Diary.IDValue,
        _ 清掃担当研究室一覧: [Entity.Research],
        _ 全研究室モデル: [Research]
    ) throws -> [DiaryResearch] {
        try 全研究室モデル.filter { 研究室モデル in
            清掃担当研究室一覧.contains(where: { $0.指導教員名 == 研究室モデル.指導教員名 })
        }.map { 研究室モデル in
            try .init(UUID(), 日誌ID, 研究室モデル.requireID())
        }
    }
    
    fileprivate func 日直者一覧モデル(
        _ 日誌ID: Diary.IDValue,
        _ 日直者一覧: [Entity.Student],
        _ 全学生モデル: [Student]
    ) throws -> [DiaryStudent] {
        try 全学生モデル.filter { 学生モデル in
            日直者一覧.contains(where: { $0.出席番号 == 学生モデル.出席番号 })
        }.map { 日直 in
            try .init(UUID(), 日誌ID, 日直.requireID())
        }
    }
    
    fileprivate func 授業・欠課学生モデル(
        _ 日誌ID: Diary.IDValue,
        _ 授業一覧: [Entity.Study],
        _ 全学生モデル: [Student],
        _ 全科目モデル: [Subject]
    ) throws -> [(授業: Study, 欠課学生一覧: [StudyStudent])] {
        try 授業一覧.compactMap { 授業 in
            guard let 科目モデル = 全科目モデル.first(where: { $0.科目名 == 授業.科目.科目名 }) else {
                return nil
            }
            let 授業ID = UUID()
            return (
                授業: try .init(
                    授業ID,
                    日誌ID,
                    科目モデル.requireID(),
                    授業.授業時限.map({ $0.rawValue }),
                    授業.備考
                ),
                欠課学生一覧: try 全学生モデル.filter { 学生モデル in
                    授業.欠席者一覧.contains(where: { $0.出席番号 == 学生モデル.出席番号 })
                }.map { 欠課学生 in
                    try .init(UUID(), 授業ID, 欠課学生.requireID())
                }
            )
        }
    }
}
