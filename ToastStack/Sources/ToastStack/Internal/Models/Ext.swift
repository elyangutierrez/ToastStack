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
