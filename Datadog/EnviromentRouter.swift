import SwiftUI
import Combine

class EnviromentRouter: ObservableObject {
    @Published var isLogin: Bool = false
    @Published var enumnum: Category = .events
}
