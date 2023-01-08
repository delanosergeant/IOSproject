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
    
    func getRandomCard(rarity:String, set: String) -> Card{
        var card: Card = Card(name: "", grade: 0, text: "", nation: "", rarity: "")
        var doc: [String : Any]
        var random: Int
        
        switch(rarity){
        case "R":
            random = Int.random(in: 1..<31)
            break
        case "RR":
            random = Int.random(in: 1..<16)
            break
        case "RRR":
            random = Int.random(in: 1..<11)
            break
        default:
            random = Int.random(in: 1..<66)
            break
        }
        
        let conn = Firestore.firestore().collection("cardlist").document(set).collection(rarity).document(String(random))
        
        conn.getDocument(as: Card.self) { result in
            switch result {
                case .success(let success):
                    card = success
                case .failure(let error):
                    // A `City` value could not be initialized from the DocumentSnapshot.
                    print("Error decoding card: \(error)")
                }
            }
        
        return card
    }
    
    static func populate(){
        
        for index in 2...15
        {
            let card:Card = Card(name: "temp" + String(index), grade: Int.random(in: 0...3), text: "temp" + String(index), nation: "temp" + String(index), rarity: "temp" + String(index))
            do{
                try Firestore.firestore().collection("cardlist").document("DBT-01").collection(String(index)).document("RR").setData(from: card)
            }catch let error{
                print( "Error with writing card to firestore: \(error)")
            }
        }
        
    }
}
