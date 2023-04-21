import Foundation
import Fluent
import Entity

final class Study: Model {
    static let schema = "studies"

    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "diary_id")
    var 日誌: Diary

    @Parent(key: "subject_id")
    var 科目: Subject
    
    @Field(key: "periods")
    var 授業時限: [Int]
    
    @Field(key: "remark")
    var 備考: String

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(
        _ id: UUID? = nil,
        _ 日誌ID: Diary.IDValue,
        _ 科目ID: Subject.IDValue,
        _ 授業時限: [Int],
        _ 備考: String
    ) {
        self.id = id
        self.$日誌.id = 日誌ID
        self.$科目.id = 科目ID
        self.授業時限 = 授業時限
        self.備考 = 備考
    }
    
    @Siblings(through: StudyStudent.self, from: \.$study, to: \.$student)
    var 欠課学生: [Student]
}

extension Study {
    
    var entity: Entity.Study {
        .init(
            授業時限.compactMap({ Period(rawValue: $0) }),
            $科目.value.map({ $0.entity }) ?? .init(""),
            $欠課学生.value.map({ $0.entities }) ?? [],
            備考
        )
    }
}

extension [Study] {
    var entities: [Entity.Study] {
        map({ $0.entity }).sorted {
            $0.授業時限.min()?.rawValue ?? 0 < $1.授業時限.min()?.rawValue ?? 0
        }
    }
}
