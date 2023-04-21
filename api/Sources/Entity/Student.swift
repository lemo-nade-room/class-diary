public struct Student: Hashable, Equatable {
    
    public var 出席番号: Int
    
    public var 氏名: String
    
    public init(_ 出席番号: Int, _ 氏名: String) {
        self.出席番号 = 出席番号
        self.氏名 = 氏名
    }
}
