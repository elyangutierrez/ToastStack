//
//  ToastHost.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/8/26.
//

import SwiftUI

internal struct ToastHost: ViewModifier {
    
    @State private var toastManager = ToastManager.shared
    
    var toastPlacement: Alignment
    var animationStyle: Animation
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: toastPlacement) {
                ZStack {
                    VStack {
                        ZStack {
                            ForEach(toastManager.toasts) { toast in
                                let position = toastManager.toasts.firstIndex(where: { $0.id == toast.id }) ?? 0
                                
                                AdaptiveToastView(toast: toast) {
                                    toastManager.cancelTask(for: toast)
                                    toastManager.dismiss(for: toast)
                                }
                                .stacked(at: position, in: toastManager.toasts.count, with: toastPlacement)
                            }
                        }
                    }
                    .padding()
                    .animation(
                        animationStyle,
                        value: toastManager.toasts
                    )
                }
            }
    }
}
