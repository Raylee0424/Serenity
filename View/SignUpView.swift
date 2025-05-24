import SwiftUI

struct SignUpView: View {
    @ObservedObject var userData: UserData
    @StateObject private var viewModel = SignUpViewModel()
    @State private var navigateToSignIn = false

    var body: some View {
        VStack {
            TopBarView(title: "Sign Up")
                .offset(x: 0, y: -2)
                .padding(.bottom, (viewModel.emailError != nil || viewModel.passwordError != nil || viewModel.confirmPasswordError != nil) ? 20 : 43)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {

                    // First Name
                    LoginInputFieldView(
                        text: $viewModel.firstName,
                        title: "First Name",
                        inputLogo: "Monotone-User",
                        placeholder: "Enter your first name...",
                        rightLogo: "",
                        isSecureField: false
                    )

                    // Middle Name
                    LoginInputFieldView(
                        text: $viewModel.middleName,
                        title: "Middle Name",
                        inputLogo: "Monotone-User",
                        placeholder: "Enter your middle name...",
                        rightLogo: "",
                        isSecureField: false
                    )

                    // Last Name
                    LoginInputFieldView(
                        text: $viewModel.lastName,
                        title: "Last Name",
                        inputLogo: "Monotone-User",
                        placeholder: "Enter your last name...",
                        rightLogo: "",
                        isSecureField: false
                    )

                    // Email Field
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

                    // Password Field
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

                    // Confirm Password Field
                    LoginInputFieldView(
                        text: $viewModel.confirmPassword,
                        title: "Confirm Password",
                        inputLogo: "Monotone-Email",
                        placeholder: "Confirm Password...",
                        rightLogo: "Solid-Anatomy-Eye",
                        isSecureField: true
                    )
                    if let confirmPasswordError = viewModel.confirmPasswordError {
                        ErrorFieldView(title: confirmPasswordError)
                    }

                    // Sign Up Button
                    Button {
                        if viewModel.validateFields() {
                            viewModel.signUp()
                            navigateToSignIn = true
                        }
                    } label: {
                        LoginButtonView(title: "Sign Up")
                    }
                    .padding(.bottom, (viewModel.emailError != nil || viewModel.passwordError != nil || viewModel.confirmPasswordError != nil) ? 10 : 35)
                }
                .padding(.horizontal, 16)
            }

            // Bottom Sign-In Link
            HStack(spacing: 4) {
                Text("Have an account already?")
                    .font(Font.custom("Righteous-Regular", size: 18))
                    .foregroundColor(Color("DefaultTextColor"))

                Button {
                    navigateToSignIn = true
                } label: {
                    Text("Sign In")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color("LoginColor"))
                        .underline()
                }
            }
            .padding(.top, 10)

            Spacer()
        }
        .ignoresSafeArea()
        .background(Color("WhiteBackground"))
        .navigationDestination(isPresented: $navigateToSignIn) {
            SignInView()
                .navigationBarBackButtonHidden(true)
        }
    }
}
struct SignUpContentView: View {
    @StateObject private var userData = UserData()

    var body: some View {
        NavigationStack {
            SignUpView(userData: userData)
        }
    }
}

#Preview {
    SignUpContentView()
}
