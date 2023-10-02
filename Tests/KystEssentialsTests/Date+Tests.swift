import XCTest

final class DateTests: XCTestCase {
    
    func test_DateFrom() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 3000
        components.month = 1
        components.day = 1
        let date3000_1 = calendar.date(from: components)!.adding(hrs: 2)
        
        let day3000_2 = Date.from(str: "3000/01/01")!.adding(hrs: 2)
        
        XCTAssertEqual(date3000_1, day3000_2)
    }
    
    func test_dayOfAndDistance() {
        let day3000 = Date.from(str: "3000/01/01")!.adding(hrs: 2)
        print(day3000)
        
        XCTAssertEqual(day3000.dayNumOfWeek(), 4)
        XCTAssertEqual(day3000.dayNumOfMonth(), 1)
        XCTAssertEqual(Date.now.distance(to: Date.now.adding(days: 15), type: .day), 15)
    }
    
}
