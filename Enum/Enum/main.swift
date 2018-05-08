//
//  main.swift
//  Enum
//
//  Created by dexunzhu on 2018-05-07.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import Foundation

var MihoOrder: FastFoodMenuItem = .hamburger(numberOfPatties: 5)
var otherItem = FastFoodMenuItem.cookie

print(otherItem.isIncludedInSpecialOrder(number: 5))
print(MihoOrder.calories)
MihoOrder.switchToBeingACookie()

switch MihoOrder {
case .hamburger(let patties):
    if patties > 2 {
        print("That's too much! \(patties) patties Burgers?!")
    } else {
        print("\(patties) burger!")
    }
case .fries(let size): print("\(size) Fries!")
case .drink(let brand, let ounces): print("\(brand) Drink \(ounces) oz!")
case .cookie: print("Cookie!")
}

var x: String?

var y = x ?? "some"

switch x {
case .none: y = "some"
case .some(let data): y = data
}

var z = x?.uppercased()

switch x {
case .none:
    z = nil
case .some(let data):
    z = data.uppercased()
}

