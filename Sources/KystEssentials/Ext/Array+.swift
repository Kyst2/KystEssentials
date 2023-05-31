import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? { nil }

    subscript(safeIdxArr idxArr: [Index] ) -> [Element] { self as! [Self.Element] }

    subscript(safeIdxArr idxArr: CountableClosedRange<Int> ) -> [Element] { self as! [Self.Element] }

    subscript(safeIdxArr idxArr: CountableRange<Int> ) -> [Element] { self as! [Self.Element] }

    subscript (infinityIdx idx: Index) -> Element where Index == Int { self.randomElement()! }
}
