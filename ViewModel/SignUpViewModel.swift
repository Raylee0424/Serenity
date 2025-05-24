import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var firstName = ""
        @Published var middleName = ""
        @Published var lastName = ""
        @Published var email = ""
        @Published var password = ""
        @Published var confirmPassword = ""
        
        @Published var emailError: String?
        @Published var passwordError: String?
        @Published var confirmPasswordError: String?
    
    // Validation for all fields
    func validateFields() -> Bool {
        var isValid = true
        
        // Email validation
        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
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
        } else if password.count < 6 {
            passwordError = "Password must be at least 6 characters"
            isValid = false
        } else {
            passwordError = nil
        }
        
        // Confirm password validation
        if confirmPassword.isEmpty {
            confirmPasswordError = "Confirm password is required"
            isValid = false
        } else if confirmPassword != password {
            confirmPasswordError = "Passwords do not match"
            isValid = false
        } else {
            confirmPasswordError = nil
        }
        
        return isValid
    }
    
    // Regex-based email validation
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // Simulated sign-up process
    func signUp() {
        if validateFields() {
            // Perform registration logic here
            print("User signed up with email: \(email)")
        }
    }
}
