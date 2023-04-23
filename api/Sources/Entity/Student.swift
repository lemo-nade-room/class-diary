public struct Student: Hashable, Equatable {
    
    public var 出席番号: Int
    
    public var 氏名: String
    
    public init(出席番号: Int, 氏名: String) {
        self.出席番号 = 出席番号
        self.氏名 = 氏名
    }
}
