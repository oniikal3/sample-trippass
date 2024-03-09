//
//  cls24_mypassportApp.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 8/2/2567 BE.
//

import SwiftUI
import Firebase

@main
struct cls24_mypassportApp: App {
        
    @State private var authModel: AuthViewModel //= AuthViewModel()
    
    init() {
        FirebaseApp.configure()
        self.authModel = AuthViewModel()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authModel)
        }
    }
}
