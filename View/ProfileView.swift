import SwiftUI

struct ProfileView: View {
    @ObservedObject var userData: UserData
    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing: 4) {
                    Image("ProfilePic")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                    Text("Lumine")
                        .font(Font.custom("Righteous", size: 25))
                        .lineSpacing(32)
                        .foregroundColor(.white)
                    Text(userData.email)
                        .font(Font.custom("Righteous", size: 15))
                        .foregroundColor(.white)
                    Text("Beijing, China")
                        .font(Font.custom("Righteous", size: 15))
                        .foregroundColor(Color(red: 0.62, green: 0.77, blue: 0.95))
                    }
                    .frame(height: 75)
                    .offset(y: 30)
            }
            .offset(y: -5)
            .frame(width: 435, height: 288)
            .background(Color("PrimaryBackgroundColor"))
            .cornerRadius(50)
            
            HStack {
                Text("General Settings")
                    .font(Font.custom("Righteous", size: 24))
                    .foregroundColor(Color("PrimaryTextColor"))
                Spacer()
            }
            .frame(width: 398)
            
            VStack(alignment: .leading, spacing: 12) {
                GeneralSettingButtonView(icon: "Monotone-Profile", title: "Edit Profile")
                GeneralSettingButtonView(icon: "Monotone-Lock", title: "Security")
                GeneralSettingButtonView(icon: "Monotone-Bell", title: "Notifications")
                GeneralSettingButtonView(icon: "Monotone-LogOut", title: "Log Out")
                CloseAccountView()
            }
            
//            TabBarView()
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
    }
}

struct ProfileContentView: View {
    @StateObject private var userData = UserData()

    var body: some View {
        NavigationStack {
            ProfileView(userData: userData)
        }
    }
}

#Preview{
    ProfileContentView()
}
