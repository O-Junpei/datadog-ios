import SwiftUI
import Combine

struct InputTextField: View {

    @Binding var stateBinding: String
    let label: String
    let placeholder: String
    let secureTextField: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
                .foregroundColor(Color.white)

            if secureTextField {
                SecureField(placeholder, text: $stateBinding)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                TextField(placeholder, text: $stateBinding)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }
}


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



struct LoginView: View {

    @EnvironmentObject var bookStore: BookStore

    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            HStack {
                Spacer()
                Image("datadog")
                    .resizable()
                    .frame(width: 140, height: 140)
                    .aspectRatio(
                        CGSize(width: 400, height: 400), contentMode: .fit)
                Spacer()
            }

            InputTextField(stateBinding: $username, label: "UserName", placeholder: "user name", secureTextField: false)

            Divider()

            InputTextField(stateBinding: $password, label: "Password", placeholder: "password", secureTextField: true)

            HStack {
                Spacer()
                Button(action: {
                    print("\(self.username), \(self.password)")
                    self.bookStore.score = self.bookStore.score + 1

                    print("score: \(self.bookStore.score)")

                    self.bookStore.isLogin = true
                    print(self.bookStore)

                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                // .disabled(true)
                
                Spacer()
            }
                .padding(.vertical, 10)
                .background(Color.red)
                .padding(.horizontal, 40)


            Spacer()
        }
            .padding(.horizontal)
            .background(Image("sea"))
            .edgesIgnoringSafeArea([.top, .bottom])
    }
}


struct ContentView: View {


    @EnvironmentObject var bookStore: BookStore

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            Text("ログイン成功！！！！！！")
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
