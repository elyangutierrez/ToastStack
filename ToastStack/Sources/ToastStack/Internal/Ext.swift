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
    func toastHost() -> some View {
        modifier(ToastHost())
    }
}

internal extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}

extension Alignment: @retroactive Hashable {
    public func hash(into hasher: inout Hasher) { }
}
