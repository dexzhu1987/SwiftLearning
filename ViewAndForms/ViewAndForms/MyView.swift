//
//  MyView.swift
//  ViewAndForms
//
//  Created by dexunzhu on 2018-05-18.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit

@IBDesignable //preview
class MyView: UIView {

    
    let label: UILabel = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
   
    @IBInspectable //you can change it at storyBoard - the fourth button - the type is neccessary
    var contentLabel: String = "Hello" {
        didSet {
            label.text = contentLabel
        }
    }
    
    @IBInspectable
    var starColor: UIColor = UIColor.yellow
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        print("got touched")
        label.text = "Yo"
    }
    
    
    override func draw(_ rect: CGRect) {
        //CGFloat - Core Graphics Float
        //CGPoint - struct with two CGFloats x , y
        //CGSize - struct with two CGFloats width, height
        //CGRect - STRUCT with a CGPoint AND a CGSize
//        var point = CGPoint(x: 10, y: 20)
//        var size = CGSize(width: 10, height: 20)
//        var Rect = CGRect(x: 10, y: 20, width: 10, height: 20)
        
        label.text = contentLabel
        self.addSubview(label)
        
        
        let path  = UIBezierPath()
        path.move(to: CGPoint(x: 80, y: 50))
        path.addLine(to: CGPoint(x: 140, y: 160))
        path.addLine(to: CGPoint(x: 10, y: 160))
        path.close()
        UIColor.green.setFill()
        UIColor.red.setStroke()
        path.lineWidth = 3.0
        path.fill()
        path.stroke()
//        path.addClip()
        
        
        let path2 = UIBezierPath(roundedRect: CGRect(x: 100, y: 100, width: 100, height: 100), cornerRadius: 10)
        UIColor.blue.setFill()
        path2.fill()
        

        let polygonPath = UIBezierPath()
        let xCenter: CGFloat = 100
        let yCenter: CGFloat = 100
        let w = CGFloat(200)
        let r = w / 2.0
        let flip: CGFloat = -1.0 // use this to flip the figure 1.0 or -1.0
        let polySide = CGFloat(5)
        let theta = 2.0 * Double.pi * Double(2.0 / polySide)
        polygonPath.move(to: CGPoint(x: xCenter, y: r * flip + yCenter))
        for i in 1..<Int(polySide) {
            let x: CGFloat = r * CGFloat( sin(Double(i) * theta) )
            let y: CGFloat = r * CGFloat( cos(Double(i) * theta) )
            polygonPath.addLine(to: CGPoint(x: x + xCenter, y: y * flip + yCenter))
        }
        polygonPath.close()
        UIColor.red.setStroke()
        UIColor.yellow.setFill()
        polygonPath.fill()
        polygonPath.stroke()

        // Draw a Star! Yellow Star!
        let star = UIBezierPath()
        star.move(to: CGPoint(x: 45.25, y: 0))
        star.addLine(to: CGPoint(x: 61.13, y: 23))
        star.addLine(to: CGPoint(x: 88.29, y: 30.75))
        star.addLine(to: CGPoint(x: 70.95, y: 52.71))
        star.addLine(to: CGPoint(x: 71.85, y: 80.5))
        star.addLine(to: CGPoint(x: 45.25, y: 71.07))
        star.addLine(to: CGPoint(x: 18.65, y: 80.5))
        star.addLine(to: CGPoint(x: 19.55, y: 52.71))
        star.addLine(to: CGPoint(x: 2.21, y: 30.75))
        star.addLine(to: CGPoint(x: 29.37, y: 23))
        star.close()
        starColor.setFill()
        star.fill()

        let str = "I am happy"
        let metrics = UIFontMetrics(forTextStyle: .body)
        let font = UIFont(name: "Helvetica", size: 20)
        let fontToUse = metrics.scaledFont(for: font!) //responsive to setting
        let text = NSAttributedString(string: str, attributes: [.font: fontToUse])
        text.draw(at: CGPoint(x: 100, y: 100))
        

    }
    
    

    
 

}
