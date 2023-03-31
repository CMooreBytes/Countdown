import SwiftUI

struct CountdownEntryView: View {
    enum FocusedField {
        case description, date
    }
    
    static let today = Calendar.current.startOfDay(for: .now)
    @FocusState var focusState: FocusedField?
    @State var description: String = ""
    @State var time: Date = Calendar.current.date(byAdding: .day, value: 1, to: today, wrappingComponents: true)!
    @Binding var sheetShowing: Bool
    var callback: (String,Date) -> Void
    
    var body: some View {
        NavigationStack{
            VStack {
                TextField("Description", text: $description)
                    .focused($focusState, equals: .description)
                DatePicker("Date", selection: $time, in:Date.now...)
                .focused($focusState, equals: .date)
                Spacer()
            }
            .onAppear(perform: {
                focusState = .description
            })
            .padding(20)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Add Countdown")
                }
                ToolbarItem(placement: .primaryAction){
                    Button("Done") {
                        callback(description, time)
                        self.sheetShowing.toggle()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        self.sheetShowing.toggle()
                    }
                }
            }
        }
    }
}
