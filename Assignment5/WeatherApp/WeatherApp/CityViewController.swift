//
//  CityViewController.swift
//  WeatherApp
//
//  Created by dexunzhu on 2018-05-24.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import UIKit

class CityViewController: ViewController {

    var detailedVC: ViewController?
    
    init() {
        super.init(nibName:nil, bundle:nil)
        self.detailedVC = ViewController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.detailedVC = ViewController()
    }
    
    func detailedVC(city c: City) -> ViewController {
        self.detailedVC!.view.backgroundColor = UIColor(patternImage: c.weatherDetail.imageResize(sizeChange: CGSize(width: self.detailedVC!.view.frame.size.width, height: self.detailedVC!.view.frame.size.height * 0.9)))
        return detailedVC!
    }
    
    
}
