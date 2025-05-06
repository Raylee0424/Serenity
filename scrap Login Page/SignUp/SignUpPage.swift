import SwiftUI

enum ValidationState {
    case normal
    case success
    case error
}

struct SignUpPage: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var noEmailError: Bool = false
    @State private var showEmailError: Bool = false
    @State private var showPasswordError: Bool = false
    @State private var noPasswordError: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            BackgroundColor()
            
            VStack(spacing: 0) {
                TopSignUpBar(title: "Sign Up")

                InputFieldTitle(input: "Email Address")
                BackgroundField(
                    iconName: "Monotone-Email",
                    hiddenIconName: "Solid-Chevron-Down",
                    placeholder: "Enter your email...",
                    text: $email,
                    isSecure: false,
                    validationState: getEmailValidationState()
                )
                
                if showEmailError {
                    ErrorFieldInput(errorText: "ERROR: Invalid email!")
                }
                if noEmailError {
                    ErrorFieldInput(errorText: "No email input!")
                }

                InputFieldTitle(input: "Password")
                BackgroundField(
                    iconName: "Monotone-Lock",
                    hiddenIconName: "Solid-Anatomy-Eye",
                    placeholder: "Enter your password...",
                    text: $password,
                    isSecure: true,
                    validationState: getPasswordValidationState()
                )

                InputFieldTitle(input: "Password Confirmation")
                BackgroundField(
                    iconName: "Monotone-Lock",
                    hiddenIconName: "Solid-Anatomy-Eye",
                    placeholder: "Confirm Password...",
                    text: $confirmPassword,
                    isSecure: true,
                    validationState: getConfirmPasswordValidationState()
                )
                
                if showPasswordError {
                    ErrorFieldInput(errorText: "ERROR: Password do not match!")
                }
                if noPasswordError {
                    ErrorFieldInput(errorText: "No password input!")
                }
                
                Spacer()
                
                SignUpButton(title: "Sign Up", action: validateFields)
                
                HStack(spacing: 4) {
                    Text("Have an account already?")
                        .font(Font.custom("Righteous-Regular", size: 18))
                        .foregroundColor(Color("DefaultColorText"))
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Sign In")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("SignInColor"))
                            .underline()
                    }
                }
                
                Spacer()
                
            }
        }
    }
    
    // Email Validation Function
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // Validation Logic
    private func validateFields() {
        noEmailError = email.isEmpty
        showEmailError = !email.isEmpty && !isValidEmail(email)
        noPasswordError = password.isEmpty
        showPasswordError = !password.isEmpty && password != confirmPassword
    }

    // Determine validation state for Email field
    private func getEmailValidationState() -> ValidationState {
        if noEmailError || showEmailError {
            return .error
        }
        if !email.isEmpty && isValidEmail(email) {
            return .success
        }
        return .normal
    }

    // Determine validation state for Password field
    private func getPasswordValidationState() -> ValidationState {
        if noPasswordError {
            return .error
        }
        if !password.isEmpty {
            return .success
        }
        return .normal
    }

    // Determine validation state for Confirm Password field
    private func getConfirmPasswordValidationState() -> ValidationState {
        if showPasswordError {
            return .error
        }
        if !confirmPassword.isEmpty && password == confirmPassword {
            return .success
        }
        return .normal
    }
}

#Preview {
    SignUpPage()
}

struct InputFieldTitle: View {
    var input: String
    var body: some View {
        HStack {
            Text(input)
                .foregroundColor(Color("LoginTextColor"))
                .font(Font.custom("Righteous-Regular", size: 20))
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 7)
    }
}

struct LoginIcon: View {
    var iconName: String
    var body: some View {
        HStack() {
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            Spacer()
        }
        .frame(width: 30)
        .padding(.leading, 20)
    }
}
