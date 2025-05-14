import SwiftUI

struct SuggestedTopic: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
}

let topics: [SuggestedTopic] = [
    SuggestedTopic(icon: "Monotone-Brain", title: "Stress"),
    SuggestedTopic(icon: "Monotone-Hourglass", title: "Anxiety"),
    SuggestedTopic(icon: "Monotone-Briefcase", title: "Health"),
    SuggestedTopic(icon: "Monotone-Syringe", title: "Status"),
    SuggestedTopic(icon: "Monotone-Health", title: "Health")
]

struct ArticleView: View {
    var body: some View {
        VStack {
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
            
            VStack(spacing: 15) {
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
                        BlogCard()
                        BlogCard()
                        BlogCard()
                    }
                    .padding(.horizontal, 30)
                }
                
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
            
//            TabBarView()
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
    }
}

#Preview {
    ArticleView()
}
