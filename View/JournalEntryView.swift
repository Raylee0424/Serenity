import SwiftUI

struct JournalEntryView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var entries: [JournalDataModel]
    
    var body: some View {
        ZStack {
            Color("WhiteBackground").ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                // Back button
                Button(action: { dismiss() }) {
                    Image("Back-Button-Black")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48)
                }
                
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your Entries")
                        .font(.custom("Righteous", size: 36))
                    Text("Document your Mental Journal.")
                        .font(.custom("Righteous", size: 18))
                }
                
                // Section title
                Text("All Journals")
                    .font(.custom("Righteous", size: 18).weight(.heavy))
                    .padding(.top, 10)

                // Journal list
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(entries) { entry in
                            JournalEntryPodView(entry: entry)
                        }
                    }
                    .padding(.top, 8)
                }

                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    JournalEntryView(entries: .constant(JournalData.sampleEntries))
}
