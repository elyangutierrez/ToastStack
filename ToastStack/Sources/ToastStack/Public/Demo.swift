//
//  Demo.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/9/26.
//

import SwiftUI

internal struct Demo: View {
    
    var toastAppearanceAlignment: Alignment
    
    init(toastAppearanceAlignment: Alignment = .top) {
        self.toastAppearanceAlignment = toastAppearanceAlignment
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "globe")
                .font(.title2.bold())
            
            Text("Hello, world!")
            
            Button(action: {
                ToastStack.random("Something here...", toastAppearanceAlignment)
            }) {
                Text("Show Toast")
            }
            .buttonStyle(.glassProminent)
        }
        .padding()
    }
}

#Preview("Custom Placement") {
    Demo(toastAppearanceAlignment: .bottom)
        .toastHost(toastPlacement: .bottom)
}

#Preview("Default") {
    Demo()
        .toastHost()
}

#Preview("Custom Animation") {
    Demo()
        .toastHost(animationStyle: .interactiveSpring)
}
