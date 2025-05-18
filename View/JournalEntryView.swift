import SwiftUI

struct JournalEntryView: View {
    var body: some View {
        ZStack {
            Color("WhiteBackground")
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                HStack() {
                    Image("Back-Button-Black")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48)
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your Entries")
                        .font(Font.custom("Righteous", size: 36))
                        .lineSpacing(44)
                        .foregroundColor(Color("PrimaryTextColor"))
                    Text("Document your Mental Journal.")
                        .font(Font.custom("Righteous", size: 18))
                        .lineSpacing(28.80)
                        .foregroundColor(Color("DefaultTextColor"))
                }
                
                HStack {
                    Text("All Journals")
                        .font(Font.custom("Righteous", size: 18).weight(.heavy))
                        .foregroundColor(Color("PrimaryTextColor"))
                }
                .padding(.top, 30)
                
                let columns = [
                    GridItem(.flexible(), spacing: 14),
                    GridItem(.flexible(), spacing: 14)
                ]

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(0..<10, id: \.self) { _ in
                            JournalEntryPodView()
                        }
                    }
                    .padding(.top, 16)
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    JournalEntryView()
}
