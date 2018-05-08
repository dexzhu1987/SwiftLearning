//
//  main.swift
//  Function
//
//  Created by dexunzhu on 2018-05-08.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import Foundation

// Higher-Order functions - function that takes a function
// Closure - function without a name
// ex) (String) -> Bool : reference
var students = ["Miho", "Ryuma", "Lucas",
                "Kana", "Ayako", "Erik",
                "Cadiz", "Tima", "Dexun"]

var st = students.filter({(name: String) -> Bool in
    return name.count > 4
})

var nameMoreThan4Chars = {(name: String, age: Int) -> ((Int) -> Int) in
    let x = age
    print(name, x)
    return { (val: Int) -> Int in return val * 7 }
}

var r = nameMoreThan4Chars("Hunter", 29)(10)
print(r)

var element = { (tag: String) -> ((String) -> Void) in
    let start = "<\(tag)>"
    let end = "</\(tag)>"
    return { (content: String) in
        print("\(start)\(content)\(end)")
    }
}

var p = element("p")
p("what is this going to print?")
p("hello world")
var h1 = element("h1")
h1("Welcome to my webpage")

