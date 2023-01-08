//
//  Struct_Cardview.swift
//  Card unpacker
//
//  Created by delano sergeant on 08/01/2023.
//

import Foundation

struct CardView<cardContent>: Identifiable{
    
    let id:UUID
    let cards: cardContent
    
    var isFaceUp:Bool
    
    init(id: UUID = UUID(), isFaceUp: Bool, cards: cardContent){
        self.id = id
        self.cards = cards
        self.isFaceUp = isFaceUp
    }
}
