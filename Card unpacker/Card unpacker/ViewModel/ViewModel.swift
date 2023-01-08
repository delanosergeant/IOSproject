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
            model = PackOpening(cardContent: db.getOnePack())
        }
        else{
            model = PackOpening(cardContent: db.getCards())
        }
    }
}
