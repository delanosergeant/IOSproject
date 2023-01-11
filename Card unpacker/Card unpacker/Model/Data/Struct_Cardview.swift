//
//  Struct_Cardview.swift
//  Card unpacker
//
//  Created by delano sergeant on 08/01/2023.
//

import Foundation

struct CardView<CardContent>: Identifiable where CardContent: Card {
    
    let id: UUID
    var cards: CardContent
    
    
    var isFaceUp:Bool
    
    init(id: UUID = UUID(), isFaceUp: Bool, cards: CardContent){
        self.id = id
        self.cards = cards
        self.isFaceUp = isFaceUp
        
    }
}
