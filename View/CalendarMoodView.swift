import SwiftUI

enum MoodType: String {
    case happy, angry, sad, tired, satisfied, neutral

    var imageName: String {
        switch self {
        case .happy: return "Happy-No-Face"
        case .angry: return "Angry-No-Face"
        case .sad: return "Sad-No-Face"
        case .tired: return "Tired-No-Face"
        case .satisfied: return "Satisfied-No-Face"
        case .neutral: return "Neutral-No-Face"
        }
    }
}

struct CalendarDayView: View {
    let day: Int
    let mood: MoodType?

    var body: some View {
        ZStack {
            if let mood = mood {
                Image(mood.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
            }

            Text("\(day)")
                .font(.custom("Righteous", size: 11).bold())
                .foregroundColor(Color("PrimaryTextColor"))
        }
        .frame(width: 27, height: 27)
    }
}

struct CalendarMoodView: View {
    
    @Environment(\.dismiss) var dismiss
    
    // Mock mood data: assign moods to specific days
    let moodData: [Int: MoodType] = [
        1: .satisfied,
        2: .angry,
        3: .happy,
        4: .neutral,
        5: .sad,
        6: .satisfied,
        7: .tired,
        8: .happy
    ]

    var body: some View {
        ZStack {
            Color("WhiteBackground")
                .ignoresSafeArea()

            Image("Calendar-Background")
                .resizable()
                .scaledToFit()
                .frame(width: 430)
                .offset(y: -138)

            VStack {
                HStack(spacing: 13) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("Back-Button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55)
                    }

                    Text("Track Your Mood")
                        .font(Font.custom("Righteous", size: 23))
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding(.bottom, 30)

                VStack(spacing: 27) {
                    HStack(spacing: 53) {
                        Image("Chevron-Left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45)

                        Image("Sad")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 114)

                        Image("Chevron-Right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45)
                    }

                    VStack {
                        Text("You are feeling")
                            .font(Font.custom("Righteous", size: 21))
                            .foregroundColor(.white)

                        Text("Sad")
                            .font(Font.custom("Righteous", size: 76))
                            .foregroundColor(.white)
                    }
                }

                HStack {
                    Text("Mood Calendar")
                        .font(Font.custom("Righteous", size: 20))
                        .foregroundColor(Color("PrimaryTextColor"))

                    Spacer()

                    Image("Solid-Vertical")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 27, height: 27)
                }

                VStack {
                    HStack(spacing: 50) {
                        Image("Chevron-Left-Black")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45)

                        Text("March 2025")
                            .font(Font.custom("Righteous", size: 13).weight(.bold))
                            .foregroundColor(Color("PrimaryTextColor"))

                        Image("Chevron-Right-Black")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45)
                    }
                    .foregroundColor(.clear)
                    .frame(width: 317, height: 29)
                    .cornerRadius(60)
                    .overlay(RoundedRectangle(cornerRadius: 60)
                        .inset(by: 0.60)
                        .stroke(Color(red: 0.04, green: 0.18, blue: 0.45), lineWidth: 1))
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 6), count: 7), spacing: 10) {
                        ForEach(1...31, id: \.self) { day in
                            CalendarDayView(day: day, mood: moodData[day])
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
                .frame(width: 354, height: 270)
                .background(.white)
                .cornerRadius(22)
                .overlay(RoundedRectangle(cornerRadius: 22.51)
                    .inset(by: 0.47)
                    .stroke(Color(red: 0.04, green: 0.18, blue: 0.45), lineWidth: 1))
                .shadow(color: Color(red: 0.85, green: 0.93, blue: 0.98, opacity: 0.60), radius: 0)
                
                Spacer()
            }
            .padding(.horizontal, 27)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CalendarMoodView()
}
