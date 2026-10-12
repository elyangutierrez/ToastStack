//
//  CustomDemoView.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/10/26.
//

import SwiftUI

internal struct CustomDemoView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Content")
                        .font(.largeTitle)
                    
                    Text("Content 2")
                        .font(.title3)
                }
                
                Spacer()
                
                Image(systemName: "globe")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
            }
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.clear)
                .glassEffect(.clear, in: .rect(cornerRadius: 25.0))
        )
        .padding()
    }
}
#Preview {
    CustomDemoView()
}
