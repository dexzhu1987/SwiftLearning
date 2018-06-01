//
//  MyCollectionViewCell.swift
//  Assignment7
//
//  Created by dexunzhu on 2018-05-30.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var check: UIImageView!
    
    var isEditing: Bool = false {
        didSet{
            check.isHidden = !isEditing
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isEditing {
                if check.image ==  UIImage(named: "Checked")!, isSelected {
                    check.image = UIImage(named: "Unchecked")!
                } else if check.image ==  UIImage(named: "Unchecked")!, isSelected {
                    check.image = UIImage(named: "Checked")!
                } 
            }
        }
    }
}
