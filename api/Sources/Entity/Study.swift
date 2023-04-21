import Foundation

public struct Study: Hashable, Equatable {
    
    public var 授業時限: [Period]
    
    public var 科目: Subject
    
    public var 欠席者一覧: [Student]
    
    public var 備考: String
    
    public init(
        _ 授業時限: [Period],
        _ 科目: Subject,
        _ 欠席者一覧: [Student],
        _ 備考: String
    ) {
        self.授業時限 = 授業時限
        self.科目 = 科目
        self.欠席者一覧 = 欠席者一覧
        self.備考 = 備考
    }
}
