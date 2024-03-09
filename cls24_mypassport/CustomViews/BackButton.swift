//
//  BackButton.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 1/3/24.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.main)
        })
    }
}

#Preview {
    BackButton()
}
