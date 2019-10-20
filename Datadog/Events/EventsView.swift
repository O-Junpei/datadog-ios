import SwiftUI

struct EventsCell: View {
    let event: Event
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title ?? "No Title")
                .lineLimit(1)
                .font(.headline)
            Text(event.alert_type ?? "No AlertType")
                .padding(2)
                .foregroundColor(Color.white)
                .background(Color.green)
            Text("Date: \(event.date)")
            Text("Source: \(event.source ?? "No Source")")
            Text("Text: \(event.text ?? "No Text")")
                .lineLimit(2)
        }
    }
}


struct EventsView: View {
    @ObservedObject(initialValue: EventsViewModel()) var model: EventsViewModel

    var body: some View {
        VStack {
            Divider()
            List (model.events) { event in
                NavigationLink (destination: EventDetailView(event: event)) {
                    EventsCell(event: event)
                }
            }
                .edgesIgnoringSafeArea([.bottom])
        }
    }
}


struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
