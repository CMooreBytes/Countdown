import SwiftUI  

struct CountdownDetailsView: View {
    @Binding var countdown: Countdown?
    
    let TIMER_FONT = Font.system(size: 48)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        if countdown != nil {
            VStack(alignment: .center){
                HStack (alignment: .top) {
                    Group {
                        Spacer()
                        VStack (alignment: .center) {
                            Text(String(format: "%02d", countdown!.years))
                            Text("years").font(.headline)
                        }
                        Text(":")
                        VStack (alignment: .center) {
                            Text(String(format: "%02d", countdown!.months))
                            Text("months").font(.headline)
                        }
                        Text(":")
                        VStack (alignment: .center) {
                            Text(String(format: "%02d", countdown!.days))
                            Text("days").font(.headline)
                        }
                        Spacer()
                    }
                    
                }
                HStack (alignment: .top) {
                    Spacer()
                    VStack (alignment: .center) {
                        Text(String(format: "%02d", countdown!.hours))
                        Text("hours").font(.headline)
                    }
                    Text(":")
                    VStack (alignment: .center) {
                        Text(String(format: "%02d", countdown!.minutes))
                        Text("minutes").font(.headline)
                    }
                    Text(":")
                    VStack (alignment: .center) {
                        Text(String(format: "%02d", countdown!.seconds))
                        Text("seconds").font(.headline)
                    }
                    Spacer()
                }
            }
            .font(TIMER_FONT)
            .navigationTitle(countdown!.label)
            .onReceive(timer){ input in countdown!.update(currentTime: input) }
        } else {
            Text("Select a countdown...")
        }
    }
}
