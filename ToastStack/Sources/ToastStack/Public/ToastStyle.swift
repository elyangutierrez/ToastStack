//
//  ToastStyle.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/8/26.
//

import Foundation

/// The built-in visual styles available for a toast.
///
/// Use these cases when selecting a built-in toast appearance. To present one, call the matching
/// method on ``ToastStack``.
public enum ToastStyle: String {
    /// Indicates that an operation completed successfully.
    case success = "Success"
    /// Indicates that an operation failed or could not be completed.
    case error = "Error"
    /// Presents neutral, informational content.
    case info = "Info"
    /// Draws attention to a condition that may need the user's attention.
    case warning = "Warning"
}
