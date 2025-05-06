import SwiftUI

struct SignInPage: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var noEmailError: Bool = false
    @State private var showEmailError: Bool = false
    @State private var noPasswordError: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundColor()
                
                VStack(spacing: 0) {
                    TopSignUpBar(title: "Sign In")
                    
                    InputFieldTitle(input: "Email Address")
                    BackgroundField(
                        iconName: "Monotone-Email",
                        hiddenIconName: "Solid-Chevron-Down",
                        placeholder: "Enter your email...",
                        text: $email,
                        isSecure: false,
                        validationState: getEmailValidationState()
                    )
                    
                    InputFieldTitle(input: "Password")
                    BackgroundField(
                        iconName: "Monotone-Lock",
                        hiddenIconName: "Solid-Anatomy-Eye",
                        placeholder: "Enter your password...",
                        text: $password,
                        isSecure: true,
                        validationState: getPasswordValidationState()
                    )
                    
                    SignUpButton(title: "Sign In", action: validateFields)
                        .padding(.top, 20)
                    
                    ORDivider()
                    
                    Spacer()
                    
                    // Social Media Buttons
                    HStack(spacing: 20) {
                        SocialButton(iconName: "Facebook")
                        SocialButton(iconName: "Google")
                        SocialButton(iconName: "Instagram")
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                            .font(Font.custom("Righteous-Regular", size: 18))
                            .foregroundColor(Color("DefaultColorText"))
                        
                        NavigationLink {
                            SignUpPage()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Sign Up")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color("SignInColor"))
                                .underline()
                        }
                    }
                    
                    NavigationLink {
                        ForgotPassPage()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Forgot Password")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("SignInColor"))
                            .underline()
                    }
                    Spacer()
                }
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
}

#Preview {
    SignInPage()
}

struct ORDivider: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .frame(height: 1.5)
                    .foregroundColor(Color("LoginTextColor"))
                
                Text("OR")
                    .foregroundColor(Color("LoginTextColor"))
                    .font(.headline)
                    .padding(.horizontal, 8)
                
                Rectangle()
                    .frame(height: 1.5)
                    .foregroundColor(Color("LoginTextColor"))
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
        }
    }
}
