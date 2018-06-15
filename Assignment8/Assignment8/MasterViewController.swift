//
//  MasterViewController.swift
//  Assignment8
//
//  Created by dexunzhu on 2018-06-05.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    static var objects = [ToDo]()

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.delegate = self
        tableView.dataSource = self
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if MasterViewController.objects.isEmpty {
            MasterViewController.objects.append(ToDo(title: "Homework", todoDescription: "Assingment 8", priority: 2, isCompleted: false, dataString: "January 6, 2018"))
            MasterViewController.objects.append(ToDo(title: "Shopping", todoDescription: "Groceries", priority: 3, isCompleted: false, dataString: "December 10, 2017"))
            MasterViewController.objects.append(ToDo(title: "Review", todoDescription: "Algerithmn", priority: 4, isCompleted: true, dataString: "December 2, 2017"))
            MasterViewController.objects.append(ToDo(title: "Cook", todoDescription: "Dinner", priority: 1, isCompleted: false, dataString: "June 13, 2017"))
        }

        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func insertNewObject(_ sender: Any) {
         let newView  = self.storyboard?.instantiateViewController(withIdentifier: "newController")
         self.navigationController?.pushViewController(newView!, animated: true)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let controller = segue.destination as! DetailViewController
            if let cell = sender as? MyTableViewCell {
                if let indexPath = tableView.indexPath(for: cell) {
//                    controller.navigationItem.leftItemsSupplementBackButton = true
                    controller.titleText = MasterViewController.objects[indexPath.row].title
                    controller.detailedText = MasterViewController.objects[indexPath.row].todoDescription
                    controller.priority = String(MasterViewController.objects[indexPath.row].priority)
                }
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MasterViewController.objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        let string = MasterViewController.objects[indexPath.row].title
        cell.priorityLabel.text = String(MasterViewController.objects[indexPath.row].priority)
        cell.deadlineLabel.text = MasterViewController.objects[indexPath.row].deadLineString
        if (MasterViewController.objects[indexPath.row].isCompleted){
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: string)
            attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.titleLabel.attributedText = attributeString
        } else {
            cell.titleLabel.text = string
        }
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.addTarget(self, action: #selector(self.swipe(sender:)))
        swipeGesture.direction = UISwipeGestureRecognizerDirection.right
        cell.addGestureRecognizer(swipeGesture)
        return cell
    }
    
   
    
    @objc func swipe(sender: UISwipeGestureRecognizer){
        if let indexpath = tableView.indexPathForRow(at: sender.location(in: self.tableView)) {
            MasterViewController.objects[indexpath.row].isCompleted = true
            
        }
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            MasterViewController.objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView.isEditing {
            return .delete
        }
        
        return .none
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = MasterViewController.objects[sourceIndexPath.row]
        MasterViewController.objects.remove(at: sourceIndexPath.row)
        MasterViewController.objects.insert(item, at: destinationIndexPath.row)
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            MasterViewController.objects = MasterViewController.objects.sorted(by: {$0.priority < $1.priority})
            self.tableView.reloadData()
        case 1:
            MasterViewController.objects = MasterViewController.objects.sorted(by: {$0.deadLine.compare($1.deadLine) == .orderedAscending})
            self.tableView.reloadData()
        default:
            break
        }
    }
    
    
}

