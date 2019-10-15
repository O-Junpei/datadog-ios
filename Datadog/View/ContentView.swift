import SwiftUI


struct Menu: Identifiable {
    enum MenuType: String {
        case myAccount = "My Account"
        case setting = "Setting"
        case favorite = "Favorite"
        case faq = "FAQ"
        case signOut = "SignOut"

        var title: String { self.rawValue }

        var imageName: String {
            switch self {
            case .myAccount: return "person.crop.circle"
            case .setting: return "wrench"
            case .favorite: return "star.circle"
            case .faq: return "questionmark.circle"
            case .signOut: return "arrow.turn.up.left"
            }
        }
    }

    var id = UUID()
    var type: MenuType
}


struct MenuRow: View {
    var image = ""
    var text = ""
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: image)
                    .imageScale(.large)
                    .frame(width: 32, height: 32)
                Text(text)
                    .font(.headline)
                Spacer()
            }
        }
    }
}


struct MenuView: View {
    @EnvironmentObject var bookStore: BookStore

    var menu = [Menu(type: .myAccount),
        Menu(type: .setting),
        Menu(type: .favorite),
        Menu(type: .faq),
        Menu(type: .signOut),]

    @Binding var show: Bool

    var body: some View {
        HStack {
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    ForEach(menu) { item in
                        MenuRow(image: item.type.imageName, text: item.type.title)
                    }
                }
                
                Button (action: {
                    self.bookStore.isLogin = false
                }) {
                    Image ("snorlax")
                        .imageScale (.large)
                }
                
                Spacer()
            }
                .padding(.top, 20)
                .padding(30)
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
            .padding(.top)
    }
}

struct ContentView: View {
    @EnvironmentObject var bookStore: BookStore
    @State var show = false

    var body: some View {
        // TODO: Switch でできないか調べる、もっと綺麗に
        ZStack {
            if bookStore.enumnum == .x1 {
                NavigationView {
                    FirstView()
                        .navigationBarItems (trailing: shareButton)
                }.background(Color.red)
                 .navigationBarTitle(Text("Users"))
            } else if bookStore.enumnum == .x2 {
                SecondView()
            } else {
                ThirdView()
            }
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


struct FirstView: View {
    var body: some View {
        Text("first")
    }
}

struct SecondView: View {
    var body: some View {
        Text("second")
    }
}

struct ThirdView: View {
    var body: some View {
        Text("third")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
