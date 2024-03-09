//
//  ContentView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 8/2/2567 BE.
// https://www.youtube.com/watch?v=pAB1tMH6TFc&list=PL5PR3UyfTWvei-pKlZN7d8r-0tHCK1EKE&index=6

import SwiftUI

@Observable
class ContentViewModel {
    
    var currentUserId: String = ""
//    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
//        handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
//            DispatchQueue.main.async {
//                self?.currentUserId = user.uid ?? ""
//            }
//        }
    }
    
    var isSignedIn: Bool {
//        return Auth.auth().currentUser != nil
        return true
    }
}

struct ContentView: View {
//    @State var viewModel = ContentViewModel()
    @Environment(AuthViewModel.self) private var auth
    
    var body: some View {
//        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
        Group {
            if auth.isLoggedIn {
                // Signed in
                MainView()
                    .transition(.opacity)
                    .animation(.easeInOut, value: auth.userSession)
            } else {
                OnboardingView()
                
                // เอาไว้ใช้แค่เทส
    //            Button(action: {
    //                withAnimation {
    //                    viewModel.currentUserId = "30"
    //                }
    //            }, label: {
    //                Text("Button")
    //            })
            }
        }
    }
}

#Preview {
    ContentView().environment(AuthViewModel())
}
