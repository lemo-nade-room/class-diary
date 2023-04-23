@testable import Entity
import XCTest

final class StudentTests: XCTestCase {
    
    func test初期化() {
        let student = Student(出席番号: 20, 氏名: "田中")
        XCTAssertEqual(student.出席番号, 20)
        XCTAssertEqual(student.氏名, "田中")
    }
    
}
