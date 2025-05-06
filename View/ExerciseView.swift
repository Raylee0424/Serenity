import SwiftUI

struct ExerciseView: View {
    var body: some View {
        VStack {
            ZStack() {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 375, height: 500)
                    .background(Color(red: 0.20, green: 0.29, blue: 0.46))
                    .cornerRadius(47.40)
                    .shadow(
                    color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 0
                    )
                    .padding(.top, 15)
                VStack(spacing: 18.36) {
                    Image("Disc")
                        .resizable()
                        .frame(width: 248.78, height: 247.90)
                    VStack(spacing: 11.92) {
                        Text("Deep Breathing Exercises \nfor Beginners")
                            .font(Font.custom("Righteous", size: 26))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    HStack(spacing: 22.81) {
                        Text("1:23")
                            .font(Font.custom("Righteous", size: 13.50))
                            .foregroundColor(.white)
                    HStack(spacing: 3.37) {
                        Image("MusicWave")
                            .resizable()
                            .frame(width: 200, height: 49)
                    }
                        Text("3:06")
                            .font(Font.custom("Righteous", size: 13.50))
                            .foregroundColor(.white)
                    }
                    HStack(spacing: 35.75) {
                        Image("Solid-Rotate-Left")
                            .resizable()
                            .frame(width: 23.83, height: 23.83)
                    ZStack() {
                        Image("Solid-Pause")
                            .resizable()
                            .frame(width: 23.83, height: 23.83)
                    }
                    .frame(width: 59.58, height: 59.58)
                    .background(.white)
                    .cornerRadius(918.96)
                    .shadow(
                    color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.10), radius: 0
                    )
                        Image("Solid-Rotate-Right")
                            .resizable()
                            .frame(width: 23.83, height: 23.83)
                    }
                }
                .frame(width: 316.27, height: 499.29)
            }
            
            HStack {
                Text("History")
                    .font(Font.custom("Righteous", size: 20))
                    .foregroundColor(Color("PrimaryTextColor"))
                Spacer()
                Text("See All")
                    .font(Font.custom("Righteous", size: 15))
                    .foregroundColor(Color("DefaultTextColor"))
            }
            .frame(width: 370)
            
            VStack(alignment: .leading, spacing: 11.48) {
              HStack(spacing: 13.77) {
                HStack(spacing: 13.77) {
                  ZStack() {
                      Image("Play")
                          .resizable()
                          .scaledToFit()
                          .frame(width: 21, height: 21)
                  }
                  .frame(width: 73.46, height: 73.46)
                  .background(Color(red: 0.91, green: 0.93, blue: 0.98))
                  .cornerRadius(27.55)
                  VStack(alignment: .leading, spacing: 11.08) {
                    Text("Deep Breathing Exercises \nfor Beginners")
                      .font(Font.custom("Righteous", size: 18.36))
                      .foregroundColor(Color("PrimaryTextColor"))
                      
                      ZStack {
                          Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 263.53, height: 6.54)
                            .background(Color(red: 0.62, green: 0.67, blue: 0.78))
                            .cornerRadius(11.08)
                          HStack {
                              Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 184.72, height: 6.54)
                                  .background(Color(red: 0.20, green: 0.29, blue: 0.46))
                                  .cornerRadius(11.08)
                              Spacer()
                          }
                      }
                      
                      HStack(spacing: 210) {
                          Text("01:23")
                              .font(Font.custom("Righteous", size: 11.48))
                              .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                          Text("03:06")
                            .font(Font.custom("Righteous", size: 11.48))
                            .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                      }
                    
                  }
                  .frame(width: 280.06)
                }
                .frame(width: 369.59)
              }
              .frame(width: 369.59)
            }
            .padding(18.36)
            .frame(width: 393.69)
            .background(.white)
            .cornerRadius(36.73)
            .shadow(
              color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 18.36, y: 9.18
            )
            
            Spacer()
            TabBarView()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("WhiteBackground"))
    }
}

#Preview {
    ExerciseView()
}
