//
//  AuthViewModel.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 8/3/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@Observable
class AuthViewModel { // AuthServices
    
    var userSession: FirebaseAuth.User? //= Auth.auth().currentUser
    var currentUser: User?
    
    init() {
        // To auto loged in when user already has a session.
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    private func validate() -> Bool {
//        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
//              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
//
//            errorMessage = "Please fill in all fields"
//
//            return
//        }
        
//        let emailPattern = #"^\S+@\S+\.\S+$"#
//        var result = email.range(of: emailPattern, options: .regularExpression)
//
//        guard result != nil else {
//            return
//        }
        return true
    }
    
    var isLoggedIn: Bool {
        userSession != nil //&& currentUser != nil
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("Login failed: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("Create user failed: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Logout failed: \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        currentUser = try? snapshot.data(as: User.self)
        
        print("Current user is: \(String(describing: currentUser))")
    }
}
