import SwiftUI

import SwiftUI

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        VStack {
            TopBarView(title: "Sign Up")
                .offset(x: 0, y: -2)
                .padding(.bottom, viewModel.emailError != nil || viewModel.passwordError != nil ? 20 : 45)
//                .padding(.bottom, 45)
            
            VStack(alignment: .leading, spacing: 20) {
                LoginInputFieldView(text: $viewModel.email,
                               title: "Email Address",
                               inputLogo: "Monotone-Email",
                               placeholder: "Enter your email...",
                               rightLogo: "Solid-Chevron-Down",
                               isSecureField: false)
                
                // Email Error View
                if let emailError = viewModel.emailError {
                    ErrorFieldView(title: emailError)
                }
                
                LoginInputFieldView(text: $viewModel.password,
                               title: "Password",
                               inputLogo: "Monotone-Email",
                               placeholder: "Enter your password...",
                               rightLogo: "Solid-Anatomy-Eye",
                               isSecureField: true)
                
                // Password Error View
                if let passwordError = viewModel.passwordError {
                    ErrorFieldView(title: passwordError)
                }
                
                Button {
                    viewModel.signIn()
                } label: {
                    LoginButtonView(title: "Sign Up")
                }
                .padding(.bottom, viewModel.emailError != nil || viewModel.passwordError != nil ? 10 : 35)
            }
            .padding(.bottom, viewModel.emailError != nil || viewModel.passwordError != nil ? 5 : 15)
            
            // OR Divider
            HStack(spacing: 9.03) {
                Rectangle()
                    .frame(height: 1.5)
                    .foregroundColor(Color("PrimaryTextColor"))
                
                Text("OR")
                    .foregroundColor(Color("PrimaryTextColor"))
                    .font(.headline)
                    .padding(.horizontal, 8)
                
                Rectangle()
                    .frame(height: 1.5)
                    .foregroundColor(Color("PrimaryTextColor"))
            }
            .frame(width: 386.96)
            .padding(.bottom, viewModel.emailError != nil || viewModel.passwordError != nil ? 10 : 39)
            
            // Social Buttons
            HStack(alignment: .top, spacing: 10) {
                SocialButtonView(logo: "Facebook")
                SocialButtonView(logo: "Google")
                SocialButtonView(logo: "Instagram")
            }
            .padding(.bottom, viewModel.emailError != nil || viewModel.passwordError != nil ? 15 : 35)
            
            // Already have an account
            HStack(spacing: 4) {
                Text("Have an account already?")
                    .font(Font.custom("Righteous-Regular", size: 18))
                    .foregroundColor(Color("DefaultTextColor"))
                
                Button {
                    // Navigation to sign in page
                } label: {
                    Text("Sign In")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color("LoginColor"))
                        .underline()
                }
            }
            Spacer()
        }
        .ignoresSafeArea()
        .background(Color("WhiteBackground"))
    }
}

#Preview {
    SignInView()
}
