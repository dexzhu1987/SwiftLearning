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
    var weatherDetail: UIImage
    
    init(_ inform: String, _ detail: UIImage) {
        self.weatherInform = inform
        self.weatherDetail = detail
    }
}
