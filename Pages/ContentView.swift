

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: DataStore
    @State var countdown: Countdown?
    @State var sheetShowing = false
    var body: some View {
        NavigationSplitView {
            List(store.countdowns.sorted(), id:\.self, selection: $countdown) { countdown in
                CountdownListItemView(model: countdown)    
            }
            .navigationTitle("Countdowns")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    Button (action: {
                    self.sheetShowing.toggle()
                    }){
                        Image(systemName: "plus.circle")
                    } 
                }
            }
        } detail: {
            CountdownDetailsView(countdown: $countdown)
        }
        .sheet(isPresented: $sheetShowing) {
            CountdownEntryView(sheetShowing: $sheetShowing) { desc,t in
                let countdown = Countdown(label: desc, date: t)
                store.countdowns.append(countdown)
            }
        }
    }
}
