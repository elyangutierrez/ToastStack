//
//  ToastStack.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/8/26.
//

import SwiftUI

@MainActor
public enum ToastStack {
    public static func success(
        message: String,
        _ position: Alignment = .top,
        dismissalTime: Int = 5
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .success, alignment: position),
            dismissalTime
        )
    }
    
    public static func error(
        message: String,
        _ position: Alignment = .top,
        dismissalTime: Int = 5
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .success, alignment: position),
            dismissalTime
        )
    }
    
    public static func warning(
        message: String,
        _ position: Alignment = .top,
        dismissalTime: Int = 5
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .success, alignment: position),
            dismissalTime
        )
    }
    
    public static func info(
        message: String,
        _ position: Alignment = .top,
        dismissalTime: Int = 5
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .success, alignment: position),
            dismissalTime
        )
    }
    
    public static func custom(
        _ position: Alignment = .top,
        content: AnyView,
        dismissalTime: Int = 5
    ){
        ToastManager.shared.show(
            Toast(alignment: position, content: {
                content
            }),
            dismissalTime
        )
    }
    
    internal static func random(
        _ message: String,
        _ position: Alignment = .top,
        _ customView: AnyView
    ){
        let randomNumber = Int.random(in: 1...5)
        
        switch randomNumber {
        case 1:
            success(message: message, position)
        case 2:
            error(message: message, position)
        case 3:
            warning(message: message, position)
        case 4:
            info(message: message, position)
        case 5:
            custom(position, content: customView)
        default:
            success(message: message, position)
        }
    }
}
