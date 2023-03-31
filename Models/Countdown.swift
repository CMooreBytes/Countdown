import Foundation

struct Countdown: Identifiable, Comparable, Hashable {
    private(set) var years: Int = 0
    private(set) var months: Int = 0
    private(set) var days: Int = 0
    private(set) var hours: Int = 0
    private(set) var minutes: Int = 0
    private(set) var seconds: Int = 0
    
    var formattedDate: String {
        let df = DateFormatter()
        df.dateStyle = .short
        return df.string(from: date)
    }
    
    var id = UUID()
    var date: Date
    var label: String
    
    init(label: String, date: Date) {
        self.label = label
        self.date = date
        update(currentTime: Date.now)
    }
    
    static func <(left: Countdown, right: Countdown) -> Bool {
        return left.date < right.date
    }
    
    mutating func update(currentTime: Date) -> Void {
        let components = Calendar.current.dateComponents([.year,.month, .day, .hour, .minute,.second], from: currentTime, to: date) 
        years = components.year ?? 0
        months = components.month ?? 0
        days = components.day ?? 0
        hours = components.hour ?? 0
        minutes = components.minute ?? 0
        seconds = components.second ?? 0
    }
}
