import SwiftUI

class DataStore : ObservableObject {
    @Published var countdowns: [Countdown] = []
    
    func countdown(_ countdownId: UUID?) -> Countdown? {
        guard countdownId != nil else {
            return nil
        }
        return countdowns.first {$0.id == countdownId}
    }
}
