//
//  RegisterView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 1/3/24.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullname: String = ""
    @State private var phone: String = ""
    
    @State private var isChecked: Bool = false
    @Environment(AuthViewModel.self) private var auth

    var body: some View {
        VStack() {
            Text("Create an account")
                .font(.system(.title, weight: .bold))
                .padding(.bottom, 8)
            
            Text("Fill your information below or register\n with your social account.")
//                .font(.system(.headline, weight: .bold))
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing])
                .foregroundStyle(.subText)

            Spacer()
            
            VStack(spacing: 32) {
                FloatingTextField(placeHolder: "Full name", text: $fullname)
                    .textContentType(.name)
                    .keyboardType(.default)
                
                FloatingTextField(placeHolder: "Phone Number", text: $phone)
                    .textContentType(.telephoneNumber)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.phonePad)
                
                FloatingTextField(placeHolder: "Email", text: $email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)

                FloatingTextField(placeHolder: "Password", secureMode: true, text: $password)
                    .textContentType(.newPassword)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.default)

            }
            .padding(.horizontal)
            
            HStack(alignment: .top) {
                CheckboxView(isChecked: $isChecked, title: "I agree with the Terms of Service")
                Spacer()
            }
            .padding(.horizontal)
            
            ActionButton(title: "Register") {
                Task {
                    do {
                        try await auth.createUser(withEmail: email,
                                                  password: password,
                                                  fullname: fullname)
                    } catch {
                        // show the alert error by toggle flag?
                    }
                }
            }
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .padding(.horizontal)
                        
            Spacer()
            
            Divider()
                .padding([.horizontal], 48)
//                .padding(.vertical, 32)
            Spacer()
            
            VStack(spacing: 16) {
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
            
            Spacer()

        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton()
            }
        }
    }
}

extension RegisterView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && !email.isEmpty
        && !password.isEmpty
        && password.count > 5
        && !fullname.isEmpty
    }
}

#Preview {
    RegisterView().environment(AuthViewModel())
}
