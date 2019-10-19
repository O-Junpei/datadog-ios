import KeychainAccess
import Alamofire

class EventsModel {
    private var apiKey: String
    private var applicationKey: String

    init() {
        let keychain = Keychain(service: "com.swiswiswift.datadog")
        let apiKey = keychain["api_key"]
        let applicationKey = keychain["application_key"]
        self.apiKey = apiKey ?? ""
        self.applicationKey = applicationKey ?? ""
    }


    func featchEvents(completion: @escaping ([Event]?, Error?) -> Void) {
        let parameters = [
            "api_key": apiKey,
            "application_key": applicationKey,
            "start": "1571291628",
            "end": "1571391628"
        ]

        AF.request("https://api.datadoghq.com/api/v1/events", parameters: parameters, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else {
                    completion(nil, nil)
                    return
                }
                guard let eventsResponse = try? JSONDecoder().decode(EventsResponse.self, from: data) else {
                    completion(nil, nil)
                    return
                }
                completion(eventsResponse.events, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

