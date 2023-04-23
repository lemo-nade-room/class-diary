import Vapor
import Entity

public struct Subject: Hashable, Equatable, Content {
    /// 科目名
    var name: String
}

extension Entity.Subject {
    public var toJSON: Subject {
        .init(name: 科目名)
    }
}

extension Subject {
    public var entity: Entity.Subject {
        .init(科目名: name)
    }
}
