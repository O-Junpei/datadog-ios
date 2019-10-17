import SwiftUI

class EnviromentRouter: ObservableObject {
    @Published var isLogin: Bool = false
    @Published var category: Category = .events
}
