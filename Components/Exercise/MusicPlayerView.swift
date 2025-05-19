import SwiftUI

struct Music {
    let title: String
    let duration: Int  // Total duration in seconds
}

struct MusicPlayerView: View {
    var music: Music
    var progress: CGFloat
    var onPrevious: () -> Void
    var onNext: () -> Void
    
    private func formattedDuration(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%d:%02d", minutes, remainingSeconds)
    }
    
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
                
                Text(music.title)
                    .font(Font.custom("Righteous", size: 26))
                    .lineSpacing(1)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                HStack(spacing: 23) {
                    Text(formattedDuration(Int(CGFloat(music.duration) * progress)))
                        .font(Font.custom("Righteous", size: 13))
                        .foregroundColor(.white)
                    
                    Image("MusicWave")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 199)
                    
                    Text(formattedDuration(music.duration))
                        .font(Font.custom("Righteous", size: 13))
                        .foregroundColor(.white)
                }
                
                HStack(spacing: 36) {
                    Button(action: onPrevious) {
                        Image("Solid-Rotate-Left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23)
                    }
                    
                    // Play/Pause Button
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
                    
                    Button(action: onNext) {
                        Image("Solid-Rotate-Right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    MusicPlayerView(
        music: Music(
            title: "Deep Breathing Exercises",
            duration: 186
        ),
        progress: 0.45,
        onPrevious: {},
        onNext: {}
    )
}
