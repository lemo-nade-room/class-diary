import Fluent
import Repository
import Entity

extension DiaryRepository: DiaryAllTakable {
    public func all() async throws -> [Entity.Diary] {
        try await Diary.query(on: db)
            .with(\.$授業) { 授業 in
                授業.with(\.$科目)
                授業.with(\.$欠課学生)
            }
            .with(\.$担当者)
            .with(\.$清掃担当研究室)
            .all()
            .entities
    }
}
