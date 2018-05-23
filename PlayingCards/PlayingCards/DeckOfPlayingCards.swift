//
//  DeckOfPlayingCards.swift
//  PlayingCards
//
//  Created by dexunzhu on 2018-05-22.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import Foundation

struct PlayingCardDeck
{
    var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
          return cards.remove(at: cards.count.randomInt)
        }
        return nil
    }
}

extension Int {
    var randomInt: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
