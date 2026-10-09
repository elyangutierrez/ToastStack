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
        VStack {
            Button(action: {
                ToastStack.success("First message!")
            }) {
                Text("Hello world!")
            }
            .buttonStyle(.glassProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
