import Vapor
import Entity

public struct Study: Hashable, Equatable, Content {
    
    /// 授業時限
    var periods: [Int]
    
    /// 科目
    var subject: Subject
    
    /// 欠席学生一覧
    var absentStudents: [Student]
    
    /// 備考
    var remark: String
    
}

extension Study {
    public var entity: Entity.Study {
        .init(
            授業時限: periods.compactMap(Period.init),
            科目: subject.entity,
            欠席者一覧: absentStudents.entities,
            備考: remark
        )
    }
}

extension [Study] {
    public var entities: [Entity.Study] {
        map { $0.entity }
    }
}

extension Entity.Study {
    public var toJSON: Study {
        .init(
            periods: 授業時限.map { $0.rawValue },
            subject: 科目.toJSON,
            absentStudents: 欠席者一覧.toJSON,
            remark: 備考
        )
    }
}

extension [Entity.Study] {
    public var toJSON: [Study] {
        map { $0.toJSON }
    }
}
