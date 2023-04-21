import Vapor

extension Study {
    public struct Create: Hashable, Content {
        
        /// 授業時限
        public var periods: [Int]
        
        /// 科目名
        public var subject: String
        
        /// 欠席者の出席番号
        public var absents: [Int]
        
        /// 備考
        public var remark: String
        
    }
}
