import SwiftUI

struct ArticlePageView: View {
    let article: BlogArticle
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header Section
                VStack(alignment: .leading, spacing: 24) {
                    HStack(spacing: 12) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image("Back-Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48, height: 48)
                        }
                        
                        Text("Articles")
                            .font(Font.custom("Righteous", size: 20))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(article.category)
                            .font(Font.custom("Righteous", size: 12))
                            .tracking(1.2)
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.white, lineWidth: 0.5)
                            )
                        
                        Text(article.title)
                            .font(Font.custom("Righteous", size: 36))
                            .lineSpacing(3)
                            .foregroundColor(.white)
                        
                        Text(article.author)
                            .font(Font.custom("Righteous", size: 14))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 30)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .frame(width: 435, height: 360)
                .background(Color("PrimaryBackgroundColor"))
                .cornerRadius(50)
                .padding(.bottom, 10)
                
                // Article Content
                VStack(spacing: 20) {
                    Image(article.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        .background(.white)
                        .cornerRadius(32)
                        .padding(.top, 20)
                    
                    Text(article.content)
                        .font(.system(size: 16))
                        .lineSpacing(8)
                        .padding(20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
        .navigationBarBackButtonHidden(true) // Hide default iOS back button
    }
}

#Preview {
    ArticlePageView(article: sampleArticles[0])
}
