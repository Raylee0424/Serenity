import SwiftUI

struct ForgotPassPage: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            BackgroundColor()

            VStack(spacing: 0) { // Remove extra spacing
                Color(Color("LoginBackgroundColor"))
                    .frame(width: UIScreen.main.bounds.width, height: 370) // Ensure it fits the screen width
                    .cornerRadius(150, corners: [.bottomRight]) // Keep rounded bottom-right
                    .ignoresSafeArea(edges: .top)

                Spacer()
            }

            VStack {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image("Back-Button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                        
                        Spacer()
                    }
                    .padding(.leading, 20) // Adjust left padding to keep it inside
                }
                
                HStack {
                    Text("Forgot Password")
                        .foregroundColor(.white)
                        .font(Font.custom("Galindo-Regular", size: 35))
                        .padding(.top, 30)
                    
                    Spacer()
                }
                .padding(.leading, 20)
                
                HStack {
                    Text("Select contact details where you want to reset your password.")
                        .foregroundColor(.white)
                        .font(Font.custom("Righteous-Regular", size: 20))
                        .padding(.top, 5)
                    
                    Spacer()
                }
                .padding(.leading, 20)
                
                    
                
                
                Spacer()
            }
        }
    }
}

// Custom RoundedCorner extension remains unchanged
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    ForgotPassPage()
}
