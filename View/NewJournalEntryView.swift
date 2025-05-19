import SwiftUI

let emotions = ["Happy", "Satisfied", "Neutral", "Sad", "Angry", "Tired"]

struct NewJournalEntryView: View {
    
    @State private var entryText = ""
    
    var body: some View {
        ZStack {
            Color("WhiteBackground")
                .ignoresSafeArea()
            VStack {
                HStack(spacing: 12) {
                    Image("Back-Button-Black")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                    Text("New Journal Entry")
                      .font(Font.custom("Righteous", size: 20))
                      .foregroundColor(Color("PrimaryTextColor"))
                    Spacer()
                }
                .padding(.bottom, 26)
                
                VStack(spacing: 32) {
                    InputFieldRoundedView(text: .constant(""),
                                          title: "Text",
                                          inputLogo: "Monotone-Document",
                                          placeholder: "Sample",
                                          rightLogo: "Monotone-Edit",
                                          isSecureField: false)
                    
                    VStack(spacing: 12) {
                        HStack {
                            Text("Select Your Emotion")
                                .font(Font.custom("Righteous", size: 14).weight(.heavy))
                                .foregroundColor(Color("PrimaryTextColor"))
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 18) {
                                ForEach(emotions, id: \.self) { emotion in
                                    VStack {
                                        Image(emotion)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                    }
                                }
                            }
                        }
                    }
                    
                    EntryFieldView(text: .constant(""), placeholder: "Insert Text Here....")
                }
                .padding(.bottom, 30)
                
                RoundedButtonView(text: "Create Journal")
            }
            .padding(.horizontal, 15)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    NewJournalEntryView()
}
