//
//  PlayingCardView.swift
//  PlayingCards
//
//  Created by dexunzhu on 2018-05-22.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {

    var rank: Int = 1
    var suit: String = "♠️"
    var isFaceUp: Bool = true
    
    private lazy var upperLeftCornerLabel: UILabel = creatCornerLabel()
    
    private func creatCornerLabel() -> UILabel {
        let label  = UILabel()
        label.numberOfLines = 0
        self.addSubview(label)
        return label
    }
    
    private func configureConerLabel(_ label: UILabel){
        label.attributedText = centeredAtrributedString(String(rank) + "\n" + suit, fontSize: 30)
        label.frame.size = CGSize.zero //no size
        label.sizeToFit() //make the size to content size
        label.isHidden = !isFaceUp
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay() //draw
        setNeedsLayout() //layoutSubview
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        // do not all this method
        // setneedsDisplay() -- trigged the draw
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
        
    }

    private func centeredAtrributedString (_ string: String, fontSize: CGFloat) -> NSAttributedString {
        //1.fontSize -> responsive
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        //2. alignment -> centred
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [.font: font, .paragraphStyle: paragraphStyle])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureConerLabel(upperLeftCornerLabel)
        upperLeftCornerLabel.frame.origin.x = bounds.origin.x + 10
        upperLeftCornerLabel.frame.origin.y = bounds.origin.y + 10
    }
    
}
