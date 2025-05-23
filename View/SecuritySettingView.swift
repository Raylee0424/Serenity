import SwiftUI

struct SecuritySettingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 15) {
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image("Back-Button-Black")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                    }
                    
                    Text("Security")
                        .font(Font.custom("Righteous", size: 20).weight(.heavy))
                        .foregroundColor(Color("PrimaryTextColor"))
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.top, 60)
                .padding(.bottom, 23)
                
                VStack(spacing: 20) {
                    InputFieldRoundedView(text: .constant(""),
                                           title: "Current Password",
                                           inputLogo: "Monotone-Lock",
                                           placeholder: "Enter current password",
                                           rightLogo: "Monotone-Edit")
                    
                    InputFieldRoundedView(text: .constant(""),
                                           title: "New Password",
                                           inputLogo: "Monotone-Lock",
                                           placeholder: "Enter new password",
                                           rightLogo: "Monotone-Edit")
                    
                    InputFieldRoundedView(text: .constant(""),
                                           title: "Confirm New Password",
                                           inputLogo: "Monotone-Lock",
                                           placeholder: "Enter new password",
                                           rightLogo: "Monotone-Edit")
                }
                
                Spacer()
                
                RoundedButtonView(text: "Save Settings")
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    SecuritySettingView()
}
