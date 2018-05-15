//
//  Card.swift
//  MatchingCardsApp
//
//  Created by dexunzhu on 2018-05-15.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import Foundation


struct Card {
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
}
