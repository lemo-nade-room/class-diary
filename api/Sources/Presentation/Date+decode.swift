import Vapor

extension Date {
    
    fileprivate static var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    public init(_ dateString: String) throws {
        guard let date = Self.formatter.date(from: dateString) else {
            throw Abort(.badRequest)
        }
        self = date
    }
}
