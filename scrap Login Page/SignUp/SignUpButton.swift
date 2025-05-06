import SwiftUI

struct SignUpButton: View {
    var title: String
    var action: () -> Void  // Accepts a closure for handling sign-up logic
    
    var body: some View {
        Button(action: action) {  // Executes the provided action when tapped
            HStack {
                Text(title)
                    .font(Font.custom("Righteous-Regular", size: 25))
                    .foregroundColor(.white)
                
                Image("Monotone-Right-Arrow")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
            .frame(width: 400, height: 63)
            .background(Color("SignUpColor"))
            .cornerRadius(10)
        }
        .padding(.bottom, 45)
    }
}

#Preview {
    SignUpButton(title: "Sign Up", action: {})
}
