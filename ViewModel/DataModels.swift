import SwiftUI

struct BlogArticle: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let author: String
    let imageName: String
    let content: String
    let cardImage: String
}

let sampleArticles = [
    BlogArticle(
        title: "Anxiety: What it is, what to do",
        category: "HARVARD HEALTH BLOG",
        author: "By Francesca Coltrera",
        imageName: "ArticleImage",
        content: """
        Anxiety disorders are the most common mental health concern in the United States, affecting over 40 million adults. While anxiety symptoms vary widely, common signs include:
        
        • Persistent excessive worry
        • Restlessness or feeling on edge
        • Difficulty concentrating
        • Muscle tension
        • Sleep disturbances
        
        **Effective Management Strategies:**
        1. Cognitive Behavioral Therapy (CBT) - Helps identify and challenge negative thought patterns
        2. Mindfulness Meditation - 10 minutes daily can reduce stress hormones by up to 30%
        3. Regular Exercise - Boosts endorphins and improves stress resilience
        4. Breathing Techniques - 4-7-8 breathing (inhale 4s, hold 7s, exhale 8s)
        
        Recent studies show combining lifestyle changes with professional support can reduce anxiety symptoms by 60% within 3 months. Remember - occasional anxiety is normal, but persistent symptoms warrant professional consultation.
        """,
        cardImage: "BlogCard"
    ),
    BlogArticle(
        title: "Understanding Stress Management",
        category: "WELLNESS GUIDE",
        author: "By Dr. John Doe",
        imageName: "ArticleImage2",
        content: """
        Stress affects 77% of people physically and 73% psychologically. Key findings from our 2024 study:
        
        **Physical Impact:**
        - 48% report headaches
        - 35% experience fatigue
        - 27% have muscle tension
        
        **Psychological Effects:**
        😟 61% anxiety
        😴 56% sleep issues
        🤯 44% difficulty concentrating
        
        **Proven Relief Methods:**
        🧘♀️ Progressive Muscle Relaxation (PMR) - Reduces tension in 20 minutes
        📓 Journaling - Decreases stress biomarkers by 28%
        🌳 Nature Therapy - 15min daily outdoor exposure lowers cortisol
        🎵 Music Therapy - Slow tempo music (60bpm) slows heart rate
        
        "The key isn't eliminating stress, but developing healthy responses," says Dr. Jane Smith, our lead researcher.
        """,
        cardImage: "BlogCard2"
    ),
    BlogArticle(
        title: "Healthy Sleep Patterns",
        category: "SLEEP SCIENCE",
        author: "By Prof. Jane Smith",
        imageName: "ArticleImage3",
        content: """
        Adults need 7-9 hours sleep, yet 35% get less than 7. Our sleep study reveals:
        
        **Circadian Rhythm Facts:**
        🌞 Morning light exposure advances rhythm by 12 minutes/day
        🌙 Evening light delays it by 25 minutes/day
        
        **Sleep Hygiene Checklist:**
        ✅ Keep bedroom temperature at 65°F (18°C)
        ✅ Avoid screens 1 hour before bed
        ✅ Establish consistent sleep schedule (±30min)
        ✅ Limit caffeine after 2PM
        
        **Impact of Poor Sleep:**
        ⚠️ 29% higher diabetes risk
        ⚠️ 24% impaired cognitive function
        ⚠️ 18% increased inflammation
        
        Try our 4-7-8 breathing technique: Inhale 4s → Hold 7s → Exhale 8s. Repeat 4 cycles. 92% of participants reported faster sleep onset in clinical trials.
        """,
        cardImage: "BlogCard3"
    )
]

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
