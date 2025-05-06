import SwiftUI

struct SocialButton: View {
    var iconName: String
    
    var body: some View {
        Button(action: {
            print("\(iconName) sign-in tapped")
        }) {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("LoginTextColor"), lineWidth: 1))
        }
    }
}
