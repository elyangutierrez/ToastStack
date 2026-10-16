//
//  File.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/13/26.
//

import Foundation
import SwiftUI

/// The content and behavior of the button shown in an actionable toast.
///
/// Pass a `ToastAction` to ``ToastStack/actionable(_:_:action:dismissalTimeDeadline:)``.
/// The optional icon names use SF Symbols. The button shows `buttonImage` when set and
/// displays `buttonTitle` otherwise.
public struct ToastAction {
    var toastIcon: String?
    var toastTitle: String
    var buttonTitle: String
    var buttonImage: String?
    var dismissOnTrigger: Bool
    var handler: () -> Void
    
    /// Creates an action for an actionable toast.
    ///
    /// - Parameters:
    ///   - toastIcon: An optional SF Symbol displayed beside the toast title.
    ///   - toastTitle: The title displayed above the toast message.
    ///   - buttonTitle: The text displayed in the action button when `buttonImage` is `nil`.
    ///   - buttonImage: An optional SF Symbol displayed in the action button when set.
    ///   - dismissOnTrigger: Whether tapping the button dismisses the toast after its feedback animation.
    ///   - handler: The closure run when the action button is tapped.
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
