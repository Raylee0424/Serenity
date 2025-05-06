import SwiftUI

struct BackgroundField: View {
    var iconName: String
    var hiddenIconName: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var validationState: ValidationState

    var borderColor: Color {
        switch validationState {
        case .normal:
            return Color.clear
        case .success:
            return Color.green
        case .error:
            return Color.red
        }
    }
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(height: 60)
                    .shadow(color: .gray.opacity(0.7), radius: 7, x: 0, y: 3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(borderColor, lineWidth: 2)
                    )
                
                HStack {
                    LoginIcon(iconName: iconName)
                    
                    ZStack(alignment: .leading) {
                        if text.isEmpty {
                            Text(placeholder)
                                .font(Font.custom("Righteous-Regular", size: 20))
                                .foregroundColor(Color("DefaultColorText"))
                        }
                        
                        if isSecure {
                            SecureField("", text: $text)
                                .font(Font.custom("Righteous-Regular", size: 20))
                                .foregroundColor(Color("DefaultColorText"))
                        } else {
                            TextField("", text: $text)
                                .font(Font.custom("Righteous-Regular", size: 20))
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .foregroundColor(Color("DefaultColorText"))
                        }
                    }
                    
                    LoginIcon(iconName: hiddenIconName)
                        .padding(.horizontal, 10)
                }
            }
            .padding(.horizontal, 15)
        }
        .padding(.bottom, 10)
    }
}
