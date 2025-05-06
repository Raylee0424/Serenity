import SwiftUI

struct SecuritySettingView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 15) {
                    Image("Back-Button-Black")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                    Text("Security")
                        .font(Font.custom("Righteous", size: 20).weight(.heavy))
                        .foregroundColor(Color("PrimaryTextColor"))
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.top, 60)
                .padding(.bottom, 23)
                
                VStack(spacing: 20) {
                    SecurityInputFieldView(text: .constant(""),
                                           title: "Current Password",
                                           inputLogo: "Monotone-Lock",
                                           placeholder: "Enter current password",
                                           rightLogo: "Monotone-Edit")
                    
                    SecurityInputFieldView(text: .constant(""),
                                           title: "New Password",
                                           inputLogo: "Monotone-Lock",
                                           placeholder: "Enter new password",
                                           rightLogo: "Monotone-Edit")
                    
                    SecurityInputFieldView(text: .constant(""),
                                           title: "Confirm New Password",
                                           inputLogo: "Monotone-Lock",
                                           placeholder: "Enter new password",
                                           rightLogo: "Monotone-Edit")
                }
                
                Spacer()
                
                SaveSettingButtonView()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
    }
}

#Preview {
    SecuritySettingView()
}
