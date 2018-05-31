//
//  SectionHeaderView.swift
//  Assignment7
//
//  Created by dexunzhu on 2018-05-30.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SectionHeader"

class SectionHeader : UICollectionReusableView
{
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    
    var catergoryTitle: String! {
        didSet {
            categoryTitleLabel.text = catergoryTitle
        }
    }
    
}

