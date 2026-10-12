//
//  Ext.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/9/26.
//

import Foundation
import SwiftUI

internal extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

public extension View {
    /// Adds a host that displays ToastStack messages above this view.
    ///
    /// Attach the host to the view hierarchy where toasts should appear, then present toasts with
    /// ``ToastStack``. The host overlays messages without replacing the view's content. Its
    /// placement controls where the toast stack is drawn, while the animation controls changes to
    /// that stack.
    ///
    /// For a matching entrance and display edge, use the same edge alignment for the toast's
    /// position and `toastPlacement`. Edge alignments are `.top`, `.bottom`, `.leading`, and
    /// `.trailing`; other toast positions use the top entrance edge.
    ///
    /// ```swift
    /// ContentView()
    ///     .toastHost(toastPlacement: .topTrailing, animationStyle: .snappy)
    /// ```
    ///
    /// - Parameters:
    ///   - toastPlacement: The alignment of the toast stack within this view. Defaults to `.top`.
    ///   - animationStyle: The animation used when the displayed toast stack changes. Defaults to
    ///     `.spring`.
    /// - Returns: A view that overlays ToastStack messages on this view.
    func toastHost(
        toastPlacement: Alignment = .top,
        animationStyle: Animation = .spring
    ) -> some View {
        modifier(
            ToastHost(
                toastPlacement: toastPlacement,
                animationStyle: animationStyle
            )
        )
    }
}

internal extension View {
    func stacked(
        at position: Int,
        in total: Int,
        with toastPlacement: Alignment
    ) -> some View {
        var offset = Double(total - position)
        
        if toastPlacement == .bottom || toastPlacement == .bottomLeading || toastPlacement == .bottomTrailing {
            offset = -offset
        }
        
        return self.offset(y: offset * 10)
    }
}

extension Alignment: @retroactive Hashable {
    public func hash(into hasher: inout Hasher) { }
}
