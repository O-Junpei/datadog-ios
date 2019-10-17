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
                    Button (action: {
                        self.router.enumnum = .events
                        self.menuClose()
                    }) {
                        Text("Events")
                            .imageScale (.large)
                    }

                    Button (action: {
                        self.router.enumnum = .monitors
                        self.menuClose()
                    }) {
                        Text("Monitors")
                            .imageScale (.large)
                    }

                    Button (action: {
                        self.router.enumnum = .infrastructure
                        self.menuClose()
                    }) {
                        Text("Infrastructure")
                            .imageScale (.large)
                    }

                    Button (action: {
                        self.router.enumnum = .metrics
                        self.menuClose()
                    }) {
                        Text("Metrics Exploer")
                            .imageScale (.large)
                    }

                    Button (action: {
                        self.router.enumnum = .dashboards
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
                    if router.enumnum == .events {
                        EventsView()
                            .navigationBarTitle("Events")
                    } else if router.enumnum == .monitors {
                        MonitersView()
                            .navigationBarTitle("Monitors")
                    } else if router.enumnum == .infrastructure {
                        InfrastructureView()
                            .navigationBarTitle("InfrastructureView")
                    } else if router.enumnum == .metrics {
                        MetricsView()
                            .navigationBarTitle("Metrics")
                    }
                    else if router.enumnum == .dashboards {
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
                            Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 77, height: 70)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                        })
                        .background(Color("mainPurple"))
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
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
