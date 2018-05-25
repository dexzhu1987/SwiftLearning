//
//  ViewController.swift
//  Assignment4
//
//  Created by dexunzhu on 2018-05-24.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

   
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    private var tipPercentage: Int = 15 {
        didSet {
            //option 1
            if let amount = Double(billAmountTextField.text!) {
                let tipAmount = amount * (Double(tipPercentage)/100.0)
                tipAmountLabel.text = String(format: "$ %.2f", tipAmount)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //keyboard disappear
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.delegate = self
        //make a rounded button
        calculateButton.layer.cornerRadius = 20
        calculateButton.clipsToBounds = true
        
        //regonize the tap and perform func (release keyboard)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyBoard(_ sender: UITapGestureRecognizer) {
        billAmountTextField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tipSliderChange(_ sender: UISlider) {
        tipPercentageLabel.text = String(format: "%d %%", Int(sender.value))
        tipPercentage = Int(sender.value)
        //option 2
//        if let amount = Double(billAmountTextField.text!) {
//            let tipAmount = amount * (Double(tipPercentage)/100.0)
//            tipAmountLabel.text = String(format: "$ %.2f", tipAmount)
//        }
    }
    
    @IBAction func calculateTip(_ sender: UIButton) {
        if let amount = Double(billAmountTextField.text!) {
            let tipAmount = amount * (Double(tipPercentage)/100.0)
            tipAmountLabel.text = String(format: "$ %.2f", tipAmount)
        }
    }
}

