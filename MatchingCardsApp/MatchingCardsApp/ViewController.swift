//
//  ViewController.swift
//  MatchingCardsApp
//
//  Created by dexunzhu on 2018-05-14.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = MatchCardGame(numberOfParisOfCards: (cardButtons.count+1)/2) // lazy means this property will not be init unitl the property is being accessed/used
    
    private var flipCount = 0 {
        didSet {
            flipLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]! //select outlet Collection then ctl drap all the buttons to create an array
    @IBOutlet private weak var flipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func whenCardTouched(_ sender: UIButton) {//drap all the buttons action here to connect to the same func
        flipCount+=1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
           //update Ui
            updateUI()
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (timer) in
                if (self.flipCount % 2 == 0) {
                    for i in self.cardButtons.indices {
                        self.game.cards[i].isFaceUp = false
                    }
                }
                self.updateUI()
            }
        } else {
            print("Chosen card was not in CardButton")
        }
    }
    
    
    func updateUI() {
        for i in cardButtons.indices {
            let button = cardButtons[i]
            let card = game.cards[i]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.isHidden = card.isMatched ? true : false
            }
        }
    }
    
    private var emojiChoices = ["👻","🎃","🦇","😈","👺","🙀", "👹", "😱", "🕯","😵"]
    private var emoji = [Card: String]()
    func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card] ?? "!"
    }
}

