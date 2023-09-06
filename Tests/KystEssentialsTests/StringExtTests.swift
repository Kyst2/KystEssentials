import XCTest
@testable import KystEssentials
/////////////////////////////////////////////
//trim(_ char: Character) -> String
/////////////////////////////////////////////







 












/////////////////////////////////////////////
//split(delimitedByChars
/////////////////////////////////////////////
final class StringExtTests: XCTestCase {
    func testTrimEnd() throws {
        XCTAssertEqual("aabbbklsfdjlkdsklaaddbbaa".trimEnd(" "),"aabbbklsfdjlkdsklaaddbbaa")
        XCTAssertEqual("aabbbklsfdjlkdsklaaddbbaa".trimEnd("a"),"aabbbklsfdjlkdsklaaddbb")
    }
    
    func testTrimEndInChar() throws {
        XCTAssertEqual("aabbbklsfdjlkdsklaaddbbaa".trimEnd(charsIn: " "), "aabbbklsfdjlkdsklaaddbbaa")
        XCTAssertEqual("aabbbklsfdjlkdsklaaddbbaa".trimEnd(charsIn: "a"), "aabbbklsfdjlkdsklaaddbb")
        XCTAssertEqual("aabbbklsfdjlkdsklaaddbbaa".trimEnd(charsIn: "ab"),"aabbbklsfdjlkdsklaadd")
    }
    
    func testTrimStart() throws {
        XCTAssertEqual("aabbbklsfdjlkdsklaaddbbaa".trimStart(" "),"aabbbklsfdjlkdsklaaddbbaa")
        XCTAssertEqual("aabbbklsfdjlkdsklaaddbbaa".trimStart("a"),"bbbklsfdjlkdsklaaddbbaa")
    }
    
    func testTrimStartInChars() throws {
        XCTAssertEqual("aabbbklsfdjlkdsklaaddbbaa".trimStart(charsIn: " "), "aabbbklsfdjlkdsklaaddbbaa")
        XCTAssertEqual("aabbbklsfdjlkdsklaaddbbaa".trimStart(charsIn: "a"), "bbbklsfdjlkdsklaaddbbaa")
        XCTAssertEqual("aabbbklsfdjlkdsklaaddbbaa".trimStart(charsIn: "ab"),"klsfdjlkdsklaaddbbaa")
    }
    
    func testTrim() throws {
        XCTAssertEqual("aaacccaaa".trim("a"),"ccc")
        XCTAssertEqual("  aaacccbbb".trim(" "),"aaacccbbb")
        XCTAssertEqual("aaacccbbb  ".trim(" "),"aaacccbbb")
        XCTAssertEqual("".trim(" "),"")
        XCTAssertEqual("aaacccaaa".trim(" "),"aaacccaaa")
        XCTAssertEqual("aaacacacaaa".trim("a"),"cacac")
    }
    
    func testTrimCharsIn() throws {
        XCTAssertEqual("aaabbbcccbaaa".trim(charsIn: "ab"),"ccc")
        XCTAssertEqual("aaabbbcacacbaaa".trim(charsIn: "ab"),"cacac")
        XCTAssertEqual("aaabbbccc".trim(charsIn: "ab"),"ccc")
        XCTAssertEqual("cccbaa".trim(charsIn: "ab"),"ccc")
        XCTAssertEqual("".trim(charsIn: "ab"),"")
        XCTAssertEqual("aaabbbcccbaaa".trim(charsIn: "wr"),"aaabbbcccbaaa")
    }
    
    
    
    func testSplitDelimitedByChars() throws {
        XCTAssertEqual("abcd:aasdf,asdf..,asdf..".split(delimitedByChars: ".,:"),["abcd","aasdf","asdf","asdf"] )
        XCTAssertEqual("asdfsadf".split(delimitedByChars: ";"),["asdfsadf"] )
        XCTAssertEqual("".split(delimitedByChars: ";"),[] )
    }
    
    //wrong tests //wrong solution
    func testTruncEnd() throws {
        XCTAssertEqual("hello world".truncEnd(length: 5),"hello…")
        XCTAssertEqual("hello world".truncEnd(length: 20),"hello world")
        XCTAssertEqual("hello world".truncEnd(length: 0),"…")
//        XCTAssertEqual("hello world".truncEnd(length: -1),"")
    }
    
    //wrong tests //wrong solution
    func testTruncStart() throws {
        XCTAssertEqual("hello world".truncStart(length: 5), "…world")
        XCTAssertEqual("hello world".truncStart(length: 20), "hello world")
        XCTAssertEqual("hello world".truncStart(length: 0), "…")
    }
    
    //wrong tests //wrong solution
    func testTruncCenter() throws {
        
        XCTAssertEqual("hello world".truncCenter(length: 4), "he…ld")
        XCTAssertEqual("hello world".truncCenter(length: 20), "hello world")
        XCTAssertEqual("hello world".truncCenter(length: 0), "…")
    }
    
    func testStringMultiply() throws {
        XCTAssertEqual("hello" * 3, "hellohellohello")
        XCTAssertEqual("hello" * 1, "hello")
        XCTAssertEqual("hello" * 0, "")
        XCTAssertEqual("hello" * -1, "")
        
        XCTAssertEqual(3 * "hello", "hellohellohello")
        XCTAssertEqual(1 * "hello", "hello")
        XCTAssertEqual(0 * "hello", "")
        XCTAssertEqual(-1 * "hello", "")
    }
    
    //ok
    func testCapitalizeFirstLetter() throws {
        var str = "hello world"
        
        str.capitalizeFirstLetter()
        
        XCTAssertEqual(str, "Hello world")
    }
    //ok
    func testCapitalizingFirstLetter() throws {
        XCTAssertEqual("hello world".capitalizingFirstLetter(),  "Hello world")
    }
    
    func testReplace() throws {
        XCTAssertEqual("hello world".replace(of: "world", to: "hell"), "hello hell")
        XCTAssertEqual("hello world".replace(of: "World", to: "hell"), "hello world")
        XCTAssertEqual("hello world".replace(of: " ", to: " "), "hello world")
        XCTAssertEqual("hello world".replace(of: "Vasia", to: " "), "hello world")
    }
    
    func testReplaceAllOf() throws {
        XCTAssertEqual("hello world i am Andrew".replace(allOf: ["i","am"], to: ""), "hello world   Andrew")
        XCTAssertEqual("hello world i am Andrew".replace(allOf: ["i","am","Vasia"], to: ""), "hello world   Andrew")
        XCTAssertEqual("hello world i am Andrew".replace(allOf: ["innokentiy","amsterdam","Vasia"], to: ""), "hello world i am Andrew")
    }
    
    ///subscript/////////
    func testSubscriptRange() throws {
        XCTAssertEqual("hello world"[6...10], "world")
        XCTAssertEqual("hello world"[0..<6], "hello ")
        
//        XCTAssertEqual("hello world"[100...150], "")
    }
    
    func testSubscriptCharByIdx() throws {
        XCTAssertEqual("hello world"[charByIdx: 4], "o")
//        XCTAssertEqual("hello world"[charByIdx: 150], "o")
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
