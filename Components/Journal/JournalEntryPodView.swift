import SwiftUI

//IMAGE, COLOR, TEXT

struct JournalEntryPodView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    HStack {
                        Image("Angry")
                            .resizable()
                            .scaledToFit()
                            .frame(width:27, height: 27)
                    }
                    .frame(width: 41, height: 41)
                    .background(Color("RedBackground"))
                    .cornerRadius(14)
                    
                    Spacer()
                    
                    Image("Solid-Horizontal-Grey")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                
                VStack(alignment: .leading, spacing: 7) {
                    HStack {
                        Text("MOOD: ANGRY")
                            .font(Font.custom("Righteous", size: 8.48).weight(.heavy))
                            .tracking(0.85)
                            .foregroundColor(Color(red: 0.87, green: 0.25, blue: 0.27))
                    }
                    .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                    .background(Color("RedBackground"))
                    .cornerRadius(85)
                    
                    HStack {
                        Text("Why Is It Always Me?")
                          .font(Font.custom("Urbanist", size: 15.26).weight(.bold))
                          .foregroundColor(Color("PrimaryTextColor"))
                    }
                    
                    HStack {
                        Text("Ugh. Today tested my patience in every way")
                          .font(Font.custom("Urbanist", size: 10).weight(.medium))
                          .foregroundColor(Color("DefaultTextColor"))
                    }
                }
            }
        }
        .padding(14)
        .frame(width: 191)
        .background(.white)
        .cornerRadius(27)
        .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 13.56, y: 6.78)
    }
}

#Preview {
    JournalEntryPodView()
}
