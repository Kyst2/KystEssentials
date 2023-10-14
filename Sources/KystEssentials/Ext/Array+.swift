import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    subscript(safeIdxArr idxArr: [Index] ) -> [Element] {
        return idxArr.compactMap { index in
            guard indices.contains(index) else { return nil }
            return self[index]
        }
    }
    
    subscript(safeIdxArr idxArr: CountableClosedRange<Int> ) -> [Element] {
        let validRange = idxArr.clamped(to: 0...count-1)
        return validRange.map { self[index(startIndex, offsetBy: $0)] }
    }
    
    subscript(safeIdxArr idxArr: CountableRange<Int> ) -> [Element] {
        let validRange = idxArr.clamped(to: 0..<count-1)
        return validRange.map { self[index(startIndex, offsetBy: $0)] }
    }
    
    subscript (infinityIdx idx: Index) -> Element where Index == Int {
        if idx > 0 {
            return self[ idx % self.count ]
        }
        
        return  self[self.count - abs(idx) % self.count ]
    }
}
