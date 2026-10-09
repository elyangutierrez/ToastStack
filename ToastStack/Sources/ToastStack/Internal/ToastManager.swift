//
//  ToastManager.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/8/26.
//

import Foundation
import Observation

@Observable
@MainActor
internal final class ToastManager {
    
    static var shared = ToastManager()
    
    private(set) var toasts: [Toast] = []
    
    public init() { }
    
    public func show(_ toast: Toast) {
        toasts.append(toast)
    }
    
    public func dismiss(for id: UUID) {
        if let id = toasts.firstIndex(where: { $0.id == id }) {
            toasts.remove(at: id)
        }
    }
}
