//
//  main.swift
//  Collections
//
//  Created by dexunzhu on 2018-05-08.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import Foundation

var names: [String] = Array<String>()
var namess = [String]()

var scores = Dictionary<String, String>()
var ciccc_scores = [Student: Int]()
var s1 = Student(name: "Hunter", score: 90)
var s2 = Student(name: "Tima", score: 92)
var s3 = Student(name: "Alex", score: 63)

ciccc_scores[s1] = s1.score
ciccc_scores[s2] = s2.score
ciccc_scores[s3] = s3.score

if let sc = ciccc_scores[s1] {
    print(sc)
}


// Value types - copy!
var b = 10
var c = b
c = 11 // b won't change

// Struct is a value type
var elif = Student(name: "Elif", score: 100)
var a = elif
a.name = "Hachan"
print(elif.name)

// Access Modifiers
// public, open - library
// internal - default, within your project
// private(set) - only getter
// private - private

var studentsSet: Set<Student> = [s1, s2, s3]
studentsSet.insert(s1)
studentsSet.remove(s1)
var exist = studentsSet.contains(s1)
print(exist)
print(studentsSet.count)

