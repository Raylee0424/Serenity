import SwiftUI

struct ErrorFieldView: View {
    
    var title: String
    
    var body: some View {
        HStack(spacing: 4.57) {
            HStack(spacing: 9.15) {
                Image("Solid-Warning")
                    .resizable()
                    .frame(width: 22.86, height: 22.86)
                
                Text("ERROR: \(title)!")
                    .font(Font.custom("Righteous", size: 16.01))
                    .foregroundColor(Color("ErrorTextColor"))
                Spacer()
            }
        }
        .padding(13.72)
        .frame(width: 392.13)
        .background(Color(red: 1, green: 0.95, blue: 0.95))
        .cornerRadius(9.15)
        .overlay(
        RoundedRectangle(cornerRadius: 9.15)
        .stroke(Color(red: 0.98, green: 0.30, blue: 0.37), lineWidth: 0.57)
        )
    }
}

#Preview {
    ErrorFieldView(title: "Text")
}
