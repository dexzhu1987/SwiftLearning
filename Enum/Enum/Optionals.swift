//
//  Optionals.swift
//  Enum
//
//  Created by dexunzhu on 2018-05-07.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import Foundation

enum MyOptional<T>{
    case none
    case some(T)
}

var hello: String?
var hello1: MyOptional<String> = .none
func a() -> String {
    print(hello!)
    
    switch hello1 {
    case .none:
        break
    // throw an error ( crash )
    case .some(let data): return data
    }
    return ""
}



var hello2: String? = "hello"
var hello3: MyOptional<String> = .some("hello")

func b() -> String {
    if let greeting = hello2 {}
    else {}
    
    switch hello3 {
    case .none: // do nothing
        break
    case .some(let data): return data
    }
    return ""
}

var hello4: String!
var hello5: MyOptional<String> = .none
func c() -> String {
    switch hello5 {
    case .none:
    break // throw an error (crash)
    case .some (let data): return data
    }
    return ""
}
