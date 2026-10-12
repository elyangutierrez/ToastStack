//
//  ToastManager.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/8/26.
//

import Foundation
import Observation
import SwiftUI

@Observable
@MainActor
internal final class ToastManager {
    
    static let shared = ToastManager()
    
    var firstToastAlignment: Alignment?
    
    private(set) var toasts: [Toast] = []
    private(set) var tasks: [Toast: Task<Void, Never>] = [:]
    
    private init() { }
    
    func show(_ toast: Toast, _ dismissalTime: Int = 5) {
        
        tasks[toast]?.cancel()
        
        let newTask = Task {
            await MainActor.run {
                toasts.append(toast)
            }
            
            try? await Task.sleep(for: .seconds(dismissalTime))
            
            await MainActor.run {
                dismiss(for: toast)
                tasks[toast] = nil
            }
        }
        
        tasks[toast] = newTask
    }
    
    func cancelTask(for toast: Toast) {
        tasks[toast]?.cancel()
        tasks[toast] = nil
    }
    
    func dismiss(for toast: Toast) {
        toasts.removeAll(where: { $0.id == toast.id })
    }
}
