import SwiftUI

struct EventCell {
    var body: some View {
        VStack {
            Text("sssss")
            Text("sssss")
        }
    }
}


struct EventsCell: View {
    let event: Event
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title ?? "No Title")
            Text(event.alert_type ?? "No AlertType")
            Text(event.source ?? "No Source")
            Text(event.text ?? "No Text")
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
