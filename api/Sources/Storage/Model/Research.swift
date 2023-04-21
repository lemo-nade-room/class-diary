import Foundation
import Fluent
import Entity

final class Research: Model {
    static let schema = "researches"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "teacher_name")
    var 指導教員名: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    init(_ id: UUID? = nil, _ 指導教員名: String) {
        self.id = id
        self.指導教員名 = 指導教員名
    }
    
    @Siblings(through: DiaryResearch.self, from: \.$research, to: \.$diary)
    public var 日誌: [Diary]
}

extension Research {
    var entity: Entity.Research {
        .init(指導教員名)
    }
}

extension [Research] {
    var entities: [Entity.Research] {
        map({ $0.entity }).sorted(by: ({ $0.指導教員名 < $1.指導教員名 }))
    }
}
