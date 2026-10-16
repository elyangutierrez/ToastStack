//
//  File.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/13/26.
//

import Foundation
import SwiftUI

public struct ToastAction {
    var toastIcon: String?
    var toastTitle: String
    var buttonTitle: String
    var buttonImage: String?
    var dismissOnTrigger: Bool
    var handler: () -> Void
    
    public init(
        toastIcon: String? = nil,
        toastTitle: String,
        buttonTitle: String,
        buttonImage: String? = nil,
        dismissOnTrigger: Bool,
        handler: @escaping () -> Void)
    {
        self.toastIcon = toastIcon
        self.toastTitle = toastTitle
        self.buttonTitle = buttonTitle
        self.buttonImage = buttonImage
        self.dismissOnTrigger = dismissOnTrigger
        self.handler = handler
    }
    
    func foregroundColor(for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? ToastConstants.ACTIONABLE_FOREGROUND.light : ToastConstants.ACTIONABLE_FOREGROUND.dark
    }
    
    func backgroundColor(for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? ToastConstants.ACTIONABLE_BACKGROUND.light : ToastConstants.ACTIONABLE_BACKGROUND.dark
    }
}
