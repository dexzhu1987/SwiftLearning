//
//  Card.swift
//  MatchingCardsApp
//
//  Created by dexunzhu on 2018-05-15.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import Foundation


struct Card: Hashable {
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    static var idMaker = 0
    
    static func getId() -> Int {
        idMaker += 1
        return idMaker
    }
    
    init() {
        self.id = Card.getId()
    }
    
    var hashValue: Int {
        return id * 12332
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
}
