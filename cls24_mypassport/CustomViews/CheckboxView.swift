//
//  CheckboxView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 1/3/24.
//

import SwiftUI

struct CheckboxView: View {
    
    @Binding var isChecked: Bool
    
    var title: String
    
    var body: some View {
        HStack {
            Button(action: {
                isChecked.toggle()
            }) {
                HStack {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(isChecked ? Color.main : Color.secondary)
                        .padding(10)
                }
            }
            Text(title)
                .foregroundStyle(.subText)
        }
    }
}

#Preview {
    CheckboxView(isChecked: .constant(true), title: "Label")
}
