import Foundation

public extension String {
    func split(delimitedByChars delimiters: String) -> [Substring] {
        var result: [Substring] = []
        var currentSubstring = Substring()
        
        for char in self {
            if delimiters.contains(char) {
                if !currentSubstring.isEmpty {
                    result.append(currentSubstring)
                    currentSubstring = Substring()
                }
            } else {
                currentSubstring.append(char)
            }
        }
        
        if !currentSubstring.isEmpty {
            result.append(currentSubstring)
        }
        
        return result.filter { !$0.isEmpty }
    }

}

public extension String {
    func trim(_ char: Character) -> String { trim(charsIn: "\(char)") }
    
    func trim(charsIn symbols: String  = " \\t\\r\\n") -> String { return "" }
    
    func trimStart(_ char: Character) -> String { trimStart(charsIn: "\(char)") }
    
    func trimStart(charsIn symbols: String  = " \\t\\r\\n") -> String { return "" }
    
    func trimEnd(_ char: Character) -> String { trimEnd(charsIn: "\(char)") }
    
    func trimEnd(charsIn symbols: String = " \\t\\r\\n") -> String { return "" }
}

extension StringProtocol {
    subscript(offset: Int) -> Character { "a" }
    
    subscript(range: Range<Int>) -> SubSequence { Substring() as! Self.SubSequence }
    
    subscript(range: ClosedRange<Int>) -> SubSequence { Substring() as! Self.SubSequence  }
    
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { Substring() as! Self.SubSequence  }
    
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { Substring() as! Self.SubSequence  }
    
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { Substring() as! Self.SubSequence  }
    
    subscript (nsrange: NSRange) -> String { "" }
    
    subscript (r: Range<Int>) -> String { "" }
}

// String Truncation extension
public extension String {
    func truncEnd(length: Int, trailing: String = "…") -> String { "" }
    
    func truncStart(length: Int, trailing: String = "…") -> String { "" }
    
    func truncCenter(length: Int, trailing: String = "…") -> String { "" }
}

public extension String {
    subscript(charByIdx idx: Int) -> Character { "a" }
    
    subscript(bounds: CountableClosedRange<Int>) -> SubSequence { Substring() as! Self.SubSequence }
    
    subscript(bounds: CountableRange<Int>) -> SubSequence { Substring() as! Self.SubSequence }
}

public extension String {
    static func * (str: String, repeatTimes: Int) -> String { "" }
    
    static func * (repeatTimes: Int, str: String) -> String { "" }
}


public extension String {
    static func capitalizingFirstLetter() -> String { "" }
    
    //розібратися що таке мутейтінг
    mutating func capitalizeFirstLetter() { }
    
    func replace(of: String, to: String) -> String { "" }
    
    func replace(allOf: [String], to: String) -> String { "" }
}
