//
//  Font+Extension.swift
//  SiliconMVP
//
//  Created by Егорио on 05.04.2025.
//

import SwiftUI

extension Font {
    
    // MARK: - Mulish Font
    
    static func mulishRegular(size: CGFloat) -> Font {
        return Font.custom("MulishRoman-Regular", size: size)
    }
    
    static func mulishMedium(size: CGFloat) -> Font {
        return Font.custom("MulishRoman-Medium", size: size)
    }
    
    static func mulishSemiBold(size: CGFloat) -> Font {
        return Font.custom("MulishRoman-SemiBold", size: size)
    }
    
    static func mulishBold(size: CGFloat) -> Font {
        return Font.custom("MulishRoman-Bold", size: size)
    }
    
    // MARK: - Manrope Font
    
    static func manropeRegular(size: CGFloat) -> Font {
        return Font.custom("Manrope-Regular", size: size)
    }
    
    static func manropeMedium(size: CGFloat) -> Font {
        return Font.custom("Manrope-Medium", size: size)
    }
    
    static func manropeSemiBold(size: CGFloat) -> Font {
        return Font.custom("Manrope-SemiBold", size: size)
    }
    
    static func manropeBold(size: CGFloat) -> Font {
        return Font.custom("Manrope-Bold", size: size)
    }
} 