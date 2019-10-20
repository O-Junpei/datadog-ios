import SwiftUI
import Combine

final class EventsViewModel: ObservableObject {
    @Published var events: [Event] = [
//        Event(
//            id: 12345,
//            alert_type: "Success",
//            comments: ["sssss"],
//            date_happened: 1571361162,
//            device_name: "aaaa",
//            host: "host",
//            is_aggregate: true,
//            priority: "Property",
//            resource: "Resource",
//            source: "Monitor Alert",
//            tags: ["Tag"],
//            title: "[Recovered on {aws:us-west-2}] [Synthetics] Img/HTTPS, profile image of test user",
//            text: "TextText",
//            url: "Google.com"
//        )
    ]
    let model = EventsModel()

    init() {
        model.featchEvents() { events, error in
            if let error = error {
                print(error)
                return
            }
            guard let events = events else {
                print("events is nil")
                return
            }
            self.events = events
        }
    }
}
