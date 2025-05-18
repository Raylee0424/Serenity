import SwiftUI

struct MusicPlayerView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 379, height: 515)
                .background(Color("PrimaryBackgroundColor"))
                .cornerRadius(47)
                .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 0)
            VStack(spacing: 18) {
                Image("Disc")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 249, height: 249)
                
                    Text("Deep Breathing Exercises for Beginners")
                        .font(Font.custom("Righteous", size: 26))
                        .lineSpacing(1)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                
                HStack(spacing: 23) {
                    Text("1:23")
                        .font(Font.custom("Righteous", size: 13))
                        .foregroundColor(.white)
                    
                    Image("MusicWave")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 199)
                    
                    Text("3:06")
                        .font(Font.custom("Righteous", size: 13))
                        .foregroundColor(.white)
                }
                
                HStack(spacing: 36) {
                    Image("Solid-Rotate-Left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 23)
                    
                    ZStack {
                        Image("Solid-Pause")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23)
                    }
                    .frame(width: 60, height: 60)
                    .background(.white)
                    .cornerRadius(920)
                    .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.10), radius: 0)
                    
                    Image("Solid-Rotate-Right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 23)
                }
            }
        }
    }
}

#Preview {
    MusicPlayerView()
}
