import SwiftUI

struct EntryFieldView: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Write Your Entry")
                    .font(Font.custom("Righteous", size: 14).weight(.heavy))
                    .foregroundColor(Color("PrimaryTextColor"))
                Spacer()
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color(red: 0.045, green: 0.178, blue: 0.446), lineWidth: 1)
                    )
                    .shadow(color: Color(red: 0.847, green: 0.933, blue: 0.984, opacity: 0.6), radius: 0, x: 0, y: 0)
                    .shadow(color: Color(red: 0.847, green: 0.933, blue: 0.984, opacity: 0.6), radius: 4, x: 0, y: 0)
                
                VStack(alignment: .leading) {
                    TextField(placeholder, text: $text)
                        .font(.custom("Righteous", size: 14))
                        .foregroundColor(Color(red: 0.122, green: 0.086, blue: 0.059, opacity: 0.64))
                        .padding(.top, 3)
                        .padding(.leading, 2)
                    
                    Spacer()
                }
                .padding(16)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .frame(height: 272)
        }
    }
}

#Preview {
    EntryFieldView(text: .constant(""), placeholder: "Insert Text Here....")
}
