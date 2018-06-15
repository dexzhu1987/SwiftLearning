//
//  MyAddedNewViewController.swift
//  Assignment8
//
//  Created by dexunzhu on 2018-06-06.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class MyAddedNewViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var priorityText: UITextField!
    @IBOutlet weak var detailsText: UITextField!
    @IBOutlet weak var deadline: UIDatePicker!
    
    @IBAction func addItem(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let newToDo = ToDo(title: titleText.text!, todoDescription: detailsText.text!, priority: Int(priorityText.text!)!, isCompleted: false, dataString:  dateFormatter.string(from: deadline.date))
        MasterViewController.objects.append(newToDo)
        let newView  = self.storyboard?.instantiateViewController(withIdentifier: "masterVC")
        self.navigationController?.pushViewController(newView!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailsText.delegate = self
        self.priorityText.delegate = self
        self.titleText.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
