import SwiftUI

struct JournalEntryPodView: View {
    let entry: JournalDataModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                // Mood icon
                Image(entry.mood.rawValue.capitalized)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 27, height: 27)
                    .padding(7)
                    .background(Color(entry.colorName))
                    .cornerRadius(14)

                VStack(alignment: .leading, spacing: 6) {
                    // Mood Label
                    Text("MOOD: \(entry.mood.rawValue.uppercased())")
                        .font(Font.custom("Righteous", size: 8.48).weight(.heavy))
                        .tracking(0.85)
                        .foregroundColor(Color(entry.colorName))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(entry.colorName).opacity(0.2))
                        .cornerRadius(85)
                    
                    // Title
                    Text(entry.title)
                        .font(Font.custom("Urbanist", size: 15.26).weight(.bold))
                        .foregroundColor(Color("PrimaryTextColor"))
                    
                    // Content
                    Text(entry.content)
                        .font(Font.custom("Urbanist", size: 10).weight(.medium))
                        .foregroundColor(Color("DefaultTextColor"))
                        .lineLimit(2)
                }
                
                Spacer()
                
                // Ellipsis icon
                Image("Solid-Horizontal-Grey")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .cornerRadius(16)
        .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 8, y: 4)
    }
}

#Preview {
    JournalEntryPodView(entry: JournalDataModel(
        title: "Sample Entry",
        content: "This is a sample journal entry content that is quite long to test wrapping in the list layout.",
        mood: .happy,
        date: Date()
    ))
}
