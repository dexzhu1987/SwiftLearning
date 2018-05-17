//
//  ViewController.swift
//  NVCDemo
//
//  Created by dexunzhu on 2018-05-17.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textDataText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "first" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.data = textDataText.text
            }
        }
    }

}

