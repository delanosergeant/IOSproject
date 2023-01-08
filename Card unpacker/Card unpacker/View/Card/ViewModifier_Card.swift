//
//  View_Card.swift
//  Card unpacker
//
//  Created by delano sergeant on 08/01/2023.
//

import SwiftUI

struct ViewModifier_Card: ViewModifier, AnimatableModifier {
   
        var animateable: Double
        
        init(isFaceUp: Bool){
            animateable = isFaceUp ?  0.001 : 180
        }
    func body(content: Content) -> some View{
        let shape = RoundedRectangle(cornerRadius: 5)
        ZStack{
            if animateable < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4)
            }
            else{
                shape.fill()
                shape.strokeBorder(lineWidth: 1)
            }
            content.opacity(animateable < 90 ? 1 : 0)
        }
        .rotation3DEffect(.degrees(animateable),axis: (0,1,0))
    }
}

extension View {
    func MakeCard(isFaceUp: Bool) -> some View{
        self.modifier(ViewModifier_Card(isFaceUp: isFaceUp))
    }
}

