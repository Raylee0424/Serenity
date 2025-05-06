import SwiftUI

struct TabBarView: View {
    var body: some View {
        ZStack {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .frame(width: 75, height: 75)
                .background(Color(red: 0.20, green: 0.29, blue: 0.46))
                .cornerRadius(1234)
                .shadow(color: Color(red: 0.80, green: 0.87, blue: 0.95, opacity: 1), radius: 32, y: 16)
                .offset(y: -40)
            VStack {
                Image("TabBarBackground")
                    .resizable()
            }
            .ignoresSafeArea()
            .frame(width: 490, height: 140)
            
            HStack (spacing: 140) {
                HStack (spacing: 45){
                    icon(icon: "Monotone-Home")
                    icon(icon: "Monotone-News")
                }
                HStack (spacing: 45){
                    icon(icon: "Monotone-Music")
                    icon(icon: "Monotone-Profile")
                }
            }
            .offset(y: 17)
        }
        .offset(y: 15)
        .edgesIgnoringSafeArea(.all)
    }
}

struct icon: View {
    
    var icon: String
    
    var body: some View {
        Image(icon)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
    }
}

#Preview {
    ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                TabBarView()
            }
        }
}
