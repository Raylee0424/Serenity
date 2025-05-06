import Foundation
import Combine

class SignInViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var emailError: String? = nil
    @Published var passwordError: String? = nil
    
    // Validation logic
    func validateFields() -> Bool {
        var isValid = true
        
        // Email validation
        if email.isEmpty {
            emailError = "Email is required"
            isValid = false
        } else if !isValidEmail(email) {
            emailError = "Enter a valid email address"
            isValid = false
        } else {
            emailError = nil
        }
        
        // Password validation
        if password.isEmpty {
            passwordError = "Password is required"
            isValid = false
        } else {
            passwordError = nil
        }
        
        return isValid
    }
    
    // Regex email validation
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // Simulate sign-in process
    func signIn() {
        if validateFields() {
            // Proceed with sign in logic
            print("Sign in with email: \(email) and password: \(password)")
        }
    }
}
