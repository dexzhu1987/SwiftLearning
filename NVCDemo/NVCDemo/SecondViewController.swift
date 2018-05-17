//
//  SecondViewController.swift
//  NVCDemo
//
//  Created by dexunzhu on 2018-05-17.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataLabel.text = data
    }
    
}
