//
//  MyScrollView.swift
//  Assignment6
//
//  Created by dexunzhu on 2018-05-29.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class MyScrollView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panView(with:)))
        addGestureRecognizer(panGesture)
    }
    
    @objc func panView(with gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: self)
        self.bounds.origin.y = self.bounds.origin.y - translation.y
        self.bounds.origin.x = self.bounds.origin.x - translation.x
        gestureRecognizer.setTranslation(CGPoint.zero, in: self)
    }
    
}
