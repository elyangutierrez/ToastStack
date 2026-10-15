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
    var handler: @MainActor () -> Void
    
    func foregroundColor(for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? ToastConstants.ACTIONABLE_FOREGROUND.light : ToastConstants.ACTIONABLE_FOREGROUND.dark
    }
    
    func backgroundColor(for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? ToastConstants.ACTIONABLE_BACKGROUND.light : ToastConstants.ACTIONABLE_BACKGROUND.dark
    }
}
