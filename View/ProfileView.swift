import SwiftUI

struct ProfileView: View {
    @ObservedObject var userData: UserData

    @State private var navigateToEditProfile = false
    @State private var navigateToSecurity = false
    @State private var navigateToNotification = false
    @State private var showLogoutAlert = false

    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                VStack(spacing: 4) {
                    Image("ProfilePic")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                    Text(userData.username)
                        .font(Font.custom("Righteous", size: 25))
                        .lineSpacing(32)
                        .foregroundColor(.white)
                    Text(userData.email)
                        .font(Font.custom("Righteous", size: 15))
                        .foregroundColor(.white)
                    Text(userData.location)
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
                Button {
                    navigateToEditProfile = true
                } label: {
                    GeneralSettingButtonView(icon: "Monotone-Profile", title: "Edit Profile")
                }

                Button {
                    navigateToSecurity = true
                } label: {
                    GeneralSettingButtonView(icon: "Monotone-Lock", title: "Security")
                }

                Button {
                    navigateToNotification = true
                } label: {
                    GeneralSettingButtonView(icon: "Monotone-Bell", title: "Notifications")
                }

                Button {
                    showLogoutAlert = true
                } label: {
                    GeneralSettingButtonView(icon: "Monotone-LogOut", title: "Log Out")
                }

                CloseAccountView()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
        .alert("Are you sure you want to log out?", isPresented: $showLogoutAlert) {
            Button("Log Out", role: .destructive) {
                // Perform logout action here
                print("User logged out")
            }
            Button("Cancel", role: .cancel) {}
        }
        .navigationDestination(isPresented: $navigateToEditProfile) {
            EditProfileView(userData: userData)
                .navigationBarBackButtonHidden(false)
        }
        .navigationDestination(isPresented: $navigateToSecurity) {
            SecuritySettingView()
                .navigationBarBackButtonHidden(false)
        }
        .navigationDestination(isPresented: $navigateToNotification) {
            NotificationView()
                .navigationBarBackButtonHidden(false)
        }
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
