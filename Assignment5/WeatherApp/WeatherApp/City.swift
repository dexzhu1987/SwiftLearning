//
//  City.swift
//  WeatherApp
//
//  Created by dexunzhu on 2018-05-24.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import UIKit

class City: NSObject {

    var weatherInform: String
    
    init(_ inform: String) {
        self.weatherInform = inform
    }
}
