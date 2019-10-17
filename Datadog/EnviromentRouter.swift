import SwiftUI
import Combine

class EnviromentRouter: ObservableObject {
    @Published var isLogin: Bool = true
    @Published var enumnum: Category = .events
}
