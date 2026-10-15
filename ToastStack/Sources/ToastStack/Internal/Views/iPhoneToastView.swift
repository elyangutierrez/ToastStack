//
//  iPhoneToastView.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/10/26.
//

import SwiftUI

internal struct iPhoneToastView: View {
    @Namespace private var namespace
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isButtonPressed: Bool = false
    @State private var buttonTask: Task<Void, Never>?

    var toast: Toast
    var dismissAction: () -> Void
    
    var body: some View {
        if let action = toast.action {
            HStack(spacing: 15) {
                if let toastIcon = action.toastIcon {
                    Image(systemName: toastIcon)
                        .font(ToastConstants.IPHONE_TOAST_ICON_FONT.bold())
                }
                
                VStack(alignment: .leading) {
                    Text(action.toastTitle)
                        .font(ToastConstants.IPHONE_TOAST_TITLE_FONT)
                        .fontWeight(.bold)
                        .foregroundStyle(action.foregroundColor(for: colorScheme))
                    Text(toast.message)
                        .fontWeight(.medium)
                        .foregroundStyle(action.foregroundColor(for: colorScheme).opacity(0.7))
                }
                
                Spacer()
                
                Button(action: {
                    
                    guard !isButtonPressed else { return }
                    
                    buttonTask = Task {
                        withAnimation(.spring) {
                            isButtonPressed.toggle()
                        }
                        
                        try? await Task.sleep(for: .seconds(4))
                        try? Task.checkCancellation()
                        
                        withAnimation(.spring) {
                            isButtonPressed.toggle()
                        }
                        
                        buttonTask?.cancel()
                    }
                    
                    if action.dismissOnTrigger {
                        dismissAction()
                    }
                    
                    action.handler()
                }) {
                    if let systemImage = action.buttonImage {
                        Image(systemName: isButtonPressed ? "checkmark" : systemImage)
                            .font(ToastConstants.IPHONE_CLOSE_BUTTON_FONT.bold())
                        
                    } else {
                        textualButton(action: action)
                    }
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(action.backgroundColor(for: colorScheme))
                    .shadow(
                        color:
                            colorScheme == .light ?
                            .gray.opacity(0.3) : .clear,
                        radius: ToastConstants.IPHONE_SHADOW_SPECS.0,
                        y: ToastConstants.IPHONE_SHADOW_SPECS.1
                    )
            )
        } else {
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
                        .padding(7)
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(toast.toastForegroundColor(for: colorScheme).opacity(0.2))
                        )
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
    
    @ViewBuilder
    func textualButton(action: ToastAction) -> some View {
        ZStack {
            if isButtonPressed {
                Image(systemName: "checkmark")
                    .font(ToastConstants.IPHONE_CLOSE_BUTTON_FONT.bold())
                    .transition(.scale.combined(with: .opacity))
            } else {
                Text(action.buttonTitle)
                    .foregroundStyle(action.foregroundColor(for: colorScheme))
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: true, vertical: false)
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 7)
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    colorScheme == .light ?
                    Color.gray.opacity(0.2) :
                        Color.gray.opacity(0.3)
                )
        )
        .clipShape(.rect(cornerRadius: 25.0))
    }
}

#Preview("Regular") {
    let toast = Toast(message: "Your changes were successful.", style: .success, alignment: .top)
    
    iPhoneToastView(toast: toast, dismissAction: {})
        .frame(maxWidth: 475)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: toast.alignment)
        .padding()
}

#Preview("Actionable Toast") {
    let toast = Toast(
        message: "This will undo the latest action.",
        alignment: .top,
        action: ToastAction(
            toastIcon: "arrow.trianglehead.counterclockwise.rotate.90",
            toastTitle: "Undo?",
            buttonTitle: "Undo",
            dismissOnTrigger: true,
            handler: {
                print("Undid XYZ...")
            }
        )
    )
    
    iPhoneToastView(toast: toast, dismissAction: {})
        .frame(maxWidth: 475)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: toast.alignment)
        .padding()
}
