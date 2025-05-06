import SwiftUI

struct TopSignUpBar: View {
    
    var title: String
    
    var body: some View {
        ZStack {
            Color(Color("PrimaryBackgroundColor"))
                .frame(height: 250)
                .cornerRadius(50)
                .ignoresSafeArea(edges: .top)
            
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .offset(y: -65)
            
            Text(title)
                .foregroundColor(.white)
                .font(Font.custom("Galindo-Regular", size: 35))
                .padding(.top, 30)
        }
        .padding(.bottom, -50)
    }
}

#Preview {
    TopSignUpBar(title: "Signing")
}
