//
//  Demo.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/9/26.
//

import SwiftUI

internal struct DemoView: View {
    
    var toastAppearanceAlignment: Alignment
    var randomButton: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "globe")
                .font(.title2.bold())
            
            Text("Hello, world!")
            
            Button(action: {
                if randomButton {
                    ToastStack.random(
                        "Something here...",
                        toastAppearanceAlignment,
                        AnyView(CustomDemoView())
                    )
                } else {
                    ToastStack.custom(
                        content:
                            AnyView(CustomDemoView()
                        )
                    )
                }
            }) {
                Text("Show Toast")
            }
            .buttonStyle(.glassProminent)
        }
        .padding()
    }
}

internal struct Demo: View {
    
    var toastAppearanceAlignment: Alignment
    var content: AnyView
    
    init<Content: View>(toastAppearanceAlignment: Alignment = .top, @ViewBuilder content: () -> Content) {
        self.toastAppearanceAlignment = toastAppearanceAlignment
        self.content = AnyView(content())
    }
    
    var body: some View {
        content
    }
}

#Preview("Custom Placement") {
    Demo(toastAppearanceAlignment: .bottom) {
        DemoView(toastAppearanceAlignment: .bottom, randomButton: false)
    }
    .toastHost(toastPlacement: .bottom)
}

#Preview("Default") {
    Demo() {
        DemoView(toastAppearanceAlignment: .top, randomButton: true)
    }
    .toastHost()
}

#Preview("Custom Animation") {
    Demo() {
        DemoView(toastAppearanceAlignment: .top, randomButton: true)
    }
    .toastHost(animationStyle: .interactiveSpring)
}
