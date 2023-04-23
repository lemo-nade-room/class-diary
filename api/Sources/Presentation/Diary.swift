import Vapor
import Entity

public struct Diary: Hashable, Equatable, Content {
    
    /// 日付
    var date: Date
    
    /// 天候
    var weather: Weather
    
    /// 日直学生
    var responsibleStudents: [Student]
    
    /// 授業
    var studies: [Study]
    
    /// 行事・その他
    var eventOrOther: String
    
    /// 清掃担当研究室
    var cleanResponsibleReasearches: [Research]
    
    // 清掃実施（予定）日
    var cleanDate: Date
    
    /// 感想・連絡事項
    var impressionOrContact: String
}

extension Diary {
    public var entity: Entity.Diary {
        .init(
            日付: date,
            天候: weather,
            日直者: responsibleStudents.entities,
            授業: studies.entities,
            行時・その他: eventOrOther,
            清掃担当研究室: cleanResponsibleReasearches.entities,
            清掃実施（予定日）: cleanDate,
            感想・連絡事項等: impressionOrContact
        )
    }
}

extension Entity.Diary {
    public var toJSON: Diary {
        .init(
            date: 日付,
            weather: 天候,
            responsibleStudents: 日直者.toJSON,
            studies: 授業.toJSON,
            eventOrOther: 行時・その他,
            cleanResponsibleReasearches: 清掃担当研究室.toJSON,
            cleanDate: 清掃実施（予定）日,
            impressionOrContact: 感想・連絡事項等
        )
    }
}

extension [Entity.Diary] {
    public var toJSON: [Diary] {
        map { $0.toJSON }
    }
}
