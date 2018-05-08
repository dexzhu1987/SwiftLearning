//
//  File.swift
//  Collections
//
//  Created by dexunzhu on 2018-05-08.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import Foundation
// Type - class(ref), struct(val), enum(val)
//class - can be a parent, but need a constructor(init), and all values need to be inited
//stuct - can not be a parent, but give default contructor, and values are inited
struct Student : Hashable {
    var name: String
    private(set) var score: Int
    
    var hashValue: Int {
        return name.hashValue + score * 17 + 33
    }
    
    static func ==(lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
    
}
