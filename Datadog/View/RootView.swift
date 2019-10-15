import SwiftUI

struct RootView: View {
    @EnvironmentObject var router: EnviromentRouter
    var body: some View {
        VStack {
            if router.isLogin {
                ContentView()
            } else {
                LoginView()
            }
        }
    }
}
