//
//  ProfileView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 8/3/24.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(AuthViewModel.self) var auth
    
    var body: some View {
        if let user = auth.currentUser {
            VStack {
                Text("Hi \(user.fullname),")
                Button("Logout") {
                    auth.signOut()
                }
            }
        } else {
            Button("Logout") {
                auth.signOut()
            }
        }
    }
}

#Preview {
    ProfileView().environment(AuthViewModel())
}
