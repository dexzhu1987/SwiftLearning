//
//  MyImage.swift
//  Assignment7
//
//  Created by dexunzhu on 2018-05-31.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class MyImage: NSObject {
    var image: UIImage
    var tag1: String
    var tag2: String
    
    init(image: UIImage, tag1: String, tag2: String) {
        self.image = image
        self.tag1 = tag1
        self.tag2 = tag2
    }
    
}
