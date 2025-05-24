import SwiftUI

struct HomeView: View {
    @Binding var selectedTab: Tab
    @Binding var entries: [JournalDataModel]
    @State private var showExerciseView = false
    @State private var showJournalEntries = false
    
    let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let moodImages: [String] = [
        "Happy", "Satisfied", "Tired", "Angry", "Happy", "Neutral", "Sad"
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                HomeTopView()
                
                // Community Articles Section
                VStack {
                    HStack {
                        Text("Community Articles")
                            .font(Font.custom("Righteous", size: 18))
                            .foregroundColor(Color("PrimaryTextColor"))
                        
                        Spacer()
                        
                        Text("See All")
                            .font(Font.custom("Righteous", size: 12))
                            .foregroundColor(Color(red: 0.44, green: 0.42, blue: 0.40))
                    }
                    
                    // In HomeView.swift
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 6) {
                            ForEach(sampleArticles) { article in
                                CommunityArticleView(article: article)
                            }
                        }
                    }
                }
                .padding(.horizontal, 30)
                
                // Recent Section
                HStack {
                    Text("Recent")
                        .font(Font.custom("Righteous", size: 18))
                        .foregroundColor(Color("PrimaryTextColor"))
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                // Mood History Card
                VStack(spacing: 15) {
                    HStack {
                        Text("Mood History")
                            .font(Font.custom("Righteous", size: 16))
                            .foregroundColor(Color("PrimaryTextColor"))
                        Spacer()
                        
                        NavigationLink(destination: CalendarMoodView()) {
                            Image("Solid-Horizontal-Blue")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    }
                    
                    HStack(spacing: 17) {
                        ForEach(Array(zip(days, moodImages)), id: \.0) { day, moodImage in
                            VStack(spacing: 8) {
                                Image(moodImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 34, height: 34)
                                Text(day)
                                    .font(Font.custom("Righteous", size: 12))
                                    .foregroundColor(Color("PrimaryTextColor"))
                            }
                        }
                    }
                }
                .padding(.horizontal, 19)
                .frame(width: 387, height: 122)
                .background(.white)
                .cornerRadius(24)
                .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 16, y: 8)
                
                // Continue Exercise Card
                Button {
                    selectedTab = .music
                    showExerciseView = true
                } label: {
                    HStack {
                        ZStack {
                            Image("Monotone-Hospital-Bed")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        .frame(width: 64, height: 64)
                        .background(Color(red: 0.91, green: 0.93, blue: 0.98))
                        .cornerRadius(24)
                        
                        VStack(alignment: .leading) {
                            Text("Continue Exercise")
                                .font(Font.custom("Righteous", size: 18))
                                .foregroundColor(Color("PrimaryTextColor"))
                            Text("3 Minutes Left")
                                .font(Font.custom("Righteous", size: 14))
                                .foregroundColor(Color("DefaultTextColor"))
                        }
                        Spacer()
                        
                        Image("Exercise-Load")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64)
                    }
                    .padding(16)
                    .frame(width: 387, height: 96)
                    .background(.white)
                    .cornerRadius(32)
                    .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 16, y: 8)
                }
                .navigationBarBackButtonHidden()
                
                // Journal Entries Card
                Button {
                    showJournalEntries = true
                } label: {
                    VStack {
                        HStack {
                            ZStack {
                                Image("Solid-Document-Health")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                            .frame(width: 64, height: 64)
                            .background(Color(red: 0.91, green: 0.93, blue: 0.98))
                            .cornerRadius(24)
                            
                            VStack(alignment: .leading) {
                                Text("Journal Entries")
                                    .font(Font.custom("Righteous", size: 18))
                                    .foregroundColor(Color("PrimaryTextColor"))
                                Text("2-Day Streak")
                                    .font(Font.custom("Righteous", size: 14))
                                    .foregroundColor(Color("DefaultTextColor"))
                            }
                            Spacer()
                            
                            Image("Streak")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 64)
                        }
                    }
                    .padding(16)
                    .frame(width: 387, height: 96)
                    .background(.white)
                    .cornerRadius(32)
                    .shadow(color: Color(red: 0.29, green: 0.20, blue: 0.15, opacity: 0.05), radius: 16, y: 8)
                }
                .navigationBarBackButtonHidden()
                
                
            }
            .padding(.horizontal, 16)
            .navigationDestination(isPresented: $showExerciseView) {
                ExerciseView()
            }
            .navigationDestination(isPresented: $showJournalEntries) {
                JournalEntryView(entries: $entries)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
    }
}

#Preview {
    HomeView(
        selectedTab: .constant(.home),
        entries: .constant(JournalData.sampleEntries)
    )
}
