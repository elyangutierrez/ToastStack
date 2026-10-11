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
    var style: ToastStyle
    var alignment: Alignment
    var content: AnyView?
    
    init(
        message: String,
        style: ToastStyle,
        alignment: Alignment,
    ) {
        self.message = message
        self.style = style
        self.alignment = alignment
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
        style.rawValue
    }
    
    var icon: String {
        switch style {
        case .success:
            "checkmark.circle.fill"
        case .error:
            "xmark.circle.fill"
        case .info:
            "info.circle.fill"
        case .warning:
            "exclamationmark.circle.fill"
        }
    }
    
    var iconColor: Color {
        switch style {
        case .success:
            ToastConstants.SUCCESS_ICON
        case .error:
            ToastConstants.ERROR_ICON
        case .info:
            ToastConstants.INFO_ICON
        case .warning:
            ToastConstants.WARNING_ICON
        }
    }
    
    func toastBackgroundColor(for colorScheme: ColorScheme) -> Color {
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
