//
//  ToastConstants.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/9/26.
//

import Foundation
import SwiftUI

internal typealias ShadowRadius = CGFloat
internal typealias ShadowY = CGFloat

internal struct ToastConstants {
    
    static let SUCCESS_ICON: Color = Color(hex: 0x40D86A)
    static let INFO_ICON: Color = Color(hex: 0x0B80E3)
    static let ERROR_ICON: Color = Color(hex: 0xFF4B52)
    static let WARNING_ICON: Color = Color(hex: 0xFFB535)
    
    static let IPHONE_TOAST_ICON_FONT: Font = .largeTitle
    static let IPHONE_TOAST_TITLE_FONT: Font = .title3
    static let IPHONE_CLOSE_BUTTON_FONT: Font = .title2
    static let IPHONE_SHADOW_SPECS: (ShadowRadius, ShadowY) = (3.0, 5.0)
    
    static let IPAD_TOAST_ICON_FONT: Font = .system(size: 45)
    static let IPAD_TOAST_TITLE_FONT: Font = .title
    static let IPAD_TOAST_MESSAGE_FONT: Font = .title2
    static let IPAD_CLOSE_BUTTON_FONT: Font = .title
    static let IPAD_SHADOW_SPECS: (ShadowRadius, ShadowY) = (7.0, 7.0)
    
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
}
