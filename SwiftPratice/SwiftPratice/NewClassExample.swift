//
//  NewClassExample.swift
//  SwiftPratice
//
//  Created by dexunzhu on 2018-05-09.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import Foundation

class Movie { // extend a super class or conform to the protocol. ex) : , , , ,
    // Class - all properties have to be initialized. (initial value)
    // 1. give all properties initial values.
    // 2. make properties optional.
    // 3. make initializer (constructor)
    
    // *Stored properties
    var title: String = "" {
        // Property Observers
        didSet {
            print("Title is changed!")
        }
        
        willSet {
            print("Title is about to be changed!")
        }
    }
    // static : same as Java
    private var releaseYear: Int
    var director: String? // let director: String? = nil (x)
    let genre: String
    // *Computed properties: no storage
    // by default (read-only), but you can make it writable
    var price: Int {
        get {
            switch self.releaseYear {
            case 1990...2000:
                return 5
            case 2001...2010:
                return 8
            case 2011...2018:
                return 15
            default:
                return 3
            }
        }
        set(newPrice) {
            if (newPrice > 50) {
                self.title = "\(self.title) (Popular)"
            }
            // self.price = newPrice (x) // store newPrice to self.price
        }
    }
    
    init(title: String, director: String, genre: String, releaseYear: Int = 2018) {
        self.title = title
        self.releaseYear = releaseYear
        self.director = director
        self.genre = genre
    }
    
}
