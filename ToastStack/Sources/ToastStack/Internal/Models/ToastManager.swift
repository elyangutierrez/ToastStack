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
    private(set) var tasks: [UUID: Task<Void, Never>] = [:]
    
    private init() { }
    
    func show(_ toast: Toast, _ dismissalTime: Int = 5) {
        
        tasks[toast.id]?.cancel()
        
        let newTask = Task {
            do {
                await MainActor.run {
                    toasts.append(toast)
                }
                
                try await Task.sleep(
                    for: .seconds(dismissalTime)
                )
                try Task.checkCancellation()
                
                await MainActor.run {
                    dismiss(for: toast.id)
                    tasks[toast.id] = nil
                }
            } catch is CancellationError {
                return
            } catch {
                return
            }
        }
        
        tasks[toast.id] = newTask
    }
    
    func cancelTask(for toast: Toast) {
        tasks[toast.id]?.cancel()
        tasks[toast.id] = nil
    }
    
    func dismiss(for id: UUID) {
        toasts.removeAll(where: { $0.id == id })
    }
}
