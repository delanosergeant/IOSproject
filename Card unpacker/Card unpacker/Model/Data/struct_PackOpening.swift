//
//  struct_PackOpening.swift
//  Card unpacker
//
//  Created by delano sergeant on 08/01/2023.
//

import Foundation

struct PackOpening{
    
    var cardList: [CardView<Card>] = []
    
    init(){}
    
    
    mutating func flip(_ card: CardView<Card>){
        let cardIndex = cardList.firstIndex{$0.id == card.id}!
        
        guard !cardList[cardIndex].isFaceUp else {
            return
        }
        print(cardList[cardIndex].cards.name)
        cardList[cardIndex].isFaceUp = true
        }
    }

