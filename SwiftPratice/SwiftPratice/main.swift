//
//  main.swift
//  SwiftPratice
//
//  Created by dexunzhu on 2018-05-03.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

func sendTextMessage(_ message: String, to lover: String, in country: String) {
    print("To my love \(lover) in \(country): \(message).")
}

sendTextMessage("I miss you", to: "Natsuki", in: "Shibuya, Japan")

let numbers = [4, 17, 34, 82]
func isDivisibleByTwo(_ num: Int) -> Bool {
    return num % 2 == 0
}

let someFunc: (Int) -> Bool = isDivisibleByTwo
print(someFunc(10))


func filterInts(_ numbers: [Int], _ includeNumber: (Int) -> Bool) -> [Int] {
    var result = [Int]()
    for number in numbers {
        if (includeNumber(number)) {
            result.append(number)
        }
    }
    return result
}

var result = filterInts(numbers, someFunc)
print(result)

var result1 = filterInts(numbers) { (number: Int) -> Bool in return number % 2 == 0 }
var result2 = filterInts(numbers) { number in number % 2 == 0 }
var result3 = filterInts(numbers) { $0 % 2 == 0 }
print(result1)
print(result2)
print(result3)

// filterInts: filters an Int array baseon the function you pass
var result4 = filterInts(numbers) { num in
    var sum = 0
    var number = num
    while number > 0 {
        sum += number % 10
        number = number / 10
    }
    return sum % 2 == 0
}

print(result4)
