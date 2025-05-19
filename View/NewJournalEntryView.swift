import SwiftUI

struct NewJournalEntryView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var journalData: JournalDataManager
    @State private var title = ""
    @State private var content = ""
    @State private var selectedEmotion: String?
    
    let emotions = ["Happy", "Satisfied", "Neutral", "Sad", "Angry", "Tired"]
    
    var body: some View {
        ZStack {
            Color("WhiteBackground")
                .ignoresSafeArea()
            
            VStack {
                // Header
                HStack(spacing: 12) {
                    Button(action: { dismiss() }) {
                        Image("Back-Button-Black")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    
                    Text("New Journal Entry")
                        .font(.custom("Righteous", size: 20))
                        .foregroundColor(Color("PrimaryTextColor"))
                    
                    Spacer()
                }
                .padding(.bottom, 26)
                
                // Content
                VStack(spacing: 32) {
                    // Title Input (Fixed parameters)
                    InputFieldRoundedView(
                        text: $title,
                        title: "Title",
                        inputLogo: "Monotone-Document",
                        placeholder: "Enter title...",
                        rightLogo: "Monotone-Edit", // Added parameter
                        isSecureField: false // Added parameter
                    )
                    
                    // Emotion Selection
                    VStack(spacing: 12) {
                        HStack {
                            Text("Select Your Emotion")
                                .font(.custom("Righteous", size: 14).weight(.heavy))
                                .foregroundColor(Color("PrimaryTextColor"))
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 18) {
                                ForEach(emotions, id: \.self) { emotion in
                                    Button {
                                        selectedEmotion = emotion
                                    } label: {
                                        Image(emotion)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .opacity(selectedEmotion == emotion ? 1 : 0.5)
                                    }
                                }
                            }
                        }
                    }
                    
                    // Content Input
                    EntryFieldView(text: $content, placeholder: "Write your thoughts...")
                }
                .padding(.bottom, 30)
                
                // Save Button
                Button(action: saveEntry) {
                    RoundedButtonView(text: "Create Journal")
                }
            }
            .padding(.horizontal, 15)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private func saveEntry() {
        guard !title.isEmpty, !content.isEmpty, let emotion = selectedEmotion else { return }
        
        let newEntry = JournalDataModel(
            title: title,
            content: content,
            mood: Mood(rawValue: emotion.lowercased()) ?? .neutral,
            date: Date()
        )
        
        journalData.addEntry(newEntry)
        dismiss()
    }
}

struct EmotionSelectionView: View {
    @Binding var selectedEmotion: String?
    let emotions = ["Happy", "Satisfied", "Neutral", "Sad", "Angry", "Tired"]
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Select Your Emotion")
                    .font(.custom("Righteous", size: 14).weight(.heavy))
                    .foregroundColor(Color("PrimaryTextColor"))
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    ForEach(emotions, id: \.self) { emotion in
                        Button {
                            selectedEmotion = emotion
                        } label: {
                            Image(emotion)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .opacity(selectedEmotion == emotion ? 1 : 0.5)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewJournalEntryView()
        .environmentObject(JournalDataManager())
}
