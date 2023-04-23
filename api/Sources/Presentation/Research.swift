import Vapor
import Entity

public struct Research: Hashable, Equatable, Content {
    
    /// 指導教員名
    var teacher: String
}

extension Research {
    public var entity: Entity.Research {
        .init(指導教員名: teacher)
    }
}

extension [Research] {
    public var entities: [Entity.Research] {
        map { $0.entity }
    }
}

extension Entity.Research {
    public var toJSON: Research {
        .init(teacher: 指導教員名)
    }
}

extension [Entity.Research] {
    public var toJSON: [Research] {
        map { $0.toJSON }
    }
}
