//
//  Toast.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/8/26.
//

import Foundation
import SwiftUI

internal struct Toast: Identifiable, Equatable, Hashable {
    var id = UUID()
    var message: String
    var style: ToastStyle?
    var alignment: Alignment
    var content: AnyView?
    var action: ToastAction?
    
    init(
        message: String,
        style: ToastStyle,
        alignment: Alignment,
    ) {
        self.message = message
        self.style = style
        self.alignment = alignment
    }
    
    init(
        message: String,
        alignment: Alignment,
        action: ToastAction
    ) {
        self.message = message
        self.alignment = alignment
        self.action = action
    }
    
    init<Content: View>(
        message: String = "",
        style: ToastStyle = .success,
        alignment: Alignment,
        @ViewBuilder content: () -> Content
    ) {
        self.message = message
        self.style = style
        self.alignment = alignment
        self.content = AnyView(content())
    }
    
    var title: String {
        
        guard let style else { return "N/A" }
        
        return style.rawValue
    }
    
    var icon: String {
        
        guard let style else { return "questionmark" }
        
        switch style {
        case .success:
            return "checkmark.circle.fill"
        case .error:
            return "xmark.circle.fill"
        case .info:
            return "info.circle.fill"
        case .warning:
            return "exclamationmark.circle.fill"
        }
    }
    
    var iconColor: Color {
        
        guard let style else { return .gray }
        
        switch style {
        case .success:
            return ToastConstants.SUCCESS_ICON
        case .error:
            return ToastConstants.ERROR_ICON
        case .info:
            return ToastConstants.INFO_ICON
        case .warning:
            return ToastConstants.WARNING_ICON
        }
    }
    
    func toastBackgroundColor(for colorScheme: ColorScheme) -> Color {
        
        guard let style else { return .gray }
        
        switch style {
        case .success:
            return colorScheme == .light ? ToastConstants.SUCCESS_BACKGROUND.light : ToastConstants.SUCCESS_BACKGROUND.dark
        case .error:
            return colorScheme == .light ? ToastConstants.ERROR_BACKGROUND.light : ToastConstants.ERROR_BACKGROUND.dark
        case .info:
            return colorScheme == .light ? ToastConstants.INFO_BACKGROUND.light : ToastConstants.INFO_BACKGROUND.dark
        case .warning:
            return colorScheme == .light ? ToastConstants.WARNING_BACKGROUND.light : ToastConstants.WARNING_BACKGROUND.dark
        }
    }
    
    func toastForegroundColor(for colorScheme: ColorScheme) -> Color {
        
        guard let style else { return .gray }
        
        switch style {
        case .success:
            return colorScheme == .light ? ToastConstants.SUCCESS_FOREGROUND.light : ToastConstants.SUCCESS_FOREGROUND.dark
        case .error:
            return colorScheme == .light ? ToastConstants.ERROR_FOREGROUND.light : ToastConstants.ERROR_FOREGROUND.dark
        case .info:
            return colorScheme == .light ? ToastConstants.INFO_FOREGROUND.light : ToastConstants.INFO_FOREGROUND.dark
        case .warning:
            return colorScheme == .light ? ToastConstants.WARNING_FOREGROUND.light : ToastConstants.WARNING_FOREGROUND.dark
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: borrowing Toast, rhs: borrowing Toast) -> Bool {
        lhs.id == rhs.id
    }
}
