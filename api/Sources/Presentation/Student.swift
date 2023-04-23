import Vapor
import Entity

public struct Student: Hashable, Equatable, Content {
    
    /// 出席番号
    var number: Int
    
    /// 氏名
    var name: String
}

extension Student {
    public var entity: Entity.Student {
        .init(出席番号: number, 氏名: name)
    }
}

extension [Student] {
    public var entities: [Entity.Student] {
        map { $0.entity }
    }
}

extension Entity.Student {
    public var toJSON: Student {
        .init(number: 出席番号, name: 氏名)
    }
}

extension [Entity.Student] {
    public var toJSON: [Student] {
        map { $0.toJSON }
    }
}
