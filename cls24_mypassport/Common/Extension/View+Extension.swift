//
//  View+Extension.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 8/3/24.
//

import SwiftUI

//ref: https://designcode.io/swiftui-handbook-conditional-modifier
//ref: https://www.avanderlee.com/swiftui/conditional-view-modifier/
extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
