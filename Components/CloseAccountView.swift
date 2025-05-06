import SwiftUI

struct CloseAccountView: View {
  var body: some View {
      VStack(alignment: .leading) {
          HStack() {
              HStack(spacing: 15) {
                  HStack(spacing: 10) {
                      Image("Monotone-Trash")
                              .resizable()
                              .frame(width: 24, height: 24)
                  }
                  .frame(width: 50, height: 50)
                  .background(Color("ErrorTextColor"))
                  .cornerRadius(12)
                  
                  Text("Delete Account")
                          .font(Font.custom("Righteous", size: 20))
                          .foregroundColor(Color("ErrorTextColor"))
              }
              Spacer()
              Image("Monotone-RedBack")
                  .resizable()
                  .frame(width: 26, height: 26)
          }
          .frame(width: 365,height: 61)
      }
      .padding(12)
      .frame(width: 398, height: 79)
      .background(Color("ErrorColor"))
      .cornerRadius(24)
      .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 16, y: 8)
      .overlay(
            RoundedRectangle(cornerRadius: 24)
              .stroke(Color("ErrorTextColor"), lineWidth: 2)
          )
  }
}

#Preview {
    CloseAccountView()
}
