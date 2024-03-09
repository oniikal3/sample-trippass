//
//  FloatingTextField.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 26/2/24.
//

import SwiftUI

struct FloatingTextField: View {
    
    var placeHolder: String = ""
    var secureMode: Bool = false
    
//    @State private var currentValue: String = ""
    @Binding var text: String
    
    var body: some View {
        ZStack {
            HStack {
                Text(placeHolder)
                    .font(text.isEmpty ? .body : .caption)
                    .foregroundStyle(text.isEmpty ? .gray : .gray.opacity(0.5))
                    .offset(x: 0,
                            y: text.isEmpty ? 0 : -35)
                    .transition(.slide)
                    .transition(.scale)
                Spacer()
            }
            .animation(.easeIn(duration: 0.1), value: text)
            
            if secureMode {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
            }
        }
        .padding(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.grayE5, lineWidth: 2)
        }

    }
}

#Preview {
    FloatingTextField(placeHolder: "Please enter", text: .constant(""))
}
