//
//  View_Card_Overview.swift
//  Card unpacker
//
//  Created by delano sergeant on 07/01/2023.
//

import SwiftUI

struct View_Card_Overview: View {
    
    private var cardList: [Card] = Card.AllCards
    
    var body: some View {
            NavigationView {
                List {
                    ForEach(cardList, id: \.name) { card in
                        NavigationLink(destination: DetailView(card: card)) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("\(card.name)").bold().lineLimit(2).scaledToFit()
                            }
                        }
                    }
                }
            }.navigationTitle("Card List")
        
    }
}
struct DetailView: View {
    var card: Card
    
    var body: some View {
        Spacer()
        VStack() {
            List{
                Text("\(card.name) ").bold()
                Text("\(card.nation) ").bold()
                Text("\(card.grade) ").bold()
                Text("\(card.rarity) ").bold()
                Text("\(card.setcode) ").bold()
            }.padding()
        }
    }
}


    struct View_Card_Part: View{
        var card: CardView<Card>
        
        var body: some View{
          
                Section(header: Text(card.cards.name)){
                    Text(card.cards.rarity)
                    Text(String(card.cards.grade))
                    Text(card.cards.nation)
                }
            
        }
    }
    
    
    struct View_Card_Overview_Previews: PreviewProvider {
        static var previews: some View {
            View_Card_Overview()
        }
    }

