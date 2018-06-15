//
//  DetailViewController.swift
//  Assignment8
//
//  Created by dexunzhu on 2018-06-05.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  
    var titleText: String!
    var priority: String!
    var detailedText: String!
    
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.text = titleText
        }
    }
    
    
    @IBOutlet weak var priorityLabel: UILabel!{
        didSet{
            priorityLabel.text = priority
        }
    }
    
    
    @IBOutlet weak var detailedLabel: UILabel!{
        didSet{
            detailedLabel.text = detailedText
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

