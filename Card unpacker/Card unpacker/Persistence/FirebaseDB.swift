//
//  FirebaseDB.swift
//  Card unpacker
//
//  Created by delano sergeant on 06/01/2023.
//

import Foundation
import Firebase

class FirebaseDB: ObservableObject{
    
    
    let db = Database.database().reference()
    var Username : String = "nil"
    
    
    func writeData(endpoint: String, parameters: [String: Any]){
           let userID = Auth.auth().currentUser!.uid
           db.child(endpoint).child(userID).updateChildValues(parameters) { (error, ref) in
               if let err = error {
                   print(err.localizedDescription)
                   return
               }
           }
       }
}
