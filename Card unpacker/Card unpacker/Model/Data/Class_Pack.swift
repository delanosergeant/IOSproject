//
//  Class_Pack.swift
//  Card unpacker
//
//  Created by delano sergeant on 07/01/2023.
//

import Foundation

class Pack{
    
    private(set) var Cardlist: Array<Card> = []
    private var CardSet:String
    
    let db: FirebaseDB = FirebaseDB()
    
    
    init(CardSet:String){
        self.CardSet = CardSet
    }
    
    func randomize(){
        
        let rarities = ["R", "RR", "RRR"]
        
        
        Cardlist.append(db.getRandomCard(rarity: rarities.randomElement()!,set: CardSet))
    }
}
