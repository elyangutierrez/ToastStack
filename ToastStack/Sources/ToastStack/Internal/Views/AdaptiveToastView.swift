//
//  AdaptiveToastView.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/10/26.
//

import SwiftUI

internal struct AdaptiveToastView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var toast: Toast
    var dismissAction: () -> Void
    
    var body: some View {
        #if os(macOS)
        VStack {
            macOSToastView(toast: toast, dismissAction: dismissAction)
        }
        .frame(maxWidth: 275)
        .transition(
            .move(
                edge: AlignmentEdge.convert(
                    alignment: toast.alignment
                )
            )
            .combined(with: .opacity)
            .combined(with: .blurReplace)
        )
        #elseif os(iOS)
            VStack {
                if horizontalSizeClass == .compact {
                    iPhoneToastView(toast: toast, dismissAction: dismissAction)
                } else {
                    iPadToastView(toast: toast, dismissAction: dismissAction)
                }
            }
            .frame(maxWidth: 475)
            .transition(
                .move(
                    edge: AlignmentEdge.convert(
                        alignment: toast.alignment
                    )
                )
                .combined(with: .opacity)
                .combined(with: .blurReplace)
            )
        #endif
    }
}

#Preview {
    AdaptiveToastView(toast: Toast(message: "first message!", style: .success, alignment: .top), dismissAction: {})
}
