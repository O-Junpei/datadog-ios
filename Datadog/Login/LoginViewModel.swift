import Foundation
import KeychainAccess

class LoginViewModel: ObservableObject {
    @Published var apiKey: String
    @Published var applicationKey: String

    init() {
        let keychain = Keychain(service: "com.swiswiswift.datadog")
        let apiKey = keychain["api_key"]
        let applicationKey = keychain["application_key"]
        self.apiKey = apiKey ?? ""
        self.applicationKey = applicationKey ?? ""
    }
}
