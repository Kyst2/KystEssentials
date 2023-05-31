import XCTest
@testable import KystEssentials

/////////////////////////////////////////////
//split(delimitedByChars
/////////////////////////////////////////////
final class StringExtTests: XCTestCase {
    func testSplitDelimitedByChars() throws {
        XCTAssertEqual("abcd:aasdf,asdf..,asdf..".split(delimitedByChars: ".,:"),["abcd","aasdf","asdf","asdf"] )
        XCTAssertEqual("asdfsadf".split(delimitedByChars: ";"),["asdfsadf"] )
        XCTAssertEqual("".split(delimitedByChars: ";"),[] )
        
    }
    
    /*
     memory allocated: 1000000 33,9mb.
     This is static allocated memory and mo matter how much data saved in it
     
     measured [Time, seconds] average: 1.215,
     relative standard deviation: 1.242%, values: [1.259532, 1.208666, 1.209709, 1.216157, 1.209048, 1.215933, 1.212086, 1.205213, 1.208592, 1.208319]
     */
    func testPerformance1() throws {
        let strs = (0...100000).map{ _ in UUID().uuidString }
        let separators = "#$%^&*()!-="
        var finalString = ""
        
        strs.forEach { str in
            if let char = separators.randomElement() {
                finalString.append("\(str)\(char)")
            }
        }
        
        print("\n\nsplit(delimitedByChars:")
        measure {
            var tmp = finalString.split(delimitedByChars: separators)
            
            let substrTest = Substring()
        }
    }
    
    /*
     memory allocated: 1000000 96mb for cell with 36 chars
     memory allocated: 1000000 269mb for cell with 144 chars
     
     average: 0.149, relative standard deviation: 4.509%, values: [0.169137, 0.147430, 0.147222, 0.146674, 0.145477, 0.146347, 0.146696, 0.147348, 0.147222, 0.146881]
     */
    func testPerformanceExample2() throws {
        let strs = (0...100000).map{ _ in UUID().uuidString }
        let separators = "#$%^&*()!-="
        var finalString = ""
        
        strs.forEach { str in
            if let char = separators.randomElement() {
                finalString.append("\(str)\(char)")
            }
        }
        
        let a = strs.count * MemoryLayout.size(ofValue: strs[0])
        
        print("memory allocated: \(a) bites")
        
        print("\n\nsplit(delimitedByChars:")
        measure {
            _ = finalString.components(separatedBy: CharacterSet(charactersIn: separators))
        }
    }
}
