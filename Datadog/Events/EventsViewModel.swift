import SwiftUI
import Combine

final class EventsViewModel: ObservableObject {
    @Published var events: [Event] = []
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
