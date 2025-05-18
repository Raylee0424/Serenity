import SwiftUI

struct HomeTopView: View {
    
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d yyyy"
        return formatter.string(from: Date())
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                HStack {
                    Image("Monotone-Calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text(currentDate)
                        .font(Font.custom("Righteous", size: 15))
                        .foregroundColor(.white)
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    Image("ProfilePic")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 74, height: 74)
                    
                    VStack(alignment: .leading, spacing: 1) {
                        Text("Hello, Lumine!")
                          .font(Font.custom("Righteous", size: 35))
                          .lineSpacing(38)
                          .foregroundColor(.white)
                        
                        HStack(spacing: 4) {
                            Image("Solid-Menu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Let’s see how you’re feeling today")
                              .font(Font.custom("Righteous", size: 13))
                              .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
            }
            .padding(.top, 60)
            .padding(.horizontal, 43)
            .offset(y: -5)
            .frame(width: 435, height: 229)
            .background(Color("PrimaryBackgroundColor"))
            .cornerRadius(50)
        }
    }
}

#Preview {
    HomeTopView()
}
