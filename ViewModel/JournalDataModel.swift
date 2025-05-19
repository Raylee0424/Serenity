import SwiftUI

enum Mood: String, CaseIterable {
    case angry, happy, sad, neutral, tired, satisfied // Added 'satisfied' case
}

struct JournalDataModel: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let mood: Mood
    let date: Date
    var colorName: String {
        switch mood {
        case .angry: return "RedBackground"
        case .happy, .satisfied: return "GreenBackground" // Group happy/satisfied
        case .sad: return "BlueBackground"
        case .neutral: return "GrayBackground"
        case .tired: return "YellowBackground"
        }
    }
}

class JournalDataManager: ObservableObject {
    @Published var entries: [JournalDataModel] = [
        JournalDataModel(
            title: "Why Is It Always Me?",
            content: "Ugh. Today tested my patience in every way",
            mood: .angry,
            date: Date()
        ),
        JournalDataModel(
            title: "Sunshine Day",
            content: "Felt productive and cheerful all day",
            mood: .happy,
            date: Date()
        ),
        JournalDataModel(
            title: "Empty Inside",
            content: "Couldn't shake off the melancholy feeling",
            mood: .sad,
            date: Date()
        ),
        JournalDataModel(
            title: "Just Another Day",
            content: "Nothing special, just routine activities",
            mood: .neutral,
            date: Date()
        ),
        JournalDataModel(
            title: "Exhausted",
            content: "Need to work on better sleep habits",
            mood: .tired,
            date: Date()
        )
    ]
    
    // Add new entry method
    func addEntry(_ entry: JournalDataModel) {
        entries.append(entry)
        // For future persistence, add save-to-disk here
    }
}
