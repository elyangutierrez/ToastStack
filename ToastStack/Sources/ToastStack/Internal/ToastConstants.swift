//
//  ToastConstants.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/9/26.
//

import Foundation
import SwiftUI

internal struct ToastColor {
    let light: Color
    let dark: Color
}

internal struct ToastConstants {
    
    static let SUCCESS_BACKGROUND: ToastColor = ToastColor(
        light: Color(hex: 0xC0F1CE),
        dark: Color(hex: 0x0E3E1B)
    )
    
    static let WARNING_BACKGROUND: ToastColor = ToastColor(
        light: Color(hex: 0xF1E0C0),
        dark: Color(hex: 0x3F2D0E)
    )
    
    static let INFO_BACKGROUND: ToastColor = ToastColor(
        light: Color(hex: 0xC0DBF1),
        dark: Color(hex: 0x0E283F)
    )
    
    static let ERROR_BACKGROUND: ToastColor = ToastColor(
        light: Color(hex: 0xF1C0C2),
        dark: Color(hex: 0x3F0E10)
    )
    
    static let SUCCESS_FOREGROUND: ToastColor = ToastColor(
        light: Color(hex: 0x1E943F),
        dark: Color(hex: 0xD5F6DE)
    )
    
    static let WARNING_FOREGROUND: ToastColor = ToastColor(
        light: Color(hex: 0xB27100),
        dark: Color(hex: 0xFFECCC)
    )
    
    static let INFO_FOREGROUND: ToastColor = ToastColor(
        light:  Color(hex: 0x0860AA),
        dark: Color(hex: 0xCEE7FD)
    )
    
    static let ERROR_FOREGROUND: ToastColor = ToastColor(
        light: Color(hex: 0xB20007),
        dark: Color(hex: 0xFFCCCE)
    )
    
    static let SUCCESS_ICON: Color = Color(hex: 0x40D86A)
    static let INFO_ICON: Color = Color(hex: 0x0B80E3)
    static let ERROR_ICON: Color = Color(hex: 0xFF4B52)
    static let WARNING_ICON: Color = Color(hex: 0xFFB535)
}
