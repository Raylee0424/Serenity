import SwiftUI

struct SecurityInputFieldView: View {
    
    @Binding var text: String
    var title: String
    var inputLogo: String
    var placeholder: String
    var rightLogo: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 9.15) {
            VStack(alignment: .leading, spacing: 9.15) {
                Text(title)
                    .font(Font.custom("Righteous", size: 16.01))
                    .foregroundColor(Color(red: 0.04, green: 0.18, blue: 0.45))
                VStack(alignment: .leading, spacing: 11.43) {
                    HStack(spacing: 40) {
                        HStack(spacing: 9.15) {
                            Image(inputLogo)
                                .resizable()
                                .frame(width: 22.86, height: 20.58)
                            
                            SecureField(placeholder, text: $text)
                                .font(Font.custom("Righteous", size: 16.01))
                                .foregroundColor(Color("DefaultTextColor"))
                        }
                        .frame(width: 290, alignment: .leading)
                        Image(rightLogo)
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(18.29)
                .frame(height: 64.02)
                .background(.white)
                .cornerRadius(1000)
                .shadow(
                    color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.15), radius: 18.29, y: 9.15
                )
            }
            .frame(width: 393)
        }
    }
}

#Preview {
    SecurityInputFieldView(text: .constant(""), title: "Text", inputLogo: "Monotone-Lock", placeholder: "Sample", rightLogo: "Monotone-Edit")
}

