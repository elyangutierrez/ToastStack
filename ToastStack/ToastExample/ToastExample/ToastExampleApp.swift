//
//  ToastExampleApp.swift
//  ToastExample
//
//  Created by Elyan Gutierrez on 10/8/26.
//

import SwiftUI
import ToastStack

@main
struct ToastExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .toastHost()
        }
    }
}
