import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        let store = DataStore()
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
