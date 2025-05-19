import SwiftUI

struct ArticleView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // Header Section
                ZStack {
                    VStack {
                        HStack {
                            Image("Back-Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Our Articles")
                                .font(Font.custom("Righteous", size: 42))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                        // Search Bar
                        ZStack {
                            RoundedRectangle(cornerRadius: 36.72)
                                .fill(Color.white)
                                .frame(height: 64.27)
                            
                            HStack {
                                Text("Search for articles here...")
                                    .font(.custom("Righteous", size: 16.07))
                                    .foregroundColor(Color("DefaultTextColor"))
                                
                                Spacer()
                                
                                Image("Monotone-Search")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28, height: 28)
                            }
                            .padding(.horizontal, 18.36)
                        }
                        .frame(maxWidth: 387)
                    }
                    .padding(.horizontal, 20)
                }
                .offset(y: 20)
                .frame(width: 435, height: 288)
                .background(Color("PrimaryBackgroundColor"))
                .cornerRadius(50)
                .padding(.bottom, 10)
                
                // Content Section
                VStack(spacing: 15) {
                    // All Articles Section
                    HStack {
                        Text("All Articles")
                            .font(Font.custom("Righteous", size: 20.66).weight(.heavy))
                            .foregroundColor(Color("PrimaryTextColor"))
                        Spacer()
                        Image("Solid-Vertical")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                    }
                    .padding(.horizontal, 30)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(sampleArticles) { article in
                                NavigationLink {
                                    ArticlePageView(article: article)
                                } label: {
                                    BlogCard(article: article)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                    
                    // Suggested Topics Section
                    HStack {
                        Text("Suggested Topics")
                            .font(Font.custom("Righteous", size: 20.66))
                            .foregroundColor(Color("PrimaryTextColor"))
                        Spacer()
                        Text("See All")
                            .font(Font.custom("Righteous", size: 13.77))
                            .foregroundColor(Color("DefaultTextColor"))
                    }
                    .padding(.horizontal, 30)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(topics) { topic in
                                SuggestedTopicsView(icon: topic.icon, title: topic.title)
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                }
                .padding(.horizontal, 30)
            }
            .edgesIgnoringSafeArea(.all)
            .background(Color("WhiteBackground"))
        }
    }
}

#Preview {
    ArticleView()
}
