//
//  LoginMethodButton2.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 3/3/24.
//

import SwiftUI

typealias LoginMethodButtonAction = () -> Void

struct LoginMethodButton2: View {
    
    var icon: Image
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            icon
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
//                .foregroundStyle(.main)

        })
        .padding(10)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.grayE5, lineWidth: 2)
        }
    }
}

#Preview {
    LoginMethodButton2(icon: Image(systemName: "map.circle"))
}
