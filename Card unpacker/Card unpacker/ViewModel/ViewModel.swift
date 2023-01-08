//
//  ViewModel.swift
//  Card unpacker
//
//  Created by delano sergeant on 08/01/2023.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published private var model: PackOpening
    private var db : FirebaseDB = FirebaseDB()
    private var pack: Bool
    
    
    init(pack:Bool){
        self.pack = pack
        if(pack){
            model = PackOpening(cardContent: db.getOnePack(set: "DBT-01"))
        }
        else{
            model = PackOpening(cardContent: db.getCards(set: "DBT-01"))
        }
    }
    
    func flip(_ card: CardView<Card>){
        model.flip(card)
    }
    
    var cards: [CardView<Card>]{
        model.cardList
    }
    
    func generatePack(set: String){
        if(pack){
            model = PackOpening(cardContent: db.getOnePack(set: set))
        }
        else{
            model = PackOpening(cardContent: db.getCards(set: set))
        }
        
       
    }
}
