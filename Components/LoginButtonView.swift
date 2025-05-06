import SwiftUI

struct LoginButtonView: View {
    
    var title: String
    
    var body: some View {
        HStack() {
          HStack(spacing: 18.35) {
            Text(title)
              .font(Font.custom("Righteous", size: 20.64))
              .foregroundColor(.white)
            Image("Monotone-Right-Arrow")
                  .resizable()
                .frame(width: 27.52, height: 27.52)
          }
        }
        .padding(
          EdgeInsets(top: 18.35, leading: 27.52, bottom: 18.35, trailing: 27.52)
        )
        .frame(width: 394, height: 64)
        .background(Color(red: 0.38, green: 0.58, blue: 0.82))
        .cornerRadius(11.47)
    }
}

#Preview {
    LoginButtonView(title: "Text")
}
