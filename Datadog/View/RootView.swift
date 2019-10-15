import SwiftUI

struct RootView: View {
    @EnvironmentObject var bookStore: BookStore
    var body: some View {
        VStack {
            if bookStore.isLogin {
                ContentView()
            } else {
                LoginView()
            }
        }
    }
}
