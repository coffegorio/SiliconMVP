//
//  Theme.swift
//  SiliconMVP
//
//  Created by Егорио on 05.04.2025.
//

import UIKit
import SwiftUI

// Структура для хранения всех констант темы приложения
struct Theme {
    
    // MARK: - Бекграундовый цвет и цвет текста
    struct Colors {
        static let background = Color("BackgroundColor")
        static let text = Color("TextColor")
    }
    
    // MARK: - Шрифты
    struct Typography {
        // Заголовки
        static let h1 = UIFont.mulishBold(size: 28)
        static let h2 = UIFont.mulishBold(size: 24)
        static let h3 = UIFont.mulishBold(size: 20)
        static let h4 = UIFont.mulishSemiBold(size: 18)
        
        // Основной текст
        static let bodyLarge = UIFont.manropeRegular(size: 16)
        static let bodyMedium = UIFont.manropeRegular(size: 14)
        static let bodySmall = UIFont.manropeRegular(size: 12)
        
        // Текст кнопок и ссылок
        static let buttonLarge = UIFont.manropeMedium(size: 16)
        static let buttonMedium = UIFont.manropeMedium(size: 14)
        static let buttonSmall = UIFont.manropeMedium(size: 12)
        
        // Выделенный текст
        static let caption = UIFont.manropeSemiBold(size: 12)
    }
    
    // MARK: - Typography for SwiftUI
    struct SwiftUITypography {
        // Заголовки
        static let h1 = Font.mulishBold(size: 28)
        static let h2 = Font.mulishBold(size: 24)
        static let h3 = Font.mulishBold(size: 20)
        static let h4 = Font.mulishSemiBold(size: 18)
        
        // Основной текст
        static let bodyLarge = Font.manropeRegular(size: 18)
        static let bodyMedium = Font.manropeRegular(size: 16)
        static let bodySmall = Font.manropeRegular(size: 14)
        
        // Текст кнопок и ссылок
        static let buttonLarge = Font.manropeMedium(size: 18)
        static let buttonMedium = Font.manropeMedium(size: 16)
        static let buttonSmall = Font.manropeMedium(size: 14)
        
        // Выделенный текст
        static let caption = Font.manropeSemiBold(size: 12)
    }
} 
