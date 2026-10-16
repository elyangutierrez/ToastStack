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
    var actionableToast: Bool
    
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
                } else if actionableToast {
                    ToastStack.actionable(
                        "This will undo the latest action.",
                            .top,
                        action: ToastAction(
                            toastIcon: "arrow.trianglehead.counterclockwise.rotate.90",
                            toastTitle: "Undo?",
                            buttonTitle: "Undo",
                            dismissOnTrigger: true,
                            handler: {
                                Task {
                                    print("Doing some work")
                                    try? await Task.sleep(for: .seconds(5))
                                    print("work is done")
                                }
                            }
                        )
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
        DemoView(toastAppearanceAlignment: .bottom, randomButton: false, actionableToast: false)
    }
    .toastHost(toastPlacement: .bottom)
}

#Preview("Default") {
    Demo() {
        DemoView(toastAppearanceAlignment: .top, randomButton: true, actionableToast: false)
    }
    .toastHost()
}

#Preview("Custom Animation") {
    Demo() {
        DemoView(toastAppearanceAlignment: .top, randomButton: false, actionableToast: false)
    }
    .toastHost(animationStyle: .interactiveSpring)
}

#Preview("Actionable Toast") {
    Demo() {
        DemoView(toastAppearanceAlignment: .top, randomButton: false, actionableToast: true)
    }
    .toastHost()
}
