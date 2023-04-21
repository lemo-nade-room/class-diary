@testable import Entity
import Foundation
import XCTest

final class DiaryTests: XCTestCase {
    
    func test初期化() {
        let date1 = Date.now
        let date2 = Date.now
        let dairy = Diary(
            date1,
            .雨,
            [],
            [],
            "行事とか特にない",
            [],
            date2,
            "連絡事項"
        )
        
        XCTAssertEqual(dairy.日付, date1)
        XCTAssertEqual(dairy.天候, .雨)
        XCTAssertEqual(dairy.日直者, [])
        XCTAssertEqual(dairy.授業, [])
        XCTAssertEqual(dairy.行時・その他, "行事とか特にない")
        XCTAssertEqual(dairy.清掃担当研究室, [])
        XCTAssertEqual(dairy.清掃実施（予定日）, date2)
        XCTAssertEqual(dairy.感想・連絡事項等, "連絡事項")
        
    }
    
}
