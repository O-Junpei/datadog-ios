import SwiftUI

struct EventCell {
    var body: some View {
        VStack {
            Text("sssss")
            Text("sssss")
        }
    }
}

struct EventsView: View {        
    
    @ObservedObject(initialValue: EventsModel()) var model: EventsModel

    
    init() {
        self.model.featchEvents(limit: 10)
    }

    var body: some View {
        VStack {
            Divider()
            List (model.events) { event in
                VStack(alignment: .leading) {
                    Text(event?.title ?? "No Title")
                    Text(event?.alert_type ?? "No AlertType")
                    Text(event?.source ?? "No Source")
                    Text(event?.text ?? "No Text")
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
