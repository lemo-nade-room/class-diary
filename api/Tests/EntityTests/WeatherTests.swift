@testable import Entity
import XCTest

final class WeatherTests: XCTestCase {
    
    func test値一覧() {
        XCTAssertEqual(
            Weather.allCases.map { $0.rawValue },
            ["晴れ", "雨", "曇り", "雪"]
        )
    }
    
}
