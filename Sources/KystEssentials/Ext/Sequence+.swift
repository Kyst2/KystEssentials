import Foundation
extension Sequence {
    func asDict(groupedBy: (Self.Element) -> Self.Element ) -> [ Self.Element : [Self.Element] ] where Self.Element: Hashable {
        Dictionary(grouping: self, by: groupedBy )
    }
}


public extension Sequence {
    func asDictionary<Key: Hashable, Value>(block: (Element)->(Value)) -> [Key:Value] where Key == Self.Element {
        self.asDictionary(key: \.self, block: block)
    }
    
    func asDictionary<Key: Hashable, Value>(key: KeyPath<Element, Key>, block: (Element)->(Value)) -> [Key:Value] {
        var dict: [Key:Value] = [:]
        
        for element in self {
            let key = element[keyPath: key]
            let value = block(element)
            
            dict[key] = value
        }
        
        return dict
    }
    
    
}
