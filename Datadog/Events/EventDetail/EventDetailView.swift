import SwiftUI


struct EventDetailView: View {
    let event: Event
    var body: some View {
        ScrollView {

            VStack(alignment: .leading) {
                Divider()
                
                VStack(alignment: .leading) {
                    Text("\(event.title ?? "No Title")")
                        .font(.headline)
                    Text("ID: \(event.id)")
                    Text(event.alert_type ?? "No AlertType")
                        .padding(2)
                        .foregroundColor(Color.white)
                        .background(event.alertTypeColor)
                    Text("Comments: \(event.comments?.description ?? "No Comments")")
                    Text("Device Name: \(event.device_name ?? "No Device Name")")
                    Text("Host: \(event.host ?? "No Host")")
                    Text("Date: \(event.date)")

                    Text("Resource: \(event.resource ?? "No Resource")")
                    Text("Source: \(event.source ?? "No Source")")
                }
                Text("Tags: \(event.tags?.description ?? "No Tags")")
                Text("Text: \(event.text ?? "No Text")")
            }.padding(12)
        }
    }
}


struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: Event(
            id: 12345,
            alert_type: "Success",
            comments: ["sssss"],
            date_happened: 1571361162,
            device_name: "aaaa",
            host: "host",
            is_aggregate: true,
            priority: "Property",
            resource: "Resource",
            source: "Monitor Alert",
            tags: ["Tag"],
            title: "[Recovered on {aws:us-west-2}] [Synthetics] Img/HTTPS, profile image of test user",
            text: "TextText",
            url: "Google.com"
            ))
    }
}
