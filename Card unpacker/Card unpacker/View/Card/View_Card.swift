//
//  View_Card.swift
//  Card unpacker
//
//  Created by delano sergeant on 08/01/2023.
//

import SwiftUI

struct View_Card: View {
    
    let card: CardView<Card>
    
    init(card: CardView<Card>){
        self.card = card
    }
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Text(card.cards.name)
                    .animation(
                        .linear(duration: 1)
                        .repeatForever(autoreverses: false)
                        .delay(0.5)
                    )
            }.MakeCard(isFaceUp: card.isFaceUp)
        }.aspectRatio(2/3,contentMode: .fit)
    }
}
