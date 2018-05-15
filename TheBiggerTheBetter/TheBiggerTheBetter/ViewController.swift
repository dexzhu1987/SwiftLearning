//
//  ViewController.swift
//  TheBiggerTheBetter
//
//  Created by dexunzhu on 2018-05-14.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrateRandomNumbers()
    }
    
    fileprivate func genrateRandomNumbers() {
        // Do any additional setup after loading the view, typically from a nib.
        let rand1 = arc4random_uniform(100)
        let rand2 = arc4random_uniform(100)
        
        leftButton.setTitle(String(rand1), for: .normal)
        rightButton.setTitle(String(rand2), for: .normal)
    }
    

    @IBAction func leftButtonClicked(_ sender: UIButton) {
        if let left = leftButton.titleLabel?.text, let right = rightButton.titleLabel?.text{
            if Int(left)! > Int(right)! {
                score += 1
            } else {
                score -= 1
            }
            scoreLabel.text = "Score: \(score)"
            
        }
        genrateRandomNumbers()
    }
    
    @IBAction func rightButtonClicked(_ sender: UIButton) {
        if let left = leftButton.titleLabel?.text, let right = rightButton.titleLabel?.text{
            if Int(left)! < Int(right)! {
                score += 1
            } else {
                score -= 1
            }
            scoreLabel.text = "Score: \(score)"
        }
        genrateRandomNumbers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

