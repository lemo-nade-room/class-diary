/// 限目
public enum Period: Int, CaseIterable, Codable {
    case 一時限目 = 1
    case 二時限目 = 2
    case 三時限目 = 3
    case 四時限目 = 4
    case 五時限目 = 5
    case 六時限目 = 6
    case 七時限目 = 7
    case 八時限目 = 8
}

extension Period: Comparable {
    public static func < (lhs: Period, rhs: Period) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
