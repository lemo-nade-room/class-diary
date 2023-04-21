import Foundation
import Fluent
import Entity

final class Subject: Model {
    static let schema = "subjects"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var 科目名: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(_ id: UUID? = nil, _ 科目名: String) {
        self.id = id
        self.科目名 = 科目名
    }
}

extension Subject {
    
    var entity: Entity.Subject {
        .init(科目名)
    }
}
