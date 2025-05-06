import SwiftUI

struct SaveSettingButtonView: View {
    var body: some View {
        VStack {
            HStack(spacing: 32) {
                HStack(spacing: 16) {
                    Text("Save Settings")
                        .font(Font.custom("Righteous", size: 18).weight(.heavy))
                        .foregroundColor(.white)
                    Image("Monotone-Right-Arrow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
            .frame(width: 375, height: 75)
            .background(Color("ButtonColor"))
            .cornerRadius(1000)
        }
        .padding(.bottom, 60)
    }
}

#Preview {
    SaveSettingButtonView()
}
