import SwiftUI
import Alamofire
import Combine

final class EventsModel: ObservableObject {

    @Published var events: [Event] = []

    func featchEvents(limit: Int) {

        let parameters = [
            "api_key": "xxxxxx",
            "application_key": "xxxxxxx",
            "start": "1571291628",
            "end": "1571391628"
        ]

        AF.request("https://api.datadoghq.com/api/v1/events", parameters: parameters, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            debugPrint(response)

            switch response.result {
            case .success:
                guard let data = response.data else {
                    return
                }

                guard let eventsResponse = try? JSONDecoder().decode(EventsResponse.self, from: data) else {
//                    completion([], nil)
                    return
                }



                self.events = eventsResponse.events

//                completion(events, nil)
            case .failure(let error):
                print(error)
//                completion([], error)
            }
        }
    }
}
