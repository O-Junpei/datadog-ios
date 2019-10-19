import SwiftUI
import Combine
import KeychainAccess

fileprivate struct InputTextField: View {
    @Binding var stateBinding: String
    let label: String
    let placeholder: String
    let secureTextField: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(Color("mainPurple"))
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
    @EnvironmentObject var router: EnviromentRouter
    @ObservedObject(initialValue: LoginViewModel()) var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Image("datadog")
                .resizable()
                .frame(width: 140, height: 140)
                .aspectRatio(
                    CGSize(width: 400, height: 400), contentMode: .fit)
                .padding(.top, 100)
                .padding(.bottom, 20)

            InputTextField(stateBinding: $viewModel.apiKey, label: "APP Key", placeholder: "Input your APP Key", secureTextField: false)
                .padding(.bottom, 20)

            InputTextField(stateBinding: $viewModel.applicationKey, label: "API Key", placeholder: "Input your API Key", secureTextField: false)
                .padding(.bottom, 20)

            Button(action: {
                print("\(self.viewModel.apiKey), \(self.viewModel.applicationKey)")
                self.router.isLogin = true
            }) {
                Spacer()
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
                .padding(.vertical, 12)
                .background(Color("mainPurple"))
                .padding(.horizontal, 36)
            Spacer()
        }
        .padding(.horizontal)
            .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
