import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var userData: UserData

    @State private var editedUsername = ""
    @State private var editedEmail = ""
    @State private var editedLocation = ""
    @State private var showSaveAlert = false

    var body: some View {
        ZStack {
            // Background Ellipse
            VStack {
                Ellipse()
                    .foregroundColor(Color("PrimaryBackgroundColor"))
                    .frame(width: 690, height: 670)
                    .background(Color("WhiteBackground"))
                    .offset(y: -440)
                Spacer()
            }

            // Main Content
            VStack {
                // Header
                HStack(spacing: 15) {
                    Button(action: { dismiss() }) {
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

                // Profile Picture
                Image("ProfilePic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 148, height: 148)

                // Current Profile Info
                VStack(spacing: 4) {
                    Text(userData.username)
                        .font(Font.custom("Righteous", size: 26))
                        .lineSpacing(32)
                        .foregroundColor(Color("PrimaryTextColor"))

                    Text(userData.email)
                        .font(Font.custom("Righteous", size: 16))
                        .foregroundColor(Color("PrimaryTextColor"))

                    Text(userData.location)
                        .font(Font.custom("Righteous", size: 16))
                        .foregroundColor(Color(red: 0.38, green: 0.58, blue: 0.82))
                }

                // Edit Fields
                VStack(spacing: 12) {
                    ProfileInputFieldView(
                        text: $editedUsername,
                        title: "Username",
                        placeholder: "Enter your username",
                        rightLogo: "Monotone-Edit"
                    )

                    ProfileInputFieldView(
                        text: $editedEmail,
                        title: "Email",
                        placeholder: "Enter your email",
                        rightLogo: "Monotone-Edit"
                    )

                    ProfileInputFieldView(
                        text: $editedLocation,
                        title: "Location",
                        placeholder: "Enter your location",
                        rightLogo: "Monotone-Edit"
                    )
                }

                Spacer()

                // Save Button
                Button(action: {
                    showSaveAlert = true
                }) {
                    RoundedButtonView(text: "Save Settings")
                }
            }
            .frame(width: 430)
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onAppear {
            editedUsername = userData.username
            editedEmail = userData.email
            editedLocation = userData.location
        }
        .alert("Do you want to save changes?", isPresented: $showSaveAlert) {
            Button("Save", role: .none) {
                saveProfile()
            }
            Button("Cancel", role: .cancel) {}
        }
    }

    private func saveProfile() {
        userData.username = editedUsername
        userData.email = editedEmail
        userData.location = editedLocation
        dismiss()
    }
}

#Preview {
    EditProfileView(userData: {
        let data = UserData()
        data.username = "Traveler"
        data.email = "traveler@teyvat.org"
        data.location = "Mondstadt"
        return data
    }())
}
