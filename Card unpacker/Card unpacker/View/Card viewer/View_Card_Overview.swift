//
//  View_Card_Overview.swift
//  Card unpacker
//
//  Created by delano sergeant on 07/01/2023.
//

import SwiftUI

struct View_Card_Overview: View {
    @ObservedObject var model: ViewModel = ViewModel(pack: false)
    
    
    var body: some View {
        NavigationView{
                ForEach (model.cards){
                    View_Card_Part(card: $0)
                }
        }.navigationTitle("Card list")
    }
}

struct View_Card_Part: View{
    var card: CardView<Card>
    
    var body: some View{
        Form{
            Section(header: Text(card.cards.name)){
                Text(card.cards.rarity)
                Text(String(card.cards.grade))
                Text(card.cards.nation)
            }
        }
    }
}
    

struct View_Card_Overview_Previews: PreviewProvider {
    static var previews: some View {
        View_Card_Overview()
    }
}
