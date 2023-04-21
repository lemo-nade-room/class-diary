@testable import Entity
import XCTest

final class ResearchTests: XCTestCase {
    
    func test初期化() {
        let research = Research("田中")
        XCTAssertEqual(research.指導教員名, "田中")
    }
    
    
}
