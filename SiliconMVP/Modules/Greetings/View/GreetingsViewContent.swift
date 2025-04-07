//
//  GreetingsViewContent.swift
//  SiliconMVP
//
//  Created by Егорио on 05.04.2025.
//

import SwiftUI

struct GreetingsViewContent: View {
    let onNext: () -> Void
    
    var body: some View {
        ZStack {
            Theme.Colors.background
                .ignoresSafeArea()
            
            FloatingCirclesBackground(count: 10)
            
            VStack(alignment: .leading, spacing: 20) {
                
                Spacer()
                
                Text("Silicon")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.Colors.text)
                
                Text("Создавай, презентуй, вдохновляй - где бы ты ни был!")
                    .font(Theme.SwiftUITypography.bodyLarge)
                    .foregroundStyle(Theme.Colors.text)
                
                CustomButtonView(title: "Поехали!", isFill: true) {
                    onNext()
                }
                .frame(height: 50)
            }
            .padding(30)
        }
    }
}

#Preview {
    GreetingsViewContent(onNext: {})
}
