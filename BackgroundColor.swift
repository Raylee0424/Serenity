//
//  BackgroundColor.swift
//  Serenity
//
//  Created by Raylee on 2/27/25.
//

import Foundation
import SwiftUI

struct BackgroundColor: View {
    var body: some View {
//        LinearGradient(
//            colors: [Color("PrimaryColor"), Color("SecondaryColor")],
//            startPoint: .topTrailing,
//            endPoint: .bottomTrailing
//        )
//        .ignoresSafeArea()
        Color.white
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundColor()
}
