//
//  ToastView.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/8/26.
//

import SwiftUI

internal struct ToastView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var toast: Toast
    var dismissAction: () -> Void
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: toast.icon)
                .font(.largeTitle.bold())
                .foregroundStyle(toast.iconColor)
                .symbolRenderingMode(.monochrome)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(toast.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(toast.toastForegroundColor(for: colorScheme))
                Text(toast.message)
                    .fontWeight(.medium)
                    .foregroundStyle(toast.toastForegroundColor(for: colorScheme).opacity(0.7))
            }
            
            Spacer()
            
            Button(action: {
                dismissAction()
            }) {
                Image(systemName: "xmark")
                    .font(.title2.bold())
                    .foregroundStyle(toast.toastForegroundColor(for: colorScheme).opacity(0.7))
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(toast.toastBackgroundColor(for: colorScheme))
                .shadow(
                    color:
                        colorScheme == .light ?
                    toast.toastForegroundColor(for: colorScheme).opacity(0.4) : .clear,
                    radius: 3,
                    y: 5
                )
        )
        .transition(
            .move(
                edge: AlignmentEdge.convert(
                    alignment: toast.alignment
                )
            )
            .combined(with: .opacity)
            .combined(with: .blurReplace)
        )
    }
}

#Preview {
    ToastView(toast: Toast(message: "First message!", style: .info, alignment: .top), dismissAction: {})
        .frame(width: 300, height: 300)
        .padding()
}
