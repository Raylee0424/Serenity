import SwiftUI

struct SignUpView: View {
    @ObservedObject var userData: UserData
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmpassword = ""
    @State private var navigateToSignIn = false

    var body: some View {
        VStack {
            TopBarView(title: "Sign Up")
                .offset(x: 0, y: -2)
                .padding(.bottom, 43)
            
            VStack(alignment: .leading, spacing: 27.44) {
                LoginInputFieldView(
                    text: $email,
                    title: "Email Address",
                    inputLogo: "Monotone-Email",
                    placeholder: "Enter your email...",
                    rightLogo: "Solid-Chevron-Down",
                    isSecureField: false
                )
                
                LoginInputFieldView(
                    text: $password,
                    title: "Password",
                    inputLogo: "Monotone-Email",
                    placeholder: "Enter your password...",
                    rightLogo: "Solid-Anatomy-Eye",
                    isSecureField: true
                )
                
                LoginInputFieldView(
                    text: $confirmpassword,
                    title: "Confirm Password",
                    inputLogo: "Monotone-Email",
                    placeholder: "Confirm Password...",
                    rightLogo: "Solid-Anatomy-Eye",
                    isSecureField: true
                )
            }
            .padding(.bottom, 94)
            
            Button {
                navigateToSignIn = true
            } label: {
                LoginButtonView(title: "Sign Up")
                    .padding(.bottom, 35)
            }
            
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
