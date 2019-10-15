import SwiftUI
import Combine

class BookStore: ObservableObject {
    
    enum Enumnum {
        case x1
        case x2
        case x3
    }
    
    @Published var isLogin: Bool = false
    @Published var enumnum: Enumnum = .x1

    func fetch (id: Int) {
        print("aaa")
        print(id)
    }
}
