//
//  UIFont+Extension.swift
//  SiliconMVP
//
//  Created by Егорио on 05.04.2025.
//

import UIKit

extension UIFont {
    
    // MARK: - Mulish Font
    
    static func mulishRegular(size: CGFloat) -> UIFont {
        return FontManager.mulish(size: size, weight: .regular)
    }
    
    static func mulishMedium(size: CGFloat) -> UIFont {
        return FontManager.mulish(size: size, weight: .medium)
    }
    
    static func mulishSemiBold(size: CGFloat) -> UIFont {
        return FontManager.mulish(size: size, weight: .semiBold)
    }
    
    static func mulishBold(size: CGFloat) -> UIFont {
        return FontManager.mulish(size: size, weight: .bold)
    }
    
    // MARK: - Manrope Font
    
    static func manropeRegular(size: CGFloat) -> UIFont {
        return FontManager.manrope(size: size, weight: .regular)
    }
    
    static func manropeMedium(size: CGFloat) -> UIFont {
        return FontManager.manrope(size: size, weight: .medium)
    }
    
    static func manropeSemiBold(size: CGFloat) -> UIFont {
        return FontManager.manrope(size: size, weight: .semiBold)
    }
    
    static func manropeBold(size: CGFloat) -> UIFont {
        return FontManager.manrope(size: size, weight: .bold)
    }
} 