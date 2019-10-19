import SwiftUI


struct EventDetailView: View {
    let event: Event
    var body: some View {
        VStack {
            Divider()
            Text("\(event.id)")
            Spacer()
        }
        
    }
}
