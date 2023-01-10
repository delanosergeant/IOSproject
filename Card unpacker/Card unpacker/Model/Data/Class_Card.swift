//
//  Class_Card.swift
//  Card unpacker
//
//  Created by delano sergeant on 07/01/2023.
//

import Foundation
import FirebaseFirestoreSwift


struct Card : Codable{
    
    private(set) var name: String
    private(set) var grade: Int
    private(set) var text: String
    private(set) var nation: String
    private(set) var rarity: String
    
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

