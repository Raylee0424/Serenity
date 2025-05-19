import SwiftUI

struct SignInView: View {
    @StateObject private var userData = UserData()
    @StateObject private var viewModel: SignInViewModel
    @State private var navigateToMainApp = false
    @State private var navigateToSignUp = false

    init() {
        let userData = UserData()
        _userData = StateObject(wrappedValue: userData)
        _viewModel = StateObject(wrappedValue: SignInViewModel(userData: userData))
    }

    var body: some View {
        NavigationStack {
            VStack {
                TopBarView(title: "Sign In")
                    .offset(x: 0, y: -2)
                    .padding(.bottom, viewModel.emailError != nil || viewModel.passwordError != nil ? 20 : 45)

                VStack(alignment: .leading, spacing: 20) {
                    LoginInputFieldView(
                        text: $viewModel.email,
                        title: "Email Address",
                        inputLogo: "Monotone-Email",
                        placeholder: "Enter your email...",
                        rightLogo: "Solid-Chevron-Down",
                        isSecureField: false
                    )

                    if let emailError = viewModel.emailError {
                        ErrorFieldView(title: emailError)
                    }

                    LoginInputFieldView(
                        text: $viewModel.password,
                        title: "Password",
                        inputLogo: "Monotone-Email",
                        placeholder: "Enter your password...",
                        rightLogo: "Solid-Anatomy-Eye",
                        isSecureField: true
                    )

                    if let passwordError = viewModel.passwordError {
                        ErrorFieldView(title: passwordError)
                    }

                    Button {
                        if viewModel.validateFields() {
                            viewModel.signIn()
                            navigateToMainApp = true
                        }
                    } label: {
                        LoginButtonView(title: "Sign In")
                    }
                    .padding(.bottom, viewModel.emailError != nil || viewModel.passwordError != nil ? 10 : 35)
                }
                .padding(.bottom, viewModel.emailError != nil || viewModel.passwordError != nil ? 5 : 15)

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

                HStack(alignment: .top, spacing: 10) {
                    SocialButtonView(logo: "Facebook")
                    SocialButtonView(logo: "Google")
                    SocialButtonView(logo: "Instagram")
                }
                .padding(.bottom, viewModel.emailError != nil || viewModel.passwordError != nil ? 15 : 35)

                HStack(spacing: 4) {
                    Text("Don't have an account?")
                        .font(Font.custom("Righteous-Regular", size: 18))
                        .foregroundColor(Color("DefaultTextColor"))

                    Button {
                        navigateToSignUp = true
                    } label: {
                        Text("Sign Up")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("LoginColor"))
                            .underline()
                    }
                }

                Spacer()
            }
            .ignoresSafeArea()
            .background(Color("WhiteBackground"))
            .navigationDestination(isPresented: $navigateToSignUp) {
                SignUpView(userData: userData)
                    .navigationBarBackButtonHidden(true)
            }
            .fullScreenCover(isPresented: $navigateToMainApp) {
                TabViewModel(userData: userData)  // ✅ Pass userData here
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    SignInView()
}
