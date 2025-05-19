import SwiftUI

struct JournalEntryView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var entries: [JournalDataModel]
    
    var body: some View {
        ZStack {
            Color("WhiteBackground").ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Button(action: { dismiss() }) {
                    Image("Back-Button-Black")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your Entries")
                        .font(.custom("Righteous", size: 36))
                    Text("Document your Mental Journal.")
                        .font(.custom("Righteous", size: 18))
                }
                
                VStack {
                    Text("All Journals")
                        .font(.custom("Righteous", size: 18).weight(.heavy))
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 14), GridItem(.flexible())], spacing: 12) {
                            ForEach(entries) { entry in
                                JournalEntryPodView(entry: entry)
                            }
                        }
                        .padding(.top, 16)
                    }
                }
                .padding(.top, 30)
                
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
