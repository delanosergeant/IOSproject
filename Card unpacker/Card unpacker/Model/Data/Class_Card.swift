//
//  Class_Card.swift
//  Card unpacker
//
//  Created by delano sergeant on 07/01/2023.
//

import Foundation
import FirebaseFirestoreSwift


class Card : Codable{
    
    private var name: String
    private var grade: Int
    private var text: String
    private var nation: String
    private var rarity: String
    
    init(name: String, grade: Int, text : String, nation: String, rarity: String){
        self.name = name
        self.grade = grade
        self.text = text
        self.nation = nation
        self.rarity = rarity
    }
    
    enum CodingKeys: String, CodingKey {
           case name
           case grade
           case text
           case nation
           case rarity
       }
}

struct collection<CardSet>{
    // holds all cards of  set
    private(set) var Cardlist: Array<Card> = []
}
