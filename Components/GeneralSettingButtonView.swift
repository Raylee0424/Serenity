import SwiftUI

struct GeneralSettingButtonView: View {
    
    var icon: String
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                HStack(spacing: 15) {
                    HStack(spacing: 10) {
                        Image(icon)
                                .resizable()
                                .frame(width: 24, height: 24)
                    }
                    .frame(width: 50, height: 50)
                    .background(Color(red: 0.95, green: 0.96, blue: 0.98))
                    .cornerRadius(12)
                    
                    Text(title)
                            .font(Font.custom("Righteous", size: 20))
                            .foregroundColor(Color("PrimaryTextColor"))
                }
                Spacer()
                Image("Monotone-Back")
                    .resizable()
                    .frame(width: 26, height: 26)
            }
            .frame(width: 365,height: 61)
        }
        .padding(12)
        .frame(width: 398, height: 79)
        .background(.white)
        .cornerRadius(24)
        .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 16, y: 8)
    }
}

#Preview {
    GeneralSettingButtonView(icon: "Monotone-Bell", title: "Text")
}
