//
//  iPadToastView.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/10/26.
//

import SwiftUI

internal struct iPadToastView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var toast: Toast
    var dismissAction: () -> Void
    
    var body: some View {
        HStack(spacing: 18) {
            Image(systemName: toast.icon)
                .font(ToastConstants.IPAD_TOAST_ICON_FONT.bold())
                .foregroundStyle(toast.iconColor)
                .symbolRenderingMode(.monochrome)
            
            VStack(alignment: .leading) {
                Text(toast.title)
                    .font(ToastConstants.IPAD_TOAST_TITLE_FONT)
                    .fontWeight(.bold)
                    .foregroundStyle(toast.toastForegroundColor(for: colorScheme))
                Text(toast.message)
                    .font(ToastConstants.IPAD_TOAST_MESSAGE_FONT)
                    .fontWeight(.medium)
                    .foregroundStyle(toast.toastForegroundColor(for: colorScheme).opacity(0.7))
            }
            
            Spacer()
            
            Button(action: {
                dismissAction()
            }) {
                Image(systemName: "xmark")
                    .font(ToastConstants.IPAD_CLOSE_BUTTON_FONT.bold())
                    .foregroundStyle(toast.toastForegroundColor(for: colorScheme).opacity(0.7))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(toast.toastBackgroundColor(for: colorScheme))
                .shadow(
                    color:
                        colorScheme == .light ?
                    toast.toastForegroundColor(for: colorScheme).opacity(0.4) : .clear,
                    radius: ToastConstants.IPAD_SHADOW_SPECS.0,
                    y: ToastConstants.IPAD_SHADOW_SPECS.1
                )
        )
    }
}

#Preview {
    let toast = Toast(message: "first message", style: .success, alignment: .top)
    
    iPadToastView(toast: toast, dismissAction: {})
        .frame(maxWidth: 475)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: toast.alignment)
        .padding()
}
