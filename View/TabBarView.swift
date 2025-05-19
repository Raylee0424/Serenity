import SwiftUI

enum Tab {
    case home
    case article
    case music
    case profile
}

struct TabBarView: View {
    @Binding var selectedTab: Tab
    var onPlusPressed: () -> Void
    
    var body: some View {
        ZStack {
            // Plus Button
            Button(action: onPlusPressed) {
                Image("Plus-Button")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .offset(y: 25)
                    .contentShape(Rectangle()) // For proper hit testing
            }
            .buttonStyle(.plain)
            .offset(y: -40)
            .shadow(color: Color(red: 0.80, green: 0.87, blue: 0.95), radius: 32, y: 16)
            
            // Tab Bar Background
            Image("TabBarBackground")
                .resizable()
                .ignoresSafeArea()
                .frame(width: 490, height: 140)
            
            // Tab Buttons
            HStack(spacing: 140) {
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
    
    private func tabButton(icon: String, tab: Tab) -> some View {
        Button {
            selectedTab = tab
        } label: {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .opacity(selectedTab == tab ? 1 : 0.5)
        }
    }
}

struct TabViewModel: View {
    @ObservedObject var userData: UserData
    @State private var selectedTab: Tab = .home
    @State private var showingNewJournal = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Main Content
                Group {
                    switch selectedTab {
                    case .home:
                        HomeView(selectedTab: $selectedTab)
                            .offset(y: -40)
                    case .article:
                        ArticleView()
                            .offset(y: -40)
                    case .music:
                        ExerciseView()
                    case .profile:
                        ProfileView(userData: userData)
                            .offset(y: -40)
                    }
                }
                
                // Tab Bar
                VStack {
                    Spacer()
                    TabBarView(selectedTab: $selectedTab) {
                        showingNewJournal = true
                    }
                }
            }
            .navigationDestination(isPresented: $showingNewJournal) {
                NewJournalEntryView()
                    .navigationBarBackButtonHidden()
            }
            .edgesIgnoringSafeArea(.all)
            .background(Color("WhiteBackground"))
        }
    }
}

#Preview {
    TabViewModel(userData: UserData())
}
