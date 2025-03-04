import Foundation


public extension Date {
    var fullDate: String { localizedDescription(date: .full, time: .none) }
    var longDate: String { localizedDescription(date: .long, time: .none) }
    var mediumDate: String { localizedDescription(date: .medium, time: .none) }
    var shortDate: String { localizedDescription(date: .short, time: .none) }

    var fullTime: String { localizedDescription(date: .none, time: .full) }
    var longTime: String { localizedDescription(date: .none, time: .long) }
    var mediumTime: String { localizedDescription(date: .none, time: .medium) }
    var shortTime: String { localizedDescription(date: .none, time: .short) }

    var fullDateTime: String { localizedDescription(date: .full, time: .full) }
    var longDateTime: String { localizedDescription(date: .long, time: .long) }
    var mediumDateTime: String { localizedDescription(date: .medium, time: .medium) }
    var shortDateTime: String { localizedDescription(date: .short, time: .short) }
}

extension Date {
    func localizedDescription(date dateStyle: DateFormatter.Style = .medium,
                              time timeStyle: DateFormatter.Style = .medium,
                              in timeZone: TimeZone = .current,
                              locale: Locale = .current,
                              using calendar: Calendar = .current) -> String {
        Formatter.date.calendar = calendar
        Formatter.date.locale = locale
        Formatter.date.timeZone = timeZone
        Formatter.date.dateStyle = dateStyle
        Formatter.date.timeStyle = timeStyle
        return Formatter.date.string(from: self)
            .replacingOccurrences(of: "/", with: ".")
            .replacingOccurrences(of: "-", with: ".")
            .replacingOccurrences(of: "年", with: ".") // Для японского/китайского формата
            .replacingOccurrences(of: " ", with: "")
    }
    var localizedDescription: String { localizedDescription() }
}

extension TimeZone {
    static let gmt = TimeZone(secondsFromGMT: 0)!
}

extension Locale {
    static let ptBR = Locale(identifier: "pt_BR")
}

extension Formatter {
    static let date = DateFormatter()
}

public extension Date {
    static func from(str: String, format: String = "yyyy'/'MM'/'dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: str)
    }
    
    func dayNumOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    
    func dayNumOfMonth() -> Int? {
        return Calendar.current.component(.day, from: self)
    }
    
    func adding(month: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .month, value: month, to: self)!
    }
    
    func adding(days: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(days*60*60*24))
    }
    
    func adding(hrs: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(hrs*60*60))
    }
    
    func adding(mins: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(mins*60))
    }
    
    func adding(sec: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(sec))
    }
    
    func distance(to: Date, type: Calendar.Component ) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([type], from: self, to: to)
        
        switch type {
        case .day:
            return components.day ?? 0
        case .month:
            return components.month ?? 0
        case .year:
            return components.year ?? 0
        default:
            return 0
        }
    }
    
    func dateWithoutTime() -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let date = Calendar.current.date(from: components)
        return date!
    }
}
