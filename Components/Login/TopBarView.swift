import SwiftUI

struct TopBarView: View {
    
    var title: String
    
    var body: some View {
        ZStack() {
        VStack(spacing: 17.20) {
            Image("Logo")
                .resizable()
                .frame(width: 104.35, height: 82.74);
            Text(title)
                .font(Font.custom("Galindo", size: 34.40))
                .lineSpacing(43.57)
                .foregroundColor(.white)
            }
            .offset(x: 0, y: 28.14)
        }
        .frame(width: 431, height: 273)
        .background(Color("PrimaryBackgroundColor"))
        .cornerRadius(57.33);
    }
}

#Preview {
    TopBarView(title: "Text")
}
