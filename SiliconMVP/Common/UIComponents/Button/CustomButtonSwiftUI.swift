//
//  CustomButtonSwiftUI.swift
//  SiliconMVP
//
//  Created by Егорио on 08.04.2025.
//

import SwiftUI
import UIKit

struct CustomButtonView: UIViewRepresentable {
    let title: String
    let isFill: Bool
    let action: () -> Void
    
    func makeUIView(context: Context) -> CustomButton {
        let button = CustomButton(title: title, isFill: isFill)
        button.addTarget(context.coordinator, 
                         action: #selector(Coordinator.buttonTapped), 
                         for: .touchUpInside)
        return button
    }
    
    func updateUIView(_ uiView: CustomButton, context: Context) {
        uiView.setTitle(title, for: .normal)
        // Обновляем другие свойства, если они изменились
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }
    
    class Coordinator: NSObject {
        let action: () -> Void
        
        init(action: @escaping () -> Void) {
            self.action = action
        }
        
        @objc func buttonTapped() {
            action()
        }
    }
}

// Стиль кнопки для SwiftUI
struct CustomButtonStyle: ButtonStyle {
    let isFill: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Theme.SwiftUITypography.buttonMedium)
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(
                isFill ? Theme.Colors.text : Color.clear
            )
            .foregroundColor(
                isFill ? Theme.Colors.background : Theme.Colors.text
            )
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isFill ? Color.clear : Theme.Colors.text, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? (isFill ? 0.8 : 1.0) : 1.0)
            .background(
                configuration.isPressed && !isFill ? 
                    Theme.Colors.text.opacity(0.1) : Color.clear
            )
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

// Расширение для удобного использования
extension Button {
    func customStyle(isFill: Bool = true) -> some View {
        self.buttonStyle(CustomButtonStyle(isFill: isFill))
    }
}

// Пример использования:
struct CustomButtonPreview: View {
    var body: some View {
        VStack(spacing: 20) {
            // Вариант 1: Использование UIKit-обертки
            CustomButtonView(title: "Нажми меня (UIKit)", isFill: true) {
                print("Кнопка нажата!")
            }
            .frame(height: 50)
            
            // Вариант 2: Использование нативного SwiftUI с нашим стилем
            Button("Нажми меня (SwiftUI)") {
                print("Кнопка нажата!")
            }
            .customStyle(isFill: true)
            
            Button("Кнопка с обводкой") {
                print("Кнопка с обводкой нажата!")
            }
            .customStyle(isFill: false)
        }
        .padding()
    }
}

#Preview {
    CustomButtonPreview()
} 