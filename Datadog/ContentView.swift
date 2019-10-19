import SwiftUI

struct SideMenu: View {
    @EnvironmentObject var router: EnviromentRouter
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void

    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
                .background(Color.gray.opacity(0.3))
                .opacity(self.isOpen ? 1.0 : 0.0)
                .animation(Animation.easeIn.delay(0.25))
                .onTapGesture {
                    self.menuClose()
                }
                .edgesIgnoringSafeArea([.top, .bottom])

            HStack {
                List {
                    Image("datadog")
                        .resizable()
                        .frame(width: 140, height: 140)
                        .aspectRatio(contentMode: .fit)

                    Button (action: {
                        self.router.category = .events
                        self.menuClose()
                    }) {
                        Text("Events")
                            .imageScale (.large)
                    }

                    Button (action: {
                        self.router.category = .monitors
                        self.menuClose()
                    }) {
                        Text("Monitors")
                            .imageScale (.large)
                    }

                    Button (action: {
                        self.router.category = .infrastructure
                        self.menuClose()
                    }) {
                        Text("Infrastructure")
                            .imageScale (.large)
                    }

                    Button (action: {
                        self.router.category = .metrics
                        self.menuClose()
                    }) {
                        Text("Metrics Exploer")
                            .imageScale (.large)
                    }

                    Button (action: {
                        self.router.category = .dashboards
                        self.menuClose()
                    }) {
                        Text("Dashboards")
                            .imageScale (.large)
                    }

                    Button (action: {
                        self.router.isLogin = false
                        self.menuClose()
                    }) {
                        Text("Logout")
                            .imageScale (.large)
                    }
                }
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)

                Spacer()
            }
                .edgesIgnoringSafeArea([.bottom])
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var router: EnviromentRouter
    @State var menuOpen: Bool = false
    var body: some View {
        ZStack {

            NavigationView {
                ZStack {
                    if router.category == .events {
                        EventsView()
                            .navigationBarTitle("Events")
                    } else if router.category == .monitors {
                        MonitersView()
                            .navigationBarTitle("Monitors")
                    } else if router.category == .infrastructure {
                        InfrastructureView()
                            .navigationBarTitle("InfrastructureView")
                    } else if router.category == .metrics {
                        MetricsView()
                            .navigationBarTitle("Metrics")
                    }
                    else if router.category == .dashboards {
                        DashboardsView()
                            .navigationBarTitle("DashboardsView")
                    }
                }
            }

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.openMenu()
                    }, label: {
                            Image("menu")
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color.white)
                        })
                        .background(Color("mainPurple"))
                        .cornerRadius(40)
                        .padding(16)
                        .shadow(color: Color.black.opacity(0.3),
                            radius: 4, x: 4, y: 4)
                }
            }

            SideMenu(width: 270,
                isOpen: self.menuOpen,
                menuClose: self.openMenu)
        }
    }

    func openMenu() {
        self.menuOpen.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
