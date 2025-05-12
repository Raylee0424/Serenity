import SwiftUI

enum Tab {
    case home
    case article
    case music
    case profile
}

struct TabBarView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        ZStack {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .frame(width: 75, height: 75)
                .background(Color(red: 0.20, green: 0.29, blue: 0.46))
                .cornerRadius(1234)
                .shadow(color: Color(red: 0.80, green: 0.87, blue: 0.95, opacity: 1), radius: 32, y: 16)
                .offset(y: -40)
            VStack {
                Image("TabBarBackground")
                    .resizable()
            }
            .ignoresSafeArea()
            .frame(width: 490, height: 140)
            
            HStack (spacing: 140) {
                HStack(spacing: 45) {
                    tabButton(icon: "Monotone-Home", tab: .home)
                    tabButton(icon: "Monotone-News", tab: .article)
                }
                HStack(spacing: 45) {
                    tabButton(icon: "Monotone-Music", tab: .music)
                    tabButton(icon: "Monotone-Profile", tab: .profile)
                }
            }
            .offset(y: 17)
        }
        .offset(y: 15)
        .edgesIgnoringSafeArea(.all)
    }
    
    func tabButton(icon: String, tab: Tab) -> some View {
            Button(action: {
                selectedTab = tab
            }) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .opacity(selectedTab == tab ? 1.0 : 0.5)
            }
        }
}

struct icon: View {
    
    var icon: String
    
    var body: some View {
        Image(icon)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
    }
}

struct TabViewModel: View {
    @StateObject private var userData = UserData()
    @State private var selectedTab: Tab = .home

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selectedTab {
                case .home:
                    Text("Home View")
                case .article:
                    ArticleView()
                case .music:
                    ExerciseView()
                case .profile:
                    ProfileView(userData: userData)
                }
            }
            Spacer()
            TabBarView(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("WhiteBackground"))
    }
}

#Preview {
    TabViewModel()
}
