import Foundation
import SwiftUI

struct Event: Identifiable, Codable {
    let id: Int
    let alert_type: String?
    let comments: [String]?
    let date_happened: Int?
    let device_name: String?
    let host: String?
    let is_aggregate: Bool?
    let priority: String?
    let resource: String?
    let source: String?
    let tags: [String]?
    let title: String?
    let text: String?
    let url: String?
    
    var date: String {
        guard let timestamp = date_happened  else {
            return "No Date"
        }
        
        let dateUnix: TimeInterval = TimeInterval(timestamp)
        let date = NSDate(timeIntervalSince1970: dateUnix)
        return date.description
    }
    
    var alertTypeColor: Color {
        guard let alertType = alert_type else {
            return Color.black
        }
        
        if alertType == "Success" {
            
        }else if alertType == "Success" {
            
        }
        
    }
}

