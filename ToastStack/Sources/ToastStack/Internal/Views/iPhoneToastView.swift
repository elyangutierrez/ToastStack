//
//  iPhoneToastView.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/10/26.
//

import SwiftUI

internal struct iPhoneToastView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var toast: Toast
    var dismissAction: () -> Void
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: toast.icon)
                .font(ToastConstants.IPHONE_TOAST_ICON_FONT.bold())
                .foregroundStyle(toast.iconColor)
                .symbolRenderingMode(.monochrome)
            
            VStack(alignment: .leading) {
                Text(toast.title)
                    .font(ToastConstants.IPHONE_TOAST_TITLE_FONT)
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
                    .font(ToastConstants.IPHONE_CLOSE_BUTTON_FONT.bold())
                    .foregroundStyle(toast.toastForegroundColor(for: colorScheme).opacity(0.7))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(toast.toastBackgroundColor(for: colorScheme))
                .shadow(
                    color:
                        colorScheme == .light ?
                    toast.toastForegroundColor(for: colorScheme).opacity(0.4) : .clear,
                    radius: ToastConstants.IPHONE_SHADOW_SPECS.0,
                    y: ToastConstants.IPHONE_SHADOW_SPECS.1
                )
        )
    }
}

#Preview {
    let toast = Toast(message: "first message", style: .success, alignment: .top)
    
    iPhoneToastView(toast: toast, dismissAction: {})
        .frame(maxWidth: 475)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: toast.alignment)
        .padding()
}
