//
//  LoginViewContent.swift
//  SiliconMVP
//
//  Created by AI Assistant.
//

import SwiftUI

struct LoginViewContent: View {
    
    let emailError: String?
    let passwordError: String?
    let isLoading: Bool
    let onLoginTapped: (String, String) -> Void
    let onBackTapped: () -> Void
    
    var body: some View {
        ZStack {
            Theme.Colors.background
                .ignoresSafeArea()
            
            FloatingCirclesBackground(count: 10)
            
            VStack(alignment: .leading, spacing: 20) {
                
            }
        }
    }
}
