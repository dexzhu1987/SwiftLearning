//
//  ToDo.swift
//  Assignment8
//
//  Created by dexunzhu on 2018-06-05.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class ToDo {
    var title : String
    var todoDescription: String
    var priority :  Int
    var isCompleted : Bool
    var deadLine: Date = Date()
    var deadLineString:  String
    
    init(title: String, todoDescription: String, priority: Int, isCompleted: Bool, dataString: String) {
        self.title = title
        self.todoDescription = todoDescription
        self.priority = priority
        self.isCompleted = isCompleted
        self.deadLineString = dataString
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        if let date = dateFormatter.date(from: dataString) {
            self.deadLine = date
        }
    }
    
    
}
