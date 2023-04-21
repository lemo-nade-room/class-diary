import Foundation
import Fluent
import Entity

final class Student: Model {
    static let schema = "students"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "number")
    var 出席番号: Int
    
    @Field(key: "name")
    var 氏名: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(_ id: UUID? = nil, _ 出席番号: Int, _ 氏名: String) {
        self.id = id
        self.出席番号 = 出席番号
        self.氏名 = 氏名
    }
    
    @Siblings(through: DiaryStudent.self, from: \.$student, to: \.$diary)
    var 日誌: [Diary]
    
    @Siblings(through: StudyStudent.self, from: \.$student, to: \.$study)
    var 欠課授業: [Study]
}

extension Student {
    var entity: Entity.Student {
        .init(出席番号, 氏名)
    }
}

extension [Student] {
    var entities: [Entity.Student] {
        map({ $0.entity }).sorted(by: { $0.出席番号 < $1.出席番号 })
    }
}
