//
//  LoginMethodButton.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 11/2/24.
//

import SwiftUI

typealias LoginMethodButtonAction = (any Hashable) -> Void

struct LoginMethodButton: View {
    
    let title: String
    let icon: Image
    let tag: any Hashable
    
    var action: LoginMethodButtonAction?
    
    private let buttonHeight: CGFloat = 30
    
    var body: some View {
        
//        Button(action: {
//            
//            action?(tag)
//        }, label: {
            HStack {
                icon
                    .padding([.trailing, .leading], 16)
                Text(title)
                    .font(.system(.callout))
                    .foregroundStyle(.subText)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, maxHeight: buttonHeight, alignment: .leading)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: buttonHeight, style: .continuous)
                    .stroke(.grayE5)
            }
//        })
    }
}

#Preview {
    VStack {
        LoginMethodButton(title: "Login with Email", icon: Image(systemName: "envelope"), tag: 1)
        LoginMethodButton(title: "Login with Email Login with Email Login with Email Login with Email Login with Email", icon: Image(systemName: "envelope"), tag: 2)
    }
}
