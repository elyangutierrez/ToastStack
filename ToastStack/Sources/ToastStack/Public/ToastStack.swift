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
        _ message: String,
        _ position: VerticalAlignment = .top
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .success, alignment: position)
        )
    }
    
    public static func error(
        _ message: String,
        _ position: VerticalAlignment = .top
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .error, alignment: position)
        )
    }
    
    public static func warning(
        _ message: String,
        _ position: VerticalAlignment = .top
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .warning, alignment: position)
        )
    }
    
    public static func info(
        _ message: String,
        _ position: VerticalAlignment = .top
    ){
        ToastManager.shared.show(
            Toast(message: message, style: .info, alignment: position)
        )
    }
}
