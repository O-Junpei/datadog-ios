import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct ContentView: View {
    @EnvironmentObject var bookStore: BookStore

    @State private var apiKey: String = ""
    @State private var appKey: String = ""
    @State private var isAnimating: Bool = false

    var body: some View {
        
        ZStack {
            NavigationView {
                VStack {
                    Image("datadog")
                        . resizable ()
                        . aspectRatio (contentMode: . fit)
                        .frame(width: 200, height: 200)
                    TextField("App Key", text: $appKey)
                        .frame(width: 300, height: 60)
                        .border(Color.gray, width: 1)
                        .background(Color.white)
                    TextField("API Key", text: $apiKey)
                        .frame(width: 300, height: 60)
                        .border(Color.gray, width: 1)
                        .background(Color.white)
//
//                    NavigationLink (destination: DetailView ()) {
//                        Text ("animal . name")
//                            . font (. system (size: 30))
//                    }
                    Button(action: {
                        self.bookStore.fetch(id: 3)
                        self.isAnimating = !self.isAnimating
                    }) {
                        Text("Login")
                            .frame(width: 100, height: 40)
                            .border(Color.gray, width: 1)
                    }
                }
            }
            ActivityIndicator(isAnimating: .constant(isAnimating), style: .large)
                .frame(width: 200, height: 200, alignment: .center)
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Hello")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
