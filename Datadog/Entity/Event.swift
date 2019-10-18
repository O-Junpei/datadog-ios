import Foundation

struct Event: Identifiable, Codable {
    let id: Int
    let alert_type: String?
    let title: String?
    let source: String?
    let text: String?
}

