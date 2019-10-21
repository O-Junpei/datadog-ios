import Foundation
import KeychainAccess

class LoginModel {
    func storeApiKeyAndApplicationKey(apiKey: String, applicationKey: String) {
        let keychain = Keychain(service: "com.swiswiswift.datadog")
        keychain["api_key"] = apiKey
        keychain["application_key"] = applicationKey
    }
}
