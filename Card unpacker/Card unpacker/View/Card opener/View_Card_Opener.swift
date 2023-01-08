//
//  View_Card_Opener.swift
//  Card unpacker
//
//  Created by delano sergeant on 07/01/2023.
//

import SwiftUI

struct View_Card_Opener: View {
    
    @Environment(\.colorScheme) var colorScheme
    let db:FirebaseDB = FirebaseDB()
    @EnvironmentObject var model_Auth : Model_Auth
    
    @ObservedObject var Pack: ViewModel = ViewModel(pack: true)
    @Namespace private var cardSpace
    
    var body: some View{
        VStack{
            AspectRatioVGrid(
                Pack.cards, aspectRatio: 2/3, spacing:10){card in
                    View_Card(card: card)
                    .matchedGeometryEffect(id: card.id, in: cardSpace)
                    .zIndex(zIndex(for:card))
                    .foregroundColor(.blue)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            Pack.flip(card)
                        }
                    }
            }
        }
        .onAppear{
            Pack.generatePack(set: "DBT-01")
        }
        .padding()
        .navigationTitle("Pack opening")
       	
    }
    
    private func zIndex(for card: CardView<Card>) -> Double {
        Double(-Pack.cards.firstIndex{$0.id == card.id}!)
    }
    
}


