//
//  ContentView.swift
//  ToastExample
//
//  Created by Elyan Gutierrez on 10/8/26.
//

import SwiftUI
import ToastStack

struct ContentView: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "globe")
                .font(.title2.bold())
            
            Text("Hello, world!")
            
            Button(action: {
//                ToastStack.success(message: "Changes made.")
//                ToastStack.info(message: "A new version is avaliable.")
//                ToastStack.warning(message: "Check your connection.")
//                ToastStack.error(message: "Could not save changes.", dismissalTime: 1)
                
                ToastStack.actionable(
                    "This will undo the latest action.",
                        .top,
                    action: ToastAction(
                        toastIcon: "arrow.trianglehead.counterclockwise.rotate.90",
                        toastTitle: "Undo?",
                        buttonTitle: "Undo",
                        dismissOnTrigger: true,
                        handler: {
                            Task {
                                print("Doing some work")
                                try? await Task.sleep(for: .seconds(5))
                                print("work is done")
                            }
                        }
                    )
                )
            }) {
                Text("Show Toast")
            }
            .buttonStyle(.glassProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .frame(width: 300, height: 300)
        .toastHost()
}
