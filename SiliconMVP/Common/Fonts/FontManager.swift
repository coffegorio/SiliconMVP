//
//  FontManager.swift
//  SiliconMVP
//
//  Created by Егорио on 02.04.2025.
//

import UIKit

enum FontName: String {
    case mulish = "MulishRoman"
    case manrope = "Manrope"
}

enum FontWeight: String {
    case regular = "Regular"
    case medium = "Medium"
    case semiBold = "SemiBold"
    case bold = "Bold"
    case extraLight = "ExtraLight"
}

struct FontManager {
    
    // Перемещаем переменную на уровень структуры
    private static var registeredFonts: Set<FontName> = []
    
    // Получает шрифт нужного семейства и начертания
    static func font(name: FontName, weight: FontWeight, size: CGFloat) -> UIFont {
        registerFontIfNeeded(name: name)
        
        let fontName: String
        if name == .mulish {
            fontName = "\(name.rawValue)-\(weight.rawValue)"
        } else {
            fontName = "\(name.rawValue)-\(weight.rawValue)"
        }
        
        if let font = UIFont(name: fontName, size: size) {
            return font
        } else {
            print("⚠️ Font not found: \(fontName), falling back to system font")
            return .systemFont(ofSize: size)
        }
    }
    
    // Mulish helper methods
    static func mulish(size: CGFloat, weight: FontWeight = .regular) -> UIFont {
        return font(name: .mulish, weight: weight, size: size)
    }
    
    // Manrope helper methods
    static func manrope(size: CGFloat, weight: FontWeight = .regular) -> UIFont {
        // Для Manrope не используем ExtraLight, так как он может быть недоступен
        let safeWeight: FontWeight = weight == .extraLight ? .regular : weight
        return font(name: .manrope, weight: safeWeight, size: size)
    }
    
    // Регистрирует шрифты если необходимо
    private static func registerFontIfNeeded(name: FontName) {
        // Проверяем, не регистрировали ли мы уже этот шрифт
        if registeredFonts.contains(name) {
            return
        }
        
        // Получаем имя файла шрифта
        let fontFileName: String
        switch name {
        case .mulish:
            fontFileName = "Mulish.ttf"
        case .manrope:
            fontFileName = "Manrope.ttf"
        }
        
        // Регистрируем шрифт
        if let fontURL = Bundle.main.url(forResource: fontFileName, withExtension: nil),
           let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
           let font = CGFont(fontDataProvider) {
            
            var error: Unmanaged<CFError>?
            if CTFontManagerRegisterGraphicsFont(font, &error) {
                registeredFonts.insert(name)
                print("✅ Font registered: \(name.rawValue)")
            } else {
                // Обработка ошибки регистрации шрифта
                print("❌ Error registering font: \(name.rawValue) - \(error.debugDescription)")
            }
        } else {
            print("❌ Font file not found: \(fontFileName)")
        }
    }
}
