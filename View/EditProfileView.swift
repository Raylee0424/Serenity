import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var userData: UserData
    
    @State private var username = ""
    @State private var email = ""
    @State private var location = ""
    
    var body: some View {
        ZStack {
            VStack {
                Ellipse()
                    .foregroundColor(Color("PrimaryBackgroundColor"))
                    .frame(width: 690, height: 670)
                    .background(Color("WhiteBackground"))
                    .offset(y: -440)
                Spacer()
            }
            
            VStack {
                HStack(spacing: 15) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("Back-Button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                    }
                    Text("Edit Profile")
                      .font(Font.custom("Righteous", size: 20).weight(.heavy))
                      .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.top, 60)
                
                Image("ProfilePic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 148, height: 148)
                
                VStack(spacing: 4) {
                  Text("Lumine")
                    .font(Font.custom("Righteous", size: 26))
                    .lineSpacing(32)
                    .foregroundColor(Color("PrimaryTextColor"))
                  Text(userData.email)
                    .font(Font.custom("Righteous", size: 16))
                    .foregroundColor(Color("PrimaryTextColor"))
                  Text("Beijing, China")
                    .font(Font.custom("Righteous", size: 16))
                    .foregroundColor(Color(red: 0.38, green: 0.58, blue: 0.82))
                }
                
                VStack(spacing: 12) {
                    ProfileInputFieldView(text: $username,
                                          title: "Username",
                                          placeholder: "Enter your username",
                                          rightLogo: "Monotone-Edit")
                    
                    ProfileInputFieldView(text: $email,
                                          title: "Email",
                                          placeholder: "Enter your email",
                                          rightLogo: "Monotone-Edit")
                    
                    ProfileInputFieldView(text: $location,
                                          title: "Location",
                                          placeholder: "Enter your location",
                                          rightLogo: "Monotone-Edit")
                }
                Spacer()
                
                RoundedButtonView(text: "Save Settings")
            }
            .frame(width: 430)
            
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    EditProfileView(userData: UserData())
}
