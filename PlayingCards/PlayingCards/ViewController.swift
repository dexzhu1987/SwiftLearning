//
//  ViewController.swift
//  PlayingCards
//
//  Created by dexunzhu on 2018-05-22.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var deck = PlayingCardDeck()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for _ in 0..<10 {
            if let card = deck.draw() {
                print(card)
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //animation
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // networking, dataBase
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        viewWillDisappear(animated)
        //clean up codes
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //if your bonds change, you want to reposition some of your subviews
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        //when your device rotats, view will/didLayoutSubviews got called and then call viewWillTransaction
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //it is rare, but ocasionally your device run low memory
        //this means a buildup of very large videos, image, sounds
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //this methods is called to all objects that come out of storyboard
        //can init stuff
    }
}

