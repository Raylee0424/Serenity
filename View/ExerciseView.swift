import SwiftUI

struct ExerciseView: View {
    @State private var musics = [
        Music(title: "Deep Breathing Exercises", duration: 186),
        Music(title: "Relaxing Piano Melodies", duration: 240),
        Music(title: "Morning Meditation", duration: 300)
    ]
    
    @State private var currentTrackIndex = 0
    @State private var trackProgress: [CGFloat] = [0.25, 0.45, 0.65] // Example progress values
    
    var body: some View {
        ZStack {
            Color("WhiteBackground")
                .ignoresSafeArea()
            
            VStack {
                // Music Player with current track
                MusicPlayerView(
                    music: musics[currentTrackIndex],
                    progress: trackProgress[currentTrackIndex],
                    onPrevious: {
                        withAnimation {
                            currentTrackIndex = (currentTrackIndex - 1 + musics.count) % musics.count
                        }
                    },
                    onNext: {
                        withAnimation {
                            currentTrackIndex = (currentTrackIndex + 1) % musics.count
                        }
                    }
                )
                
                // History Section
                HStack {
                    Text("History")
                        .font(Font.custom("Righteous", size: 20))
                        .foregroundColor(Color("PrimaryTextColor"))
                    
                    Spacer()
                    
                    Text("See All")
                        .font(Font.custom("Righteous", size: 13.29))
                        .foregroundColor(Color(red: 0.44, green: 0.42, blue: 0.40))
                }
                .padding(.top, 25)
                
                // History List
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(musics.indices, id: \.self) { index in
                            MusicHistoryBarView(
                                music: musics[index],
                                progress: trackProgress[index],
                                onPlay: {
                                    // Switch to this track when play is tapped
                                    withAnimation {
                                        currentTrackIndex = index
                                    }
                                }
                            )
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.top, 5)
            .padding(.horizontal, 60)
        }
    }
}

#Preview {
    ExerciseView()
}
