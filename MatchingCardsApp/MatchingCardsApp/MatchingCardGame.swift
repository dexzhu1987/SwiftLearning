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
    var indexOfOneAndOnlyCardFaceUp: Int?  {
        get {
            var foundIndex: Int?
            for i in cards.indices {
                if cards[i].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = i
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for i in cards.indices {
                cards[i].isFaceUp = (i == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Match card game, chooseCard at \(index) is not in the indices")
        if !cards[index].isMatched {
            if let matchedIndex = indexOfOneAndOnlyCardFaceUp, matchedIndex != index { //  , == &&
                if cards[index].id ==  cards[matchedIndex].id {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
               
            } else {
                indexOfOneAndOnlyCardFaceUp = index
            }
        }
    }
    
    init(numberOfParisOfCards: Int) {
        assert(numberOfParisOfCards > 0, "MatchCardGame init \(numberOfParisOfCards) must have at least 1 pare of cards")
        
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

