//
//  Class_Card.swift
//  Card unpacker
//
//  Created by delano sergeant on 07/01/2023.
//

import Foundation
import FirebaseFirestoreSwift


class Card : Codable, Identifiable, ObservableObject{
    
    //var id: UUID = UUID()
    private(set) var name: String
    private(set) var grade: Int
    private(set) var nation: String
    private(set) var rarity: String
    private(set) var setcode: String
    
    static let AllCards: [Card] = Bundle.main.decode(file:"DBT01")

    init(name: String, grade: Int, nation: String, rarity: String, setcode: String){
        self.name = name
        self.grade = grade
        self.nation = nation
        self.rarity = rarity
        self.setcode = setcode
    }
    

    static func RandomCard(rarity: String) ->  Card
    {
        let filtered = AllCards.filter{ card in
            card.rarity == rarity
        }
        
        return filtered.randomElement()!
        
    }

    /*enum CodingKeys: String, CodingKey {
           case name
           case grade
           case text
           case nation
           case rarity
       }*/
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let ref = self.url(forResource: file, withExtension: ".json") else {
            
            fatalError("Could not find \(file)  in bundle.")
        }
        
        guard let data = try? Data(contentsOf: ref) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}
