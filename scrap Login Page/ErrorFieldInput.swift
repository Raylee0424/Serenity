import SwiftUI

struct ErrorFieldInput: View {
    
    var errorText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("ErrorColor"))
                .stroke(Color.red, lineWidth: 2)
                .frame(height: 60)
            HStack {
                Image("Solid-Warning")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                Text(errorText)
                    .foregroundColor(Color("ErrorTextColor"))
                    .font(Font.custom("Righteous-Regular", size: 20))
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal, 15)
        .padding(.top, 10)
    }
}

#Preview {
    ErrorFieldInput(errorText: "Error Test")
}
