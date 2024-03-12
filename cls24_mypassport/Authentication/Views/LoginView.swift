//
//  LoginView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 11/2/24.
//

import SwiftUI

enum LoginMethods {
    case email, appleId, google, facebook
}

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @Environment(AuthViewModel.self) private var auth
    
    var body: some View {
        NavigationStack {
            VStack() {
                Text("Login")
                    .font(.system(.title, weight: .bold))
                    .padding(.bottom, 8)
                
                Text("Welcome back, you've \n been missed!")
                    .font(.subheadline)
                    .foregroundStyle(.subText)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing])
                
                
                Spacer()
                //                    .frame(height: 48)
                
                VStack(spacing: 32) {
                    FloatingTextField(placeHolder: "Email", text: $email)
                        .padding(.horizontal)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                    
                    FloatingTextField(placeHolder: "Password", secureMode: true, text: $password)
                        .padding(.horizontal)
                        .textContentType(.password)
                }
                
                Spacer()
                //                    .frame(height: 56)
                
                ActionButton(title: "Login") {
                    Task {
                        try await auth.signIn(withEmail: email, password: password)
                    }
                    
                }
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .padding(.horizontal)
                            
                Divider()
                    .padding([.horizontal], 48)
                    .padding(.vertical, 32)
                            
                // Login methods
                VStack (spacing: 16) {
                    Text("Or continue with")
                        .foregroundStyle(.gray)
                        .font(.caption)
                    
                    HStack(spacing: 32) {
                        LoginMethodButton2(icon: Image(systemName: "apple.logo")) {
                            // Login with Apple
                        }
                        
                        LoginMethodButton2(icon: Image("google")) {
                            // Login with Google
                        }
                        
                        LoginMethodButton2(icon: Image("fb")) {
                            // Login with Facebook
                        }
                    }
                    
                }
                .padding([.leading, .trailing, .bottom])
                
                HStack {
                    Text("Doesn't have an account?")
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Sign up")
                    }
                }
                
                Spacer()
            }
            //            .navigationTitle("Login")
            //            .navigationBarTitleDisplayMode(.inline)
            //            .toolbar(content: {
            //                ToolbarItem(placement: .principal) {
            //                    Text("Login").font(.title)
            //                }
            //            })
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton()
            }
        }
    }
    
    private func loginMethodHandlers(tag: any Hashable) {
        guard let method = tag as? LoginMethods else { return }
        
        switch method {
        case .email:
            print("test")
            break
            
        case .appleId:
            break
            
        case .google:
            break
            
        case .facebook:
            break
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && !email.isEmpty
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView().environment(AuthViewModel())
}
