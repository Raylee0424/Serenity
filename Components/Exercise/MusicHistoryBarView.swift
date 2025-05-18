import SwiftUI

struct MusicHistoryBarView: View {
    var title: String
    var currentTime: String
    var totalTime: String
    var progress: CGFloat // 0.0 to 1.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top, spacing: 16) {
                ZStack {
                    Image("Play")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 21, height: 21)
                }
                .frame(width: 73, height: 73)
                .background(Color(red: 0.91, green: 0.93, blue: 0.98))
                .cornerRadius(27)

                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
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

    // Compute the width of the blue progress bar
    private var progressBarWidth: CGFloat {
        let maxWidth: CGFloat = 250 // Set according to design (adjust as needed)
        return max(0, min(progress, 1)) * maxWidth
    }
}

#Preview {
    MusicHistoryBarView(
        title: "Deep Breathing Exercises for Beginners",
        currentTime: "01:23",
        totalTime: "03:06",
        progress: 0.45 // 45% played
    )
}
