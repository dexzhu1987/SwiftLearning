//
//  MatchingCardGame.swift
//  MatchingCardsApp
//
//  Created by dexunzhu on 2018-05-15.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import Foundation


class MatchCardGame {

    var unshuffledCards = [Card]()
    var cards = [Card]()
    var indexOfOneAndOnlyCardFaceUp: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchedIndex = indexOfOneAndOnlyCardFaceUp, matchedIndex != index { //  , == &&
                if cards[index].id ==  cards[matchedIndex].id {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyCardFaceUp = nil
            } else {
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyCardFaceUp = index
            }
        }
    }
    
    init(numberOfParisOfCards: Int) {
        for _ in 1...numberOfParisOfCards {
            let card = Card()
            unshuffledCards.append(card)
            unshuffledCards.append(card)
            // cards += [card, card]

        }
        //MARK: shuffle
        for _ in 0..<unshuffledCards.count
        {
            let rand = Int(arc4random_uniform(UInt32(unshuffledCards.count)))
            
            cards.append(unshuffledCards[rand])
            
            unshuffledCards.remove(at: rand)
        }

    }
}

