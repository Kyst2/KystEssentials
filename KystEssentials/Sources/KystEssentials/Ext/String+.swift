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
