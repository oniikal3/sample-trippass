//
//  ActionButton.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 27/2/24.
//

import SwiftUI

enum BackgroundStyle {
    case solidColor(Color)
    case gradient(LinearGradient)
}

struct ActionButton: View {
    
    let title: String
    let action: () -> Void
    var backgroundColor: BackgroundStyle = .solidColor(.main)
    var textColor: Color = .white
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.headline)
                .foregroundStyle(textColor)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 50)
                .padding(.vertical, 16)
        }
        .background(
            backgroundView()
        )
    }
    
    @ViewBuilder
    private func backgroundView() -> some View {
        switch backgroundColor {
        case .solidColor(let color):
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
        case .gradient(let linearGradient):
            RoundedRectangle(cornerRadius: 20)
                .fill(linearGradient)
        }
    }
}

#Preview {
    ActionButton(title: "Get Started", action: {})
        .preferredColorScheme(.dark)
//        .background {
//            Color(.primary)
//        }
//        .foregroundStyle(
//            LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
////            .white
//        )
}
