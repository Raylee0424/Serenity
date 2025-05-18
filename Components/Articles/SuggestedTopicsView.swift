import SwiftUI

struct SuggestedTopicsView: View {
    
    var icon: String
    var title: String
    
    var body: some View {
        VStack {
          ZStack() {
            Image(icon)
                  .resizable()
                  .scaledToFit()
                  .frame(width: 27.54, height: 27.54)
          }
          .frame(width: 73.45, height: 73.45)
          .background(Color("ButtonColor"))
          .cornerRadius(1416.15)
          .shadow(
            color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 18.36, y: 9.18
          )
          Text(title)
            .font(Font.custom("Righteous", size: 16.07))
            .foregroundColor(Color(red: 0.12, green: 0.09, blue: 0.06).opacity(0.64))
        }
    }
}

#Preview {
    SuggestedTopicsView(icon: "Monotone-Brain", title: "Stress")
}
