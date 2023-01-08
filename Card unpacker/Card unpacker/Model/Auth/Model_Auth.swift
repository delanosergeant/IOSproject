//
//  Model_Auth.swift
//  Card unpacker
//
//  Created by delano sergeant on 06/01/2023.
//

import Foundation
import Firebase

class Model_Auth: ObservableObject{
    let auth = Auth.auth()
    var user : FirebaseAuth.User?
    var dbController = FirebaseDB()
    var db : FirebaseDB  = FirebaseDB()
    
    @Published var loggedIn = false
    
    var isLoggedIN:Bool{ return user != nil }
    
    func login(email: String, password: String, completion: @escaping (Bool)-> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {
            [weak self]result, error in
            guard result != nil, error == nil else{
                completion(false)
                return
            }
            
            DispatchQueue.main.async {
                self?.loggedIn = true
                self?.user = Auth.auth().currentUser!
                completion(self!.loggedIn)
            }
        }
   }
    
   func signUp(email: String, password: String, completion: @escaping (Bool)-> Void) {
            Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
                guard result != nil, error == nil else{
                    completion(false)
                    return
                }
                
                DispatchQueue.main.async {
                    self?.loggedIn = true
                    self?.user = Auth.auth().currentUser!
                    completion(self!.loggedIn)
                }
            }
        }
    
    
   
}
