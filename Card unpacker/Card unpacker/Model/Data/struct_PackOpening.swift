//
//  struct_PackOpening.swift
//  Card unpacker
//
//  Created by delano sergeant on 08/01/2023.
//

import Foundation

struct PackOpening  {
    
    var cardList: [CardView<Card>] = []
    
    init(cardContent: Array<Card>){
        for item in cardContent{
            cardList.append(CardView(id: UUID(), isFaceUp: true, cards: item))
        }
    }
    
    
    mutating func flip(_ card: CardView<Card>){
        let cardIndex = cardList.firstIndex{$0.id == card.id}!
        
        guard !cardList[cardIndex].isFaceUp else {
            return
        }
        
        cardList[cardIndex].isFaceUp = true
        }
    }

