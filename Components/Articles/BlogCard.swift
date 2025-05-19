import SwiftUI

struct BlogCard: View {
    let article: BlogArticle
    
    var body: some View {
        ZStack {
            VStack {
                Image(article.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 186)
                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            VStack {
                Spacer()
                HStack {
                    Text(article.title)
                        .font(Font.custom("Righteous", size: 18.36))
                        .foregroundColor(Color(red: 0.06, green: 0.18, blue: 0.43))
                    Spacer()
                }
                .padding(.bottom, 25)
                .padding(.leading, 20)
            }
        }
        .frame(width: 265, height: 269)
        .background(Color.white)
        .cornerRadius(40)
    }
}

#Preview {
    BlogCard(article: sampleArticles[0])
}
