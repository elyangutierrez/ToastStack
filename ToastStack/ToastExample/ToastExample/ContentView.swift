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
                ToastStack.success("Something here.", .top)
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
