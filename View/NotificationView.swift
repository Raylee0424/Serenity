import SwiftUI

struct NotificationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var pushEnabled = true
    @State private var alertEnabled = true
    @State private var soundEnabled = true
    @State private var doNotDisturbEnabled = false

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
                    Text("Notification")
                        .font(Font.custom("Righteous", size: 20).weight(.heavy))
                        .foregroundColor(Color("PrimaryTextColor"))
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.top, 60)
                .padding(.bottom, 23)
                
                VStack(spacing: 15) {
                    NotificationButtonView(isOn: $pushEnabled,
                                           icon: "Monotone-Bell",
                                           title: "Push Notifications")
                    
                    NotificationButtonView(isOn: $alertEnabled,
                                           icon: "Monotone-Alert",
                                           title: "Alert Notification")
                    
                    NotificationButtonView(isOn: $soundEnabled,
                                           icon: "Monotone-Sound",
                                           title: "Push Notifications")
                    
                    NotificationButtonView(isOn: $doNotDisturbEnabled,
                                           icon: "Monotone-Mute",
                                           title: "Push Notifications")
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
    NotificationView()
}
