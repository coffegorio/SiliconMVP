//
//  OnboardingViewContent.swift
//  SiliconMVP
//
//  Created by Егорио on 08.04.2025.
//

import SwiftUI

struct OnboardingViewContent: View {
    let onLogin: () -> Void
    
    var body: some View {
        ZStack {
            Theme.Colors.background
                .ignoresSafeArea()
            
            FloatingCirclesBackground(count: 10)
            
            VStack(alignment: .leading, spacing: 20) {
                
                Spacer()
                
                Text("Добро пожаловать!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.Colors.text)
                
                Text("Войдите или создайте профиль, что бы начать работать над фантастическими презентациями!")
                    .font(Theme.SwiftUITypography.bodyLarge)
                    .foregroundStyle(Theme.Colors.text)
                
                CustomButtonView(title: "Начать", isFill: true) {
                    //
                }
                .frame(height: 50)
                
                CustomButtonView(title: "Войти", isFill: false) {
                    onLogin()
                }
                .frame(height: 50)
            }
            .padding(30)
        }
    }
}

#Preview {
    OnboardingViewContent(onLogin: {})
} 
