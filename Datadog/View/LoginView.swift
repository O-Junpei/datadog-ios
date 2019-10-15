import SwiftUI
import Combine

fileprivate struct InputTextField: View {

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


                    self.bookStore.isLogin = true
                    print(self.bookStore)

                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                // .disabled(true)
                // TODO: 両方の TextField が空の場合は
                
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
