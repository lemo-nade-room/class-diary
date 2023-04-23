import Foundation

public struct Diary: Hashable, Equatable {
    
    public var 日付: Date
    
    public var 天候: Weather
    
    public var 日直者: [Student]
    
    public var 授業: [Study]
    
    public var 行時・その他: String
    
    public var 清掃担当研究室: [Research]
    
    public var 清掃実施（予定）日: Date
    
    public var 感想・連絡事項等: String
    
    public init(
        日付: Date,
        天候: Weather,
        日直者: [Student],
        授業: [Study],
        行時・その他: String,
        清掃担当研究室: [Research],
        清掃実施（予定日）: Date,
        感想・連絡事項等: String
    ) {
        self.日付 = 日付
        self.天候 = 天候
        self.日直者 = 日直者
        self.授業 = 授業
        self.行時・その他 = 行時・その他
        self.清掃担当研究室 = 清掃担当研究室
        self.清掃実施（予定）日 = 清掃実施（予定日）
        self.感想・連絡事項等 = 感想・連絡事項等
    }
}

