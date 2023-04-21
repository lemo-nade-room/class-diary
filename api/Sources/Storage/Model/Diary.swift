import Foundation
import Fluent
import Entity

final class Diary: Model {
    static let schema = "diaries"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "date")
    var 日付: Date
    
    @Field(key: "datetime")
    var datetime: Date
    
    @Enum(key: "weather")
    var 天候: Weather
    
    @Field(key: "event_other")
    var 行時・その他: String
    
    @Field(key: "clean_date")
    var 清掃実施（予定日）: Date
    
    @Field(key: "thought_contact")
    var 感想・連絡事項等: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    init(
        _ id: UUID? = nil,
        _ 日付: Date,
        _ 天候: Weather,
        _ 行時・その他: String,
        _ 清掃実施（予定日）: Date,
        _ 感想・連絡事項等: String
    ) {
        self.id = id
        self.日付 = 日付
        self.datetime = 日付
        self.天候 = 天候
        self.行時・その他 = 行時・その他
        self.清掃実施（予定日） = 清掃実施（予定日）
        self.感想・連絡事項等 = 感想・連絡事項等
    }
    
    @Children(for: \.$日誌)
    var 授業: [Study]
    
    @Siblings(through: DiaryStudent.self, from: \.$diary, to: \.$student)
    public var 担当者: [Student]
    
    @Siblings(through: DiaryResearch.self, from: \.$diary, to: \.$research)
    public var 清掃担当研究室: [Research]
    
}

extension Diary {
    var entity: Entity.Diary {
        .init(
            日付,
            天候,
            self.$担当者.value.map({ $0.entities }) ?? [],
            $授業.value.map { $0.entities } ?? [],
            行時・その他,
            $清掃担当研究室.value.map({ $0.entities }) ?? [],
            清掃実施（予定日）,
            感想・連絡事項等
        )
    }
}

extension [Diary] {
    var entities: [Entity.Diary] {
        map({ $0.entity }).sorted(by: { $0.日付 < $1.日付 })
    }
}
