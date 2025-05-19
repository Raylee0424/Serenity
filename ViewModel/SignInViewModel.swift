import Foundation
import Combine

class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var emailError: String? = nil
    @Published var passwordError: String? = nil

    private var userData: UserData?

    init(userData: UserData? = nil) {
        self.userData = userData
    }

    func validateFields() -> Bool {
        var isValid = true

        if email.isEmpty {
            emailError = "Email is required"
            isValid = false
        } else if !isValidEmail(email) {
            emailError = "Enter a valid email address"
            isValid = false
        } else {
            emailError = nil
        }

        if password.isEmpty {
            passwordError = "Password is required"
            isValid = false
        } else {
            passwordError = nil
        }

        return isValid
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    func signIn() {
        if validateFields() {
            print("Sign in with email: \(email) and password: \(password)")
            userData?.email = email
        }
    }
}
