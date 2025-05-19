import SwiftUI

struct JournalEntryView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var dataManager = JournalDataManager()
    
    var body: some View {
        ZStack {
            Color("WhiteBackground")
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                // Back Button
                Button(action: { dismiss() }) {
                    Image("Back-Button-Black")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48)
                }
                
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your Entries")
                        .font(Font.custom("Righteous", size: 36))
                        .foregroundColor(Color("PrimaryTextColor"))
                    Text("Document your Mental Journal.")
                        .font(Font.custom("Righteous", size: 18))
                        .foregroundColor(Color("DefaultTextColor"))
                }
                
                // Content
                HStack {
                    Text("All Journals")
                        .font(Font.custom("Righteous", size: 18).weight(.heavy))
                        .foregroundColor(Color("PrimaryTextColor"))
                }
                .padding(.top, 30)
                
                // Grid View
                let columns = [GridItem(.flexible(), spacing: 14), GridItem(.flexible(), spacing: 14)]
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(dataManager.entries) { entry in
                            JournalEntryPodView(entry: entry)
                        }
                    }
                    .padding(.top, 16)
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    JournalEntryView()
}
