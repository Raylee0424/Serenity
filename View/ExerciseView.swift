import SwiftUI

struct ExerciseView: View {
    var body: some View {
        ZStack {
            Color("WhiteBackground")
                .ignoresSafeArea()
            
            VStack {
                MusicPlayerView()

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
                
                ScrollView {
                    VStack(spacing: 10) {
                        // Multiple scrollable history items
                        ForEach(0..<3) { index in
                            MusicHistoryBarView(
                                title: "Deep Breathing Exercises for Beginners",
                                currentTime: "01:23",
                                totalTime: "03:06",
                                progress: CGFloat(index) * 0.1
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
