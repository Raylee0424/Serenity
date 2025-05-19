import SwiftUI

struct JournalEntryPodView: View {
    let entry: JournalDataModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    HStack {
                        Image(entry.mood.rawValue.capitalized)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 27, height: 27)
                    }
                    .frame(width: 41, height: 41)
                    .background(Color(entry.colorName))
                    .cornerRadius(14)
                    
                    Spacer()
                    
                    Image("Solid-Horizontal-Grey")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                
                VStack(alignment: .leading, spacing: 7) {
                    HStack {
                        Text("MOOD: \(entry.mood.rawValue.uppercased())")
                            .font(Font.custom("Righteous", size: 8.48).weight(.heavy))
                            .tracking(0.85)
                            .foregroundColor(Color(entry.colorName))
                    }
                    .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                    .background(Color(entry.colorName).opacity(0.2))
                    .cornerRadius(85)
                    
                    HStack {
                        Text(entry.title)
                            .font(Font.custom("Urbanist", size: 15.26).weight(.bold))
                            .foregroundColor(Color("PrimaryTextColor"))
                    }
                    
                    HStack {
                        Text(entry.content)
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
    JournalEntryPodView(entry: JournalDataModel(
        title: "Sample Entry",
        content: "This is a sample journal entry content",
        mood: .happy,
        date: Date()
    ))
}
