import SwiftUI
import Alamofire
import Combine
import KeychainAccess

final class EventsViewModel: ObservableObject {
    @Published var events: [Event] = []
    private var apiKey: String
    private var applicationKey: String
    
    init() {
        let keychain = Keychain(service: "com.swiswiswift.datadog")
        let apiKey = keychain["api_key"]
        let applicationKey = keychain["application_key"]
        self.apiKey = apiKey ?? ""
        self.applicationKey = applicationKey ?? ""
        featchEvents(limit: 10)
    }
    
    func featchEvents(limit: Int) {
        let parameters = [
            "api_key": apiKey,
            "application_key": applicationKey,
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
