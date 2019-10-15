import SwiftUI

struct MenuView: View {
    @EnvironmentObject var router: EnviromentRouter
    @Binding var show: Bool

    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Button (action: {
                    self.router.isLogin = false
                }) {
                    Text("Events")
                        .imageScale (.large)
                }

                Button (action: {
                    self.router.isLogin = false
                }) {
                    Text("Monitors")
                        .imageScale (.large)
                }

                Button (action: {
                    self.router.isLogin = false
                }) {
                    Text("Infrastructure")
                        .imageScale (.large)
                }

                Button (action: {
                    self.router.isLogin = false
                }) {
                    Text("Metrics Exploer")
                        .imageScale (.large)
                }

                Button (action: {
                    self.router.isLogin = false
                }) {
                    Text("Metrics Exploer")
                        .imageScale (.large)
                }

                Button (action: {
                    self.router.isLogin = false
                }) {
                    Text("Logout")
                        .imageScale (.large)
                }

                Spacer()
            }
//                .padding(.top, 20)
//                .padding(30)
                .frame(width: 200)
                .background(Color.blue.opacity(0.4))
                .cornerRadius(20)
                .animation(.default)
                .offset(x: show ? 0 : -200)
                .onTapGesture {
                    self.show.toggle()
            }

            Spacer()
        }
//            .padding(.top)
    }
}

struct ContentView: View {
    @EnvironmentObject var router: EnviromentRouter
    @State var show = false

    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    EventsView()
                        .navigationBarTitle("Welcome")
                        .navigationBarItems (trailing: shareButton)
                }
            }.background(Color.gray)
            MenuView(show: $show)
        }
    }

    var shareButton: some View {
        Button (action: {
            self.show = !self.show
        }) {
            Image (systemName: "square.and.arrow.up")
                .imageScale (.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
