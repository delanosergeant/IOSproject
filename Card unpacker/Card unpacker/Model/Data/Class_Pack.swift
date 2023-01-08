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
    
    func generatePack() -> Array<Card>{
        Cardlist = db.getOnePack(set: CardSet)
        return Cardlist
    }
}
