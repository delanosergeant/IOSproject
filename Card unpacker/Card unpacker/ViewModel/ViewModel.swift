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
        
        model = PackOpening()
        generatePack()
      
       model.cardList.shuffle()
    }
    
    func flip(_ card: CardView<Card>){
        model.flip(card)
    }
    
    var cards: [CardView<Card>]{
        model.cardList
    }
    
    func generatePackDB(set: String){
        if(pack){
            print("pack generated")
            for item in db.getOnePack(set: set){
                
                print("adding to pack:" + item.name)
                self.model.cardList.append(CardView(isFaceUp: false,cards:item))
            }
            
        }
        else{
            db.getCards(set: set){res in
                for item in res{
                    
                    print("adding to overview:" + item.name)
                    self.model.cardList.append(CardView( isFaceUp: false, cards: item))
                }
            }
        }
        
       
    }
    
    func generatePack(){
        model.cardList.removeAll()
        model.cardList.append(CardView( isFaceUp: false, cards: Card(name: "test C", grade: 0, text: "test", nation: "test", rarity: "C")))
        model.cardList.append(CardView( isFaceUp: false, cards: Card(name: "test C", grade: 0, text: "test", nation: "test", rarity: "C")))
        model.cardList.append(CardView( isFaceUp: false, cards: Card(name: "test C", grade: 0, text: "test", nation: "test", rarity: "C")))
        model.cardList.append(CardView( isFaceUp: false, cards: Card(name: "test C", grade: 0, text: "test", nation: "test", rarity: "C")))
        model.cardList.append(CardView( isFaceUp: false, cards: Card(name: "test C", grade: 0, text: "test", nation: "test", rarity: "R")))
        
        let random = Int.random(in: 1...100)
        
        switch(random){
        case 1:
            model.cardList.append(CardView( isFaceUp: false, cards: Card(name: "test R", grade: 0, text: "test", nation: "test", rarity: "DSR")))
            
            break
        case 2...12:
            model.cardList.append(CardView( isFaceUp: false, cards: Card(name: "test RR", grade: 0, text: "test", nation: "test", rarity: "RRR")))
            
            break
        case 13...50:
            model.cardList.append(CardView( isFaceUp: false, cards: Card(name: "test RRR", grade: 0, text: "test", nation: "test", rarity: "RR")))
            
            break
        default:
            model.cardList.append(CardView( isFaceUp: false, cards: Card(name: "test R", grade: 0, text: "test", nation: "test", rarity: "R")))
            
            break
        }
    }
}

