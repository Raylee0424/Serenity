
import Foundation
import SwiftUI

class UserData: ObservableObject {
    @Published var username: String = "Lumine"
    @Published var email: String = "user@example.com"
    @Published var location: String = "Beijing, China"
}
