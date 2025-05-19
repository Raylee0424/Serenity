import SwiftUI

struct CommunityArticleView: View {
    let article: BlogArticle
    
    var body: some View {
        NavigationLink(destination: ArticlePageView(article: article)) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 16) {
                    // Category Badge
                    HStack {
                        Text(article.category.uppercased())
                            .font(Font.custom("Righteous", size: 10))
                            .tracking(1)
                            .foregroundColor(Color(red: 0.50, green: 0.66, blue: 0.97))
                    }
                    .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                    .background(Color(red: 0.95, green: 0.96, blue: 0.97))
                    .cornerRadius(100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .inset(by: 0.50)
                            .stroke(Color(red: 0.04, green: 0.18, blue: 0.45), lineWidth: 0.50)
                    )
                    
                    // Article Title
                    VStack {
                        Text(article.title)
                            .font(Font.custom("Righteous", size: 17))
                            .foregroundColor(Color(red: 0, green: 0.18, blue: 0.55))
                    }
                    .frame(width: 198)
                    
                    // Author
                    Text("By \(article.author)")
                        .font(Font.custom("Righteous", size: 10))
                        .tracking(1)
                        .foregroundColor(Color(red: 0.50, green: 0.66, blue: 0.97))
                }
            }
            .padding(16)
            .background(.white)
            .cornerRadius(24)
            .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 16, y: 8)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CommunityArticleView(article: sampleArticles[0])
}
