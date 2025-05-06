import SwiftUI

struct NotificationButtonView: View {
    
    @Binding var isOn: Bool
    var icon: String
    var title: String

    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: 10) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
                    .background(Color(red: 0.97, green: 0.96, blue: 0.95))
                    .cornerRadius(12)

                Text(title)
                    .font(Font.custom("Righteous", size: 20))
                    .foregroundColor(Color(red: 0.06, green: 0.18, blue: 0.43))
            }

            Spacer()

            Toggle("", isOn: $isOn)
                .toggleStyle(SwitchToggleStyle(tint: Color(red: 0.61, green: 0.69, blue: 0.41)))
                .labelsHidden()
        }
        .padding(12)
        .frame(width:398, height: 88)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15).opacity(0.05), radius: 16, y: 8)
    }
}

struct ContentView: View {
    @State private var pushEnabled = true
    @State private var alertEnabled = false

    var body: some View {
        VStack(spacing: 20) {
            NotificationButtonView(isOn: $pushEnabled, icon: "Monotone-Bell", title: "Push Notifications")
            NotificationButtonView(isOn: $alertEnabled, icon: "Monotone-Alert", title: "Alert Notification")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
