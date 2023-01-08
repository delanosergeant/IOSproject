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
                shape.fill().foregroundColor(.black)
                shape.strokeBorder(lineWidth: 4)
            }
            else{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 1)
            }
        }
        .rotationEffect(.degrees(animateable))
    }
}

extension View {
    func MakeCard(isFaceUp: Bool) -> some View{
        self.modifier(ViewModifier_Card(isFaceUp: isFaceUp))
    }
}

