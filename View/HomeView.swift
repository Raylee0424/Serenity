import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HomeTopView()
            
            HStack {
                Text("Recent")
                    .font(Font.custom("Righteous", size: 18))
                    .foregroundColor(Color(red: 0.20, green: 0.29, blue: 0.46))
                Spacer()
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
    }
}

#Preview {
    HomeView()
}
