import SwiftUI
import Combine

class BookStore: ObservableObject {
    @Published var isLogin: Bool = false
    @Published var score: Int = 0

    func fetch (id: Int) {
        print("aaa")
        print(id)
    }
}
