//
//  ToastStack.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/8/26.
//

import SwiftUI

/// Presents stackable toast messages in a SwiftUI view hierarchy.
///
/// Add `.toastHost(toastPlacement:animationStyle:)` to the view that should display toasts, then
/// call one of the presentation methods from an action. Built-in styles include a
/// close button and dismiss automatically after the requested number of seconds. Custom content
/// dismisses automatically but does not include a close button.
///
/// The optional position passed to a presentation method controls the toast's entrance edge. The
/// edge alignments `.top`, `.bottom`, `.leading`, and `.trailing` select their matching edge; other
/// alignments use the top edge. The host's `toastPlacement` controls where the stack is displayed.
///
/// ```swift
/// ContentView()
///     .toastHost(toastPlacement: .topTrailing)
///
/// // From an action:
/// ToastStack.success(message: "Changes saved.")
/// ```
@MainActor
public enum ToastStack {
    /// Presents a success toast.
    ///
    /// - Parameters:
    ///   - message: The message shown with the success title.
    ///   - position: The alignment that determines the toast's entrance edge. Defaults to `.top`.
    ///   - dismissalTime: The number of seconds before the toast is removed. Defaults to `5`.
    public static func success(
        message: String,
        _ position: Alignment = .top,
        dismissalTime: Int = 5
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .success, alignment: position),
            dismissalTime
        )
    }
    
    /// Presents an error toast.
    ///
    /// - Parameters:
    ///   - message: The message shown with the error title.
    ///   - position: The alignment that determines the toast's entrance edge. Defaults to `.top`.
    ///   - dismissalTime: The number of seconds before the toast is removed. Defaults to `5`.
    public static func error(
        message: String,
        _ position: Alignment = .top,
        dismissalTime: Int = 5
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .error, alignment: position),
            dismissalTime
        )
    }
    
    /// Presents a warning toast.
    ///
    /// - Parameters:
    ///   - message: The message shown with the warning title.
    ///   - position: The alignment that determines the toast's entrance edge. Defaults to `.top`.
    ///   - dismissalTime: The number of seconds before the toast is removed. Defaults to `5`.
    public static func warning(
        message: String,
        _ position: Alignment = .top,
        dismissalTime: Int = 5
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .warning, alignment: position),
            dismissalTime
        )
    }
    
    /// Presents an informational toast.
    ///
    /// - Parameters:
    ///   - message: The message shown with the info title.
    ///   - position: The alignment that determines the toast's entrance edge. Defaults to `.top`.
    ///   - dismissalTime: The number of seconds before the toast is removed. Defaults to `5`.
    public static func info(
        message: String,
        _ position: Alignment = .top,
        dismissalTime: Int = 5
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .info, alignment: position),
            dismissalTime
        )
    }
    
    /// Presents a toast containing custom SwiftUI content.
    ///
    /// Custom content is shown as provided and does not include the built-in toast close button.
    /// It is removed automatically after `dismissalTime` seconds.
    ///
    /// - Parameters:
    ///   - position: The alignment that determines the toast's entrance edge. Defaults to `.top`.
    ///   - content: The type-erased SwiftUI view to display.
    ///   - dismissalTime: The number of seconds before the toast is removed. Defaults to `5`.
    public static func custom(
        _ position: Alignment = .top,
        content: AnyView,
        dismissalTime: Int = 5
    ){
        ToastManager.shared.show(
            Toast(alignment: position, content: {
                content
            }),
            dismissalTime
        )
    }
    
    /// TODO: 
    public static func actionable(
        _ message: String,
        _ alignment: Alignment,
        action: ToastAction,
        dismissalTimeDeadline: Int = 60
    ) {
        ToastManager.shared.show(
            Toast(
                message: message,
                alignment: alignment,
                action: action
            ),
            dismissalTimeDeadline
        )
    }
    
    internal static func random(
        _ message: String,
        _ position: Alignment = .top,
        _ customView: AnyView
    ){
        let randomNumber = Int.random(in: 1...5)
        
        switch randomNumber {
        case 1:
            success(message: message, position)
        case 2:
            error(message: message, position)
        case 3:
            warning(message: message, position)
        case 4:
            info(message: message, position)
        case 5:
            custom(position, content: customView)
        default:
            success(message: message, position)
        }
    }
}
