import SwiftUI
import Foundation

struct CountdownListItemView: View {
    @State var model: Countdown
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(String(format: "%02d:%02d:%02d %02d:%02d:%02d",model.years,model.months, model.days, model.hours, model.minutes, model.seconds)).font(.headline)
            HStack {
                Text("\(model.label)")
                Spacer()
                Text(self.model.formattedDate)
            }
            .font(.subheadline)
            .onReceive(timer){ input in model.update(currentTime: input) }
        }
        
    }
}
