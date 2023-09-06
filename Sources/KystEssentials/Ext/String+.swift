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
    func trim(_ char: Character) -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: String(char)))
    }
    
    func trim(charsIn symbols: String = " \t\r\n") -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: symbols))
    }
    
    func trimStart(_ char: Character) -> String { trimStart(charsIn: "\(char)") }
    
    func trimStart(charsIn symbols: String  = " \t\r\n") -> String {
        guard !symbols.isEmpty else {
            return self
        }
        
        var startIndex = self.startIndex
        
        while startIndex < self.endIndex
                && symbols.contains(self[startIndex])
        {
            startIndex = self.index(after: startIndex)
        }
        
        return String(self[startIndex...])
    }
    
    func trimEnd(_ char: Character) -> String { trimEnd(charsIn: "\(char)") }
    
    func trimEnd(charsIn symbols: String = " \t\r\n") -> String {
        guard !symbols.isEmpty else {
            return self
        }
        
        var endIndex = self.endIndex
        
        while endIndex > self.startIndex
                && symbols.contains(self[self.index(before: endIndex)])
        {
            endIndex = self.index(before: endIndex)
        }
        
        return String(self[self.startIndex..<endIndex])
    }
}

public extension StringProtocol {
    subscript(charByIdx idx: Int) -> Character? {
        let index = self.index(self.startIndex, offsetBy: idx)
        return self[index]
    }
    
    subscript(range : Range<Int>) -> SubSequence {
        let startIndex = index(startIndex, offsetBy: range.lowerBound)
        let endIndex = index(startIndex, offsetBy: range.upperBound - range.lowerBound)
        return self[startIndex..<endIndex]
    }
    
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = index(self.startIndex, offsetBy: range.upperBound + 1)
        return self[startIndex..<endIndex]
    }
    
    subscript(range: PartialRangeFrom<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex...]
    }
    
    subscript(range: PartialRangeThrough<Int>) -> SubSequence {
        let endIndex = index(self.startIndex, offsetBy: range.upperBound)
        return self[self.startIndex...endIndex]
    }
    
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence {
        let endIndex = index(self.startIndex, offsetBy: range.upperBound)
        return self[self.startIndex..<endIndex]
    }
    
    subscript (nsrange: NSRange) -> String {
        let start = index(startIndex, offsetBy: nsrange.lowerBound, limitedBy: endIndex) ?? endIndex
        let end = index(startIndex, offsetBy: nsrange.upperBound, limitedBy: endIndex) ?? endIndex
        let range = Range(uncheckedBounds: (lower: start, upper: end))
        return String(self[range])
    }
    
    subscript (r: Range<Int>) -> String {
        let startIndex = index(self.startIndex, offsetBy: r.lowerBound)
        let endIndex = index(self.startIndex, offsetBy: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}

// String Truncation extension
public extension String {
    func truncEnd(length: UInt, trailing: String = "…") -> String {
        if self.count > length {
            let suffixStartIndex = self.index(self.startIndex, offsetBy: Int(length))
            
            return self[self.startIndex..<suffixStartIndex] + trailing
        } else {
            return self
        }
    }
    
    func truncStart(length: UInt, trailing: String = "…") -> String {
        if self.count > length {
            let prefixEndIndex = self.index(self.startIndex, offsetBy: self.count - Int(length))
            
            return trailing + self[prefixEndIndex..<self.endIndex]
        } else {
            return self
        }
    }
    
    func truncCenter(length: UInt, trailing: String = "…") -> String {
        if self.count > length {
            let prefixEndIndex = self.index(self.startIndex, offsetBy: self.count - Int(length)/2)
            let suffixStartIndex = self.index(self.startIndex, offsetBy: Int(length)/2)
            
            let startStr = self[self.startIndex..<suffixStartIndex]
            let endStr = self[prefixEndIndex..<self.endIndex]
            
            return startStr + trailing + endStr
        } else {
            return self
        }
    }
}

public extension String {
    static func * (str: String, repeatTimes: Int) -> String {
        if repeatTimes <= 0 {
            return ""
        } else {
            return String(repeating: str, count: repeatTimes)
        }
    }
    
    static func * (repeatTimes: Int, str: String) -> String {
        if repeatTimes <= 0 {
            return ""
        } else {
            return String(repeating: str, count: repeatTimes)
        }
    }
}

/////Класи можуть "неочікувано" змінювати свої данні на відміну від структур тому тут не видається ніяких ерорів
//class Test {
//    var a = 10
//
//    func changeA() {
//        a = 20
//    }
//}
//
////Так як це структура - воно видає помилку на рівні компіляції яка говорить що не можна міняти іммутабельний об'єкт
//
//struct Test2 {
//    var b = 10
//
//    func changeB() {
//        b = 20
//    }
//}
//
////відповідно для того що б змінити об'єкт - потрібно використати ключове слово mutating що б воно дозволило модифікувати інстанс структури
//struct Test3 {
//    var c = 10
//
//    mutating func changeC() {
//        c = 20
//    }
//}
//// https://www.hackingwithswift.com/sixty/7/5/mutating-methods
//// https://medium.com/the-andela-way/swift-understanding-mutating-functions-in-two-minutes-d9e363904e3a


public extension String {
    func capitalizingFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func replace(of: String, to: String) -> String {
        return self.replacingOccurrences(of: of, with: to)
    }
    
    func replace(allOf: [String], to: String) -> String {
        let of = allOf.joined(separator: "|")
        
        return self.replacingOccurrences(of: of, with: to, options: .regularExpression, range: nil)
    }
}
