import SwiftUI

struct MusicHistoryBarView: View {
    var music: Music
    var progress: CGFloat // 0.0 to 1.0
    var onPlay: () -> Void
    
    private var currentTime: String {
        let currentSeconds = Int(CGFloat(music.duration) * progress)
        return formattedDuration(currentSeconds)
    }
    
    private var totalTime: String {
        formattedDuration(music.duration)
    }
    
    private func formattedDuration(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%d:%02d", minutes, remainingSeconds)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top, spacing: 16) {
                Button(action: onPlay) {
                    ZStack {
                        Image("Play")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 21, height: 21)
                    }
                    .frame(width: 73, height: 73)
                    .background(Color(red: 0.91, green: 0.93, blue: 0.98))
                    .cornerRadius(27)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(music.title)
                        .font(Font.custom("Righteous", size: 18))
                        .foregroundColor(Color("PrimaryTextColor"))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    // Progress Bar
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 6)
                        
                        Capsule()
                            .fill(Color("PrimaryTextColor"))
                            .frame(width: progressBarWidth, height: 6)
                    }
                    
                    // Time
                    HStack {
                        Text(currentTime)
                            .font(Font.custom("Righteous", size: 11))
                            .foregroundColor(Color("DefaultTextColor"))
                        
                        Spacer()
                        
                        Text(totalTime)
                            .font(Font.custom("Righteous", size: 11))
                            .foregroundColor(Color("DefaultTextColor"))
                    }
                }
            }
        }
        .padding(18)
        .frame(width: 393.69)
        .background(.white)
        .cornerRadius(37)
        .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 18.36, y: 9.18)
    }
    
    private var progressBarWidth: CGFloat {
        let maxWidth: CGFloat = 250
        return max(0, min(progress, 1)) * maxWidth
    }
}

struct MusicHistoryListView: View {
    let musics = [
        Music(title: "Deep Breathing Exercises", duration: 186),
        Music(title: "Relaxing Piano Melodies", duration: 240),
        Music(title: "Morning Meditation", duration: 300)
    ]
    
    @State private var currentProgress: [CGFloat] = [0.45, 0.25, 0.75] // Example progress values
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(musics.indices, id: \.self) { index in
                MusicHistoryBarView(
                    music: musics[index],
                    progress: currentProgress[index],
                    onPlay: {
                        // Handle play button action for this track
                        print("Playing \(musics[index].title)")
                    }
                )
            }
        }
    }
}

#Preview {
    MusicHistoryListView()
}
