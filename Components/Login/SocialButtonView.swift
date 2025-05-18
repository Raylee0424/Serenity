import SwiftUI

struct SocialButtonView: View {
    
    var logo: String
    
    var body: some View {
        ZStack() {
            Image(logo)
                .resizable()
                .scaledToFit()
                .frame(width: 27.08, height: 27.08)
        }
        .frame(width: 63.18, height: 63.18)
        .cornerRadius(13.54)
        .overlay(
        RoundedRectangle(cornerRadius: 13.54)
            .inset(by: 0.56)
            .stroke(Color("DefaultTextColor"))
        )
    }
}

#Preview {
    SocialButtonView(logo: "Instagram")
}
